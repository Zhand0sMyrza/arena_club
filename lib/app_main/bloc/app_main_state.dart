part of 'app_main_bloc.dart';

@immutable
sealed class AppMainState {}

final class AppInitialState extends AppMainState {}

final class AppSplashState extends AppMainState {}

final class AppStartedState extends AppMainState {
  final bool isAuthorized;

  AppStartedState({required this.isAuthorized});
}

final class AppLoadingState extends AppMainState {
  final bool isLoading;

  AppLoadingState({required this.isLoading});
}
