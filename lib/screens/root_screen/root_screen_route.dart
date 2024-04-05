import 'package:arena_club/screens/root_screen/src/root_screen.dart';
import 'package:arena_club/screens/root_screen/src/view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class RootScreenFeature extends StatelessWidget {
  const RootScreenFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RootScreenVM(),
      child: const RootScreen(),
    );
  }
}
