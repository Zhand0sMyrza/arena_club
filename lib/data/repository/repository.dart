import 'package:arena_club/common/l10n/dio_locale/base_dio_locale.dart';
import 'package:arena_club/common/l10n/dio_locale/ru_dio_locale.dart';
import 'package:arena_club/data/repository/dio_settings.dart';
import 'package:arena_club/data/repository/interfaces/base_auth_repo.dart';
import 'package:arena_club/data/repository/interfaces/base_game_news_repo.dart';
import 'package:arena_club/data/repository/interfaces/base_profile_repo.dart';
import 'package:arena_club/data/server/auth_repo.dart';
import 'package:arena_club/data/server/game_news_repo.dart';
import 'package:arena_club/data/server/profile_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Repository {
  static const _baseUrl = 'https://api.rawg.io/api';

  DioSettings? dioSettings;

  late final SharedPreferences _prefs;
  late final BaseGameNewsRepository gameNewsRepo;
  late final BaseAuthRepository authRepo;
  late final BaseProfileRepository profileRepo;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
    final dioSettings = DioSettings(
      dioLocale: _getDioLocale(_prefs),
    );

    final _dio = dioSettings.dioClient;

    authRepo = AuthRepository(dio: _dio, prefs: _prefs, url: _baseUrl);
    gameNewsRepo = GameNewsRepository(dio: _dio, url: _baseUrl);
    profileRepo = ProfileRepository(prefs: _prefs);
  }

  BaseDioLocale _getDioLocale(SharedPreferences prefs) {
    // При необходимости менял бы локаль для дио вот так:
    // return getLocaleSync(prefs) == "en" ? EnDioLocale() : RuDioLocale();
    return RuDioLocale();
  }

// String getLocaleSync(SharedPreferences prefs) {
//   var locale = prefs.getString(AppConstants.localeKey) ??
//       Locale(Platform.localeName.split("_").first).languageCode;
//
//   return AppConstants.localizationsList
//           .any((lang) => lang.code == locale || lang.type == locale)
//       ? locale
//       : "ru";
// }
}
