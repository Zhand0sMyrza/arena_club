part of 'app_main_bloc.dart';

@immutable
sealed class AppMainEvent {}

final class AppStartedEvent extends AppMainEvent{}

final class LogoutEvent extends AppMainEvent{}