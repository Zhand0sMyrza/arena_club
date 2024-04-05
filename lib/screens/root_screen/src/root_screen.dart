import 'package:arena_club/app_main/bloc/app_main_bloc.dart';
import 'package:arena_club/common/app_widgets/app_splash_screen.dart';
import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/screens/authorization_screen/authorization_screen.dart';
import 'package:arena_club/screens/authorization_screen/src/auth_screen_view_model.dart';
import 'package:arena_club/screens/game_news_screen/game_news_screen_route.dart';
import 'package:arena_club/screens/profile_screen/profile_screen_route.dart';
import 'package:arena_club/screens/root_screen/src/view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

part 'components/app_bottom_navigation_bar.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AppMainBloc, AppMainState>(
        listener: (context, state) {
          if (state is AppSplashState) {
            showGeneralDialog(
              context: context,
              barrierDismissible: false,
              pageBuilder: (context, _, __) => const AppSplashScreen(),
            );
          }
          if (state is AppStartedState && !state.isAuthorized) {
            context.rootNavigator.pop();
            showGeneralDialog(
              context: context,
              barrierDismissible: false,
              pageBuilder: (context, _, __) => ChangeNotifierProvider(
                create: (context) => AuthScreenVM(),
                child: const AuthorizationScreen(),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AppStartedState) {
            if (state.isAuthorized) {
              context.rootNavigator.pop();
            }
            return Consumer<RootScreenVM>(
              builder: (context, vm, child) {
                return IndexedStack(
                  index: vm.activeIndex,
                  children: [
                    Navigator(
                      key: vm.navigatorKeys[0],
                      onGenerateRoute: gameNewsScreenRoute,
                    ),
                    Navigator(
                      key: vm.navigatorKeys[1],
                      onGenerateRoute: profileScreenRoute,
                    ),
                  ],
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
