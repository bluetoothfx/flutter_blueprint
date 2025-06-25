import 'package:flutter_blueprint/src/core/network/exceptions/app_exception.dart';
import 'package:flutter_blueprint/src/core/network/utils/result.dart';
import 'package:flutter_blueprint/src/features/home/data/models/recipe_response.dart';

abstract interface class IRecipeRepository {
  Future<Result<RecipeResponse, AppException>> getRecipes();
}
