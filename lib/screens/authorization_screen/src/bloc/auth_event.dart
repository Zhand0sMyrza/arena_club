part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class CheckAuthEvent extends AuthEvent {}

final class SignInEvent extends AuthEvent {
  final String login;
  final String password;

  SignInEvent({required this.login, required this.password});
}