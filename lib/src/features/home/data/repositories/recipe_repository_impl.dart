import 'package:flutter_blueprint/src/core/network/i_api_client.dart';
import 'package:flutter_blueprint/src/core/network/exceptions/app_exception.dart';
import 'package:flutter_blueprint/src/core/network/utils/result.dart';
import 'package:flutter_blueprint/src/features/home/data/models/recipe_response.dart';
import 'package:flutter_blueprint/src/features/home/domain/repositories/i_recipe_repository.dart';

class RecipeRepository implements IRecipeRepository {

  final IApiClient networkClient;

  RecipeRepository({required this.networkClient});

  @override
  Future<Result<RecipeResponse, AppException>> getRecipes() {
    // TODO: implement getRecipes
    // implement icons
    // implement flavour
    // implement frezz

    throw UnimplementedError();
  }

  // @override
  // Future<Result<List<RemoteWorkUiData>, AppException>> fetchRemoteWork(
  //     RemoteWorkRequestParam remoteWorkRequestParam) async {
  //   if (!await _iNetworkInfo.isConnected) {
  //     return Failure(AppException(message: AppStrings.noInternet));
  //   } else {
  //     try {
  //       final remoteWorkApplicationsFuture = await _fetchRemoteWorkApiCall(remoteWorkRequestParam);
  //       remoteWorkApplicationsFuture
  //           .sort((a, b) =>
  //       (b.created.millisecondsSinceEpoch -
  //           a.created.millisecondsSinceEpoch));
  //       List<RemoteWorkUiData> remoteWorks = RemoteWork.toDomain(remoteWorkApplicationsFuture);
  //       return Success(remoteWorks);
  //     } on DioException catch (e) {
  //       final appException = ErrorHandler().handleDioError(e);
  //       return Failure(appException);
  //     }
  //   }
  // }
  //
  // Future<List<RemoteWork>> _fetchRemoteWorkApiCall(
  //     RemoteWorkRequestParam remoteWorkRequestParam) async {
  //   try {
  //     final Map<String, dynamic> params = {
  //       'fromDate': remoteWorkRequestParam.fromDate,
  //       'toDate': remoteWorkRequestParam.toDate,
  //     };
  //     if (remoteWorkRequestParam.remoteWorkType > 0) {
  //       params['ApplicationType'] = remoteWorkRequestParam.remoteWorkType;
  //     }
  //
  //     final userId = remoteWorkRequestParam.userId == 0
  //         ? await _iCacheService.read(key: Constants.id)
  //         : remoteWorkRequestParam.userId;
  //     final response = await _apiClient.get(
  //       endpoint: 'api/Users/$userId/RemoteWorkApplications',
  //       params: params,
  //     );
  //
  //     final List<dynamic> jsonData = response.data;
  //     List<RemoteWork> remoteWorkList = RemoteWork.parseRemoteWorkList(jsonData);
  //     remoteWorkList.sort((a, b) => b.created.compareTo(a.created));
  //     return remoteWorkList;
  //   } on DioException {
  //     rethrow;
  //   }
  // }


}
