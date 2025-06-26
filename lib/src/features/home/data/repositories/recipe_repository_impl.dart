import 'package:flutter_blueprint/src/core/constants/end_point_constants.dart';
import 'package:flutter_blueprint/src/core/network/i_api_client.dart';
import 'package:flutter_blueprint/src/core/network/exceptions/app_exception.dart';
import 'package:flutter_blueprint/src/core/network/utils/error_handler.dart';
import 'package:flutter_blueprint/src/core/network/utils/result.dart';
import 'package:flutter_blueprint/src/features/home/data/models/recipe_response.dart';
import 'package:flutter_blueprint/src/features/home/domain/repositories/i_recipe_repository.dart';

class RecipeRepository implements IRecipeRepository {
  final IApiClient networkClient;

  RecipeRepository({required this.networkClient});

  @override
  Future<Result<RecipeResponse, AppException>> getRecipes() async {
    try {
      final response = await networkClient.get(endpoint: EndPointConstants.getRecipesEndPoint);
      return Success(RecipeResponse.fromJson(response.data));
    } catch (ex) {
      final error = ErrorHandler.handle(ex);
      return Failure(AppException(code: error.failure.code, message: error.failure.message));
    }
  }
}
