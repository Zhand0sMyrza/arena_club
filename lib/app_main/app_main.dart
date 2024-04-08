import 'package:arena_club/common/app_theme/app_theme.dart';
import 'package:arena_club/screens/root_screen/root_screen_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppMain extends StatelessWidget {
  const AppMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ArenaCLUB',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: appDarkTheme,
      home: const RootScreenFeature(),
    );
  }
}
