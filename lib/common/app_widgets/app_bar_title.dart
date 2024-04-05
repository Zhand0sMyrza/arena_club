import 'package:arena_club/common/app_theme/color_palette.dart';
import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    super.key,
    required this.leftText,
    required this.rightText,
  });

  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: leftText,
        style: context.textTheme.s24w700(context, ColorPalette.redMain),
        children: [
          TextSpan(
            text: rightText,
            style: context.textTheme.s24w700(context, ColorPalette.blueMain),
          ),
        ],
      ),
    );
  }
}
