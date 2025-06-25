import 'package:bloc/bloc.dart';
import 'package:flutter_blueprint/src/core/network/utils/result.dart';
import 'package:flutter_blueprint/src/features/home/domain/repositories/i_recipe_repository.dart';
import 'package:flutter_blueprint/src/features/home/presentation/bloc/recipe_event.dart';
import 'package:flutter_blueprint/src/features/home/presentation/bloc/recipe_state.dart';

class RecipeBloc extends Bloc<RecipeEvent, RecipeState> {
  final IRecipeRepository recipeRepository;

  RecipeBloc({required this.recipeRepository}) : super(RecipeInitial()) {
    on<RecipeEvent>(getRecipe);
  }

  Future<void> getRecipe(RecipeEvent event, Emitter<RecipeState> emitter) async {
    switch (event) {
      case RecipeInitEvent():
        break;
      case RecipeStartEvent():
        emitter(RecipeInProgress());
        var response = await recipeRepository.getRecipes();
        response.fold(
          (result) {
            emitter(RecipeResult(result));
          },
          (error) {
            emit(RecipeError(error.message));
          },
        );
        // try {
        //   //todo use folding here
        //   //emitter(RecipeResult(result));
        // } catch (e) {
        //   if (e is AppException) {
        //     emit(RecipeError(e.message));
        //   } else {
        //     emit(const RecipeError("An unknown error occurred."));
        //   }
        // }
        break;
    }
  }
}
