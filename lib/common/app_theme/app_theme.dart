import 'package:arena_club/common/app_theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData appLightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorPalette.white,
  appBarTheme: const AppBarTheme(
    color: ColorPalette.blackNeutral,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.black,
    foregroundColor: ColorPalette.redMain,
    centerTitle: true,
    toolbarHeight: 72,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  ),
);

final ThemeData appDarkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ColorPalette.softBlack,
  appBarTheme: const AppBarTheme(
    color: ColorPalette.blackNeutral,
    scrolledUnderElevation: 0,
    surfaceTintColor: Colors.black,
    foregroundColor: ColorPalette.redMain,
    centerTitle: true,
    toolbarHeight: 72,
    systemOverlayStyle: SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        TextStyle(fontSize: 11),
      ),
    ),
  ),
);
