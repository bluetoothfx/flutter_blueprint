import 'package:flutter/material.dart';
import 'package:flutter_blueprint/src/core/utils/context_extension.dart';

class AppSwitchToggle extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isEnabled;

  const AppSwitchToggle({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: context.textTheme.labelLarge,
          ),
        ),
        Switch(
          value: value,
          onChanged: isEnabled ? onChanged : null,
          activeColor: context.appColors.systemPrimary,
        ),
      ],
    );
  }
}
