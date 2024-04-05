import 'package:arena_club/common/app_theme/color_palette.dart';
import 'package:flutter/material.dart';

extension TextThemeExtension on TextTheme {
  TextStyle s11w400(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s12w400(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s14w400(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s14w500(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s14w600(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s16w400(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s16w500(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s16w600(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s18w500(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s18w600(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s24w600(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );

  TextStyle s24w700(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );


  TextStyle s48w600(BuildContext context, [Color? color]) => TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.w600,
    color: color ?? ColorPalette.white,
    letterSpacing: 1,
  );
}
