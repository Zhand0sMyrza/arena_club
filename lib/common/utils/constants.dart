import 'package:arena_club/data/models/locale_model.dart';

class AppConstants {
  static const localeKey = 'locale_key';
  static const apiKey = '9f6c6a7ec4f94996b32adfbd9cffc16f';
  static const isAuthKey = 'isAuthorized';

  static List<LocaleModel> localizationsList = [
    LocaleModel(
      code: "ru",
      title: "Рус",
      type: "ruRU_TYPE",
    ),
    LocaleModel(
      code: "en",
      title: "Eng",
      type: "enEN_TYPE",
    ),
  ];
}
