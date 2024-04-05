import 'package:arena_club/common/app_theme/color_palette.dart';
import 'package:arena_club/screens/root_screen/root_screen_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const _isLight = false; // TODO: Add app theme switch

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
        statusBarBrightness: _isLight ? Brightness.light : Brightness.dark,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: _isLight ? Brightness.dark : Brightness.light,
      ),
      child: MaterialApp(
        title: 'ArenaCLUB',
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: ColorPalette.softBlack,
          colorScheme: const ColorScheme.dark().copyWith(
            primary: Colors.red,
          ),
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
          indicatorColor: Colors.red,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all<TextStyle>(
                const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(ColorPalette.blueMain),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              ),
              minimumSize: MaterialStateProperty.all<Size>(const Size(24, 24)),
              maximumSize: MaterialStateProperty.all<Size>(const Size(80, 40)),
            ),
          ),
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.all<Color>(Colors.black12),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
        ),
        home: const RootScreenFeature(),
      ),
    );
  }
}
