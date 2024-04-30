import 'package:arena_club/data/repository/dio_settings.dart';
import 'package:arena_club/data/repository/interfaces/base_auth_repo.dart';
import 'package:arena_club/data/repository/interfaces/base_game_news_repo.dart';
import 'package:arena_club/data/repository/interfaces/base_profile_repo.dart';
import 'package:arena_club/data/server/auth_repo.dart';
import 'package:arena_club/data/server/game_news_repo.dart';
import 'package:arena_club/data/server/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  static const _baseUrl = 'https://api.rawg.io/api';
  Repository([this.dioClient]);

  DioSettings? dioSettings;
  final Dio? dioClient;

  late final SharedPreferences _prefs;
  late final BaseGameNewsRepository gameNewsRepo;
  late final BaseAuthRepository authRepo;
  late final BaseProfileRepository profileRepo;


  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final dioSettings = DioSettings();

    final dio = dioClient ?? dioSettings.dioClient;

    authRepo = AuthRepository(dio: dio, prefs: _prefs, url: _baseUrl);
    gameNewsRepo = GameNewsRepository(dio: dio, url: _baseUrl);
    profileRepo = ProfileRepository(prefs: _prefs);
  }
}
