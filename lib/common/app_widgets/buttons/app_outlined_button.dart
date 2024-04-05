import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:arena_club/common/extensions/theme_data_extension.dart';
import 'package:flutter/material.dart';

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    required this.onTap,
    required this.text,
    this.backgroundColor,
    this.borderColor,
    this.textColor,
    this.prefixIcon,
  });

  final VoidCallback onTap;
  final String text;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final Widget? prefixIcon;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      color: backgroundColor ?? context.theme.outlinedButtonColor,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            border: Border.all(
              color: borderColor ?? context.theme.outlinedButtonBorderColor,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (prefixIcon != null)
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: prefixIcon,
                ),
              Text(
                text,
                style: context.textTheme.s16w600(
                  context,
                  textColor ?? context.theme.outlinedButtonTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
