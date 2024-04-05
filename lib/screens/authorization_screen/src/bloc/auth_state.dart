part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthorizedState extends AuthState {
  final String username;

  AuthorizedState({required this.username});
}

final class AuthFailureState extends AuthState {
  final String errorText;

  AuthFailureState({required this.errorText});
}
