import 'package:flutter/material.dart';
import 'package:flutter_blueprint/src/core/themes/components/button_size.dart';
import 'package:flutter_blueprint/src/core/themes/components/drop_down_widget.dart';
import 'package:flutter_blueprint/src/core/themes/components/primary_button.dart';
import 'package:flutter_blueprint/src/core/themes/components/secondary_button.dart';
import 'package:flutter_blueprint/src/core/themes/components/tertiary_button.dart';
import 'package:flutter_blueprint/src/core/themes/spacing/app_values.dart';
import 'package:flutter_blueprint/src/core/themes/spacing/spacing_constants.dart';
import 'package:flutter_blueprint/src/core/utils/context_extension.dart';

class RecipeDetailsPage extends StatefulWidget {
  const RecipeDetailsPage({super.key});

  @override
  State<RecipeDetailsPage> createState() => _RecipeDetailsPageState();
}

class _RecipeDetailsPageState extends State<RecipeDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.appColors.systemPrimary,
        title: const Align(alignment: Alignment.centerLeft, child: Text("Blueprint Template")),
      ),
      body: Container(
        margin: const EdgeInsets.all(AppSpacingConstants.xl),
        child: ListView(
          children: [
            gapH8,
            PrimaryButton(context, text: "Button Primary Large", size: ButtonSize.lg),
            gapH8,
            PrimaryButton(context, text: "Button Primary Medium", size: ButtonSize.md),
            gapH8,
            PrimaryButton(context, text: "Button Primary Small", size: ButtonSize.sm),
            gapH8,
            SecondaryButton(context, text: "Button Secondary Large", size: ButtonSize.lg),
            gapH8,
            SecondaryButton(context, text: "Button Secondary Medium", size: ButtonSize.md),
            gapH8,
            SecondaryButton(context, text: "Button Secondary Small", size: ButtonSize.sm),
            gapH8,
            TertiaryButton(context, text: "Tertiary Secondary Large", size: ButtonSize.lg),
            gapH8,
            TertiaryButton(context, text: "Tertiary Secondary Medium", size: ButtonSize.md),
            gapH8,
            TertiaryButton(context, text: "Tertiary Secondary Small", size: ButtonSize.sm),
            gapH8,
            Expanded(
              child: DropDownWidget(
                title: "Status",
                items: [
                  Item(id: 0, title: "Select Gender"),
                  Item(id: 1, title: "Male"),
                  Item(id: 2, title: "Female"),
                ],
                selectedId: 0,
                onSelected: (Item value) {

                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
