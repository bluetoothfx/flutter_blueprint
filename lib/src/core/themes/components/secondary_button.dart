import 'package:flutter/material.dart';
import 'package:flutter_blueprint/src/core/themes/components/button_size.dart';
import 'package:flutter_blueprint/src/core/themes/spacing/spacing_constants.dart';
import 'package:flutter_blueprint/src/core/utils/context_extension.dart';

class SecondaryButton extends StatefulWidget {
  final BuildContext context;
  final String? text;
  final ButtonSize size;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final ValueChanged<bool>? onHover;
  final ValueChanged<bool>? onFocusChange;
  final ButtonStyle? style;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool isApplyVerticalPadding;
  final Clip clipBehavior;
  final WidgetStatesController? statesController;
  final bool isLoading;
  final String? trackingName;

  const SecondaryButton(
    this.context, {
    super.key,
    required this.size,
    this.text,
    this.leftIcon,
    this.rightIcon,
    this.onPressed,
    this.onLongPress,
    this.onHover,
    this.onFocusChange,
    this.style,
    this.focusNode,
    this.autofocus = false,
    this.isApplyVerticalPadding = true,
    this.clipBehavior = Clip.none,
    this.statesController,
    this.isLoading = false,
    this.trackingName,
  });

  factory SecondaryButton.sm(
    BuildContext context, {
    Key? key,
    String? text,
    Widget? leftIcon,
    Widget? rightIcon,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    bool isApplyVerticalPadding = true,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
    bool isLoading = false,
    String? trackingName,
  }) {
    return SecondaryButton(
      context,
      size: ButtonSize.sm,
      key: key,
      text: text,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      isApplyVerticalPadding: isApplyVerticalPadding,

      clipBehavior: clipBehavior,
      statesController: statesController,
      isLoading: isLoading,
      trackingName: trackingName,
    );
  }

  factory SecondaryButton.md(
    BuildContext context, {
    Key? key,
    String? text,
    Widget? leftIcon,
    Widget? rightIcon,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    bool isApplyVerticalPadding = true,
    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
    bool isLoading = false,
    String? trackingName,
  }) {
    return SecondaryButton(
      context,
      size: ButtonSize.md,
      key: key,
      text: text,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      isApplyVerticalPadding: isApplyVerticalPadding,
      clipBehavior: clipBehavior,
      statesController: statesController,
      isLoading: isLoading,
      trackingName: trackingName,
    );
  }

  factory SecondaryButton.lg(
    BuildContext context, {
    Key? key,
    String? text,
    Widget? leftIcon,
    Widget? rightIcon,
    VoidCallback? onPressed,
    VoidCallback? onLongPress,
    ValueChanged<bool>? onHover,
    ValueChanged<bool>? onFocusChange,
    ButtonStyle? style,
    FocusNode? focusNode,
    bool autofocus = false,
    bool isApplyVerticalPadding = true,

    Clip clipBehavior = Clip.none,
    WidgetStatesController? statesController,
    bool isLoading = false,
    String? trackingName,
  }) {
    return SecondaryButton(
      context,
      size: ButtonSize.lg,
      key: key,
      text: text,
      leftIcon: leftIcon,
      rightIcon: rightIcon,
      onPressed: onPressed,
      onLongPress: onLongPress,
      onHover: onHover,
      onFocusChange: onFocusChange,
      style: style,
      focusNode: focusNode,
      autofocus: autofocus,
      isApplyVerticalPadding: isApplyVerticalPadding,
      clipBehavior: clipBehavior,
      statesController: statesController,
      isLoading: isLoading,
      trackingName: trackingName,
    );
  }

  @override
  SecondaryButtonState createState() => SecondaryButtonState();
}

class SecondaryButtonState extends State<SecondaryButton> {
  @override
  Widget build(BuildContext context) {
    Color backgroundColor = widget.context.appColors.systemSecondary;
    final hasText = widget.text != null && widget.text!.isNotEmpty;
    double verticalPadding;
    double horizontalPadding;
    double buttonHeight;

    VoidCallback? onPressed;
    if (widget.trackingName != null && widget.onPressed != null) {
      onPressed = () {
        widget.onPressed!();
      };
    } else {
      onPressed = widget.onPressed;
    }

    switch (widget.size) {
      case ButtonSize.sm:
        buttonHeight = 36;
        verticalPadding = widget.isApplyVerticalPadding
            ? AppSpacingConstants.md
            : AppSpacingConstants.none;
        horizontalPadding = AppSpacingConstants.lg;
        break;
      case ButtonSize.md:
        buttonHeight = 48;
        verticalPadding = widget.isApplyVerticalPadding
            ? AppSpacingConstants.lg
            : AppSpacingConstants.none;
        horizontalPadding = AppSpacingConstants.xl;
        break;
      case ButtonSize.lg:
        buttonHeight = 56;
        verticalPadding = widget.isApplyVerticalPadding
            ? AppSpacingConstants.xl
            : AppSpacingConstants.none;
        horizontalPadding = AppSpacingConstants.xl2;
        break;
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: 0,
        maxWidth: double.infinity,
        minHeight: 0,
        maxHeight: double.infinity,
      ),
      child: Container(
        height: buttonHeight,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
        child: ElevatedButton(
          key: widget.key,
          onPressed: () {
            onPressed != null ? onPressed() : () {};
          },
          onLongPress: widget.onLongPress,
          onHover: widget.onHover,
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            padding: EdgeInsets.zero,
            elevation: 0,
          ),
          focusNode: widget.focusNode,
          autofocus: widget.autofocus,
          clipBehavior: widget.clipBehavior,
          statesController: widget.statesController,
          child: Padding(
            padding: hasText
                ? EdgeInsets.symmetric(
                    horizontal: horizontalPadding,
                    vertical: verticalPadding,
                  )
                : EdgeInsets.all(verticalPadding),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (widget.leftIcon != null) ...[
                  SizedBox(width: 20.0, height: 20.0, child: widget.leftIcon),
                  if (hasText) ...[
                    SizedBox(width: AppSpacingConstants.xs),
                    SizedBox(width: AppSpacingConstants.xxs),
                  ],
                ],
                if (hasText) ...[
                  Flexible(
                    child: Text(
                      widget.text!,
                      overflow: TextOverflow.ellipsis,
                      // Truncate if necessary
                      maxLines: 1,
                      softWrap: false,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: context.appColors.systemBase),
                    ),
                  ),
                ],
                if (widget.rightIcon != null) ...[
                  if (hasText) ...[
                    SizedBox(width: AppSpacingConstants.xxs),
                    SizedBox(width: AppSpacingConstants.xs),
                  ],
                  SizedBox(
                    width: 20.0,
                    height: 20.0,
                    child: widget.rightIcon,
                  )
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
