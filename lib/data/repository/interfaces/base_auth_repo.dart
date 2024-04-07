import 'package:arena_club/data/models/token_response.dart';

abstract class BaseAuthRepository {
  Future<bool> isAuthorized();
  Future<Token> signIn(String login, String password);
  Future<void> logout();
}