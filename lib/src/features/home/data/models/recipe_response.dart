import 'package:flutter_blueprint/src/features/home/data/models/recipe.dart';

class RecipeResponse {
  List<Recipe>? recipe;

  RecipeResponse({this.recipe});

  RecipeResponse.fromJson(Map<String, dynamic> json) {
    if (json['recipes'] != null) {
      recipe = <Recipe>[];
      json['recipes'].forEach((v) {
        recipe!.add(Recipe.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (recipe != null) {
      data['recipes'] = recipe!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
