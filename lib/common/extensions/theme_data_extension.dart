import 'package:arena_club/common/app_theme/color_palette.dart';
import 'package:flutter/material.dart';

extension ThemeDataExtension on ThemeData {
  // Если б была смена темы
  // bool get isDark => brightness == Brightness.dark;
  bool get isDark => true;

  Color get bgColor => isDark ? ColorPalette.softBlack : ColorPalette.white;

  Color get appBarColor =>
      isDark ? ColorPalette.blackNeutral : ColorPalette.blackNeutral;

  Color get text => isDark ? ColorPalette.white : ColorPalette.black;

  Color get hintText => isDark ? ColorPalette.grey : ColorPalette.black;

  Color get levelProgressBgColor =>
      isDark ? ColorPalette.blackNeutral : ColorPalette.blackNeutral;

  Color get levelProgressBarColor =>
      isDark ? ColorPalette.blueMain : ColorPalette.blueMain;

  Color get kDividerColor => isDark ? ColorPalette.grey : ColorPalette.grey;

  Color get iconColor => ColorPalette.blueMain;

  Color get subtitleColor =>
      isDark ? ColorPalette.greyLight : ColorPalette.grey;

  Color get gameCardColor =>
      isDark ? ColorPalette.grey : ColorPalette.softBlack;

  Color get blueMain => ColorPalette.blueMain;

  Color get redMain => ColorPalette.redMain;

  Color get filledButtonColor => isDark ? ColorPalette.white : ColorPalette.grey;

  Color get filledButtonTextColor =>
      isDark ? ColorPalette.greyExtraLight : ColorPalette.softBlack;

  Color get outlinedButtonColor =>
      isDark ? ColorPalette.greyExtraLight : ColorPalette.greyExtraLight;

  Color get outlinedButtonTextColor =>
      isDark ? ColorPalette.greyExtraLight : ColorPalette.softBlack;

  Color get outlinedButtonBorderColor =>
      isDark ? ColorPalette.greyExtraLight : ColorPalette.softBlack;

  Color get textFieldBg =>
      isDark ? ColorPalette.blackNeutral : ColorPalette.blackNeutral;


  Color get alertDialogBg =>
      isDark ? ColorPalette.grey : ColorPalette.blackNeutral;
}
