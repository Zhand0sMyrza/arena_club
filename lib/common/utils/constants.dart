import 'package:arena_club/data/models/locale_model.dart';

class AppConstants {
  static const localeKey = 'locale_key';
  static const accessTokenKey = 'access_token_key';
  static const refreshTokenKey = 'refresh_token_key';
  static const apiKey = '9f6c6a7ec4f94996b32adfbd9cffc16f';
  static const isAuthKey = 'isAuthorized';
  static const userModelKey = 'savedUser';

  static List<LocaleModel> localizationsList = [
    const LocaleModel(
      code: "ru",
      title: "Рус",
      type: "ruRU_TYPE",
    ),
    const LocaleModel(
      code: "en",
      title: "Eng",
      type: "enEN_TYPE",
    ),
  ];
}
