import 'package:arena_club/common/l10n/dio_locale/base_dio_locale.dart';

class RuDioLocale extends BaseDioLocale {
  ///errors
  @override
  String get noConnectionError => "Отсутствует интернет соединение";

  @override
  String get sessionClosedNeedAuth =>
      "Ваша сессия истекла. Требуется повторный вход в систему";

  @override
  String get somethingWentWrong =>
      "Что-то пошло не так. Наши специалисты уже занимаются этой проблемой. Попробуйте позже.";
}
