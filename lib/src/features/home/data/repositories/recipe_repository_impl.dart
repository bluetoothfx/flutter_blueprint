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

    throw UnimplementedError();
  }
}
