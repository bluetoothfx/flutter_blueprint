import 'package:flutter/material.dart';

class AppSwitchToggle extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool isEnabled;

  const AppSwitchToggle({
    Key? key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.isEnabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isEnabled ? theme.colorScheme.onBackground : theme.disabledColor,
            ),
          ),
        ),
        Switch(
          value: value,
          onChanged: isEnabled ? onChanged : null,
          activeColor: theme.colorScheme.primary,
        ),
      ],
    );
  }
}
