import 'package:arena_club/screens/profile_screen/src/profile_screen.dart';
import 'package:flutter/cupertino.dart';

CupertinoPageRoute profileScreenRoute(RouteSettings routeSettings) {
  return CupertinoPageRoute(
    settings: routeSettings,
    builder: (context) => const ProfileScreen(),
  );
}
