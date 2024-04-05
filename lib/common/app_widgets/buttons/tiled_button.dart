import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class TiledButton extends StatelessWidget {
  const TiledButton({
    super.key,
    required this.onTap,
    this.icon,
    required this.label,
    this.suffixIcon,
    this.padding,
    this.hideDivider = false,
  });

  final VoidCallback onTap;
  final Icon? icon;
  final String label;
  final Icon? suffixIcon;
  final bool hideDivider;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Padding(
              padding: padding ??  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  if (icon != null) ...[
                    icon!,
                    const SizedBox(width: 12),
                  ],
                  Text(
                    label,
                    style: context.textTheme.s18w500(context),
                  ),
                  const Spacer(),
                  suffixIcon ?? const Icon(Icons.keyboard_arrow_right),
                ],
              ),
            ),
            if (!hideDivider) const Divider(indent: 16, endIndent: 16),
          ],
        ),
      ),
    );
  }
}
