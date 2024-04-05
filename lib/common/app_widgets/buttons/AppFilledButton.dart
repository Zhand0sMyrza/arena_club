import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:arena_club/common/extensions/theme_data_extension.dart';
import 'package:flutter/material.dart';

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({
    super.key,
    required this.text,
    required this.onTap,
    this.backgroundColor,
    this.textColor,
    this.prefixIcon,
    this.enabled = true,
    this.loading = false,
  });

  final VoidCallback? onTap;
  final String text;
  final Color? backgroundColor;
  final Color? textColor;
  final Icon? prefixIcon;
  final bool enabled;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.hardEdge,
      color: enabled
          ? backgroundColor ?? context.theme.filledButtonColor
          : context.theme.filledButtonColor.withOpacity(0.1),
      child: InkWell(
        onTap: loading ? null : onTap,
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(12),
          child: loading
              ? const Center(
                child: SizedBox(
                    height: 22,
                    width: 22,
                    child: CircularProgressIndicator(),
                  ),
              )
              : Row(
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
                        enabled
                            ? textColor ?? Colors.black
                            : context.theme.hintText,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
