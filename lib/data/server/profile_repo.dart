import 'dart:convert';

import 'package:arena_club/common/utils/constants.dart';
import 'package:arena_club/data/models/token_response.dart';
import 'package:arena_club/data/repository/interfaces/base_profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileRepository implements BaseProfileRepository {
  final SharedPreferences prefs;

  ProfileRepository({required this.prefs});

  @override
  Future<UserModel> getSavedUser() async {
    final user = prefs.getString(AppConstants.userModelKey);
    if (user != null) {
      return UserModel.fromJson(json.decode(user));
    }
    throw Exception();
  }
}
