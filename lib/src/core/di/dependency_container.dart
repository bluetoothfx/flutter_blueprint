import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_blueprint/src/core/network/connection_checker/i_network_connection_status.dart';
import 'package:flutter_blueprint/src/core/network/connection_checker/network_connection_status.dart';
import 'package:flutter_blueprint/src/core/network/i_api_client.dart';
import 'package:flutter_blueprint/src/core/network/dio_client.dart';
import 'package:flutter_blueprint/src/core/network/interceptors/connectivity_status_interceptor.dart';
import 'package:flutter_blueprint/src/features/home/data/repositories/recipe_repository_impl.dart';
import 'package:flutter_blueprint/src/features/home/domain/repositories/i_recipe_repository.dart';
import 'package:flutter_blueprint/src/features/home/presentation/bloc/recipe_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final inject = GetIt.instance;

Future<void> init() async {

  //network
  inject.registerLazySingleton<INetworkConnectionStatus>(
    () => NetworkConnectionStatus(connectionChecker: InternetConnectionChecker.createInstance()),
  );
  inject.registerLazySingleton(() => ConnectivityInterceptor(networkStatusInfo: inject()));

  IApiClient apiClient = _initApiClient();

  // Repository
  inject.registerLazySingleton<IRecipeRepository>(() => RecipeRepository(networkClient: apiClient));

  // Bloc
  inject.registerLazySingleton(() => RecipeBloc(recipeRepository: inject()));

  // Storage

  //Theme configuration
}

IApiClient _initApiClient() {
  final dio = Dio();
  final baseUrl = 'https://dummyjson.com/'; //buildConfig.baseURL;
  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
  );
  dio.options = options;

  final prettyDioLogger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: false,
    error: true,
    compact: true,
    maxWidth: 90,
  );

  dio.interceptors.add(prettyDioLogger);
  var connectivityInterceptor = inject.get<ConnectivityInterceptor>();
  dio.interceptors.add(connectivityInterceptor);

  //http override
  (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () =>
      HttpClient()..badCertificateCallback = (X509Certificate cert, String host, int port) => true;

  final IApiClient apiInterface = DioClient(dio: dio);

  return apiInterface;
}
