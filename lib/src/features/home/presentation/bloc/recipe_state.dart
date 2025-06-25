import 'package:flutter_blueprint/src/features/home/data/models/recipe_response.dart';
import 'package:equatable/equatable.dart';

sealed class RecipeState extends Equatable {
  const RecipeState();

  @override
  List<Object> get props => [];
}

final class RecipeInitial extends RecipeState {}

final class RecipeInProgress extends RecipeState {}

final class RecipeError extends RecipeState {
  final String message;

  const RecipeError(this.message);

  @override
  List<Object> get props => [message];
}

final class RecipeResult extends RecipeState {
  final RecipeResponse? recipeBaseResponse;

  const RecipeResult(this.recipeBaseResponse);
}
