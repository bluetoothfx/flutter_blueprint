import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blueprint/src/core/utils/context_extension.dart';
import 'package:flutter_blueprint/src/features/home/data/models/recipe.dart';

class RecipeItem extends StatelessWidget {
  final Recipe? recipe;
  VoidCallback onItemClick;

  RecipeItem({super.key, required this.recipe, required this.onItemClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onItemClick.call();
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        color: context.appColors.systemBase,
        elevation: .1,
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              // Leading image
              SizedBox(
                height: 120,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: CachedNetworkImage(
                    imageUrl: recipe?.image ?? "",
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(
                      child: SizedBox(
                        height: 50,
                        width: 50,
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Column for title, subtitle, and trailing icon
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      recipe?.name ?? "",
                      style: context.textTheme.titleLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Cuisine: ${recipe?.cuisine ?? ""}",
                      style: context.textTheme.labelLarge,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Difficulty: ${recipe?.difficulty ?? ""}",
                      style: context.textTheme.labelLarge,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          '${recipe?.reviewCount} reviews',
                          style: context.textTheme.labelSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Trailing icon
              IconButton(
                icon: const Icon(Icons.arrow_forward_ios, size: 16),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
