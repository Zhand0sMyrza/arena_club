import 'package:arena_club/data/models/token_response.dart';

abstract class BaseProfileRepository {
  Future<UserModel> getSavedUser();
}