import 'package:arena_club/common/utils/constants.dart';
import 'package:arena_club/data/models/token_response.dart';
import 'package:arena_club/data/repository/interfaces/base_auth_repo.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository implements BaseAuthRepository {
  final SharedPreferences prefs;
  final Dio dio;
  final String url;

  AuthRepository({
    required this.prefs,
    required this.dio,
    required this.url,
  });

  @override
  Future<bool> isAuthorized() async {
    final isAuthorized = prefs.getBool(AppConstants.isAuthKey);
    return isAuthorized ?? false;
  }

  @override
  Future<Token> signIn(String login, String password) async {
    await Future.delayed(const Duration(seconds: 2));
    if (login.toLowerCase() == 'shrek' && password == '123qwe') {
      /// в реальном приложении было бы так:
      /// final authResponse = await dio.post(
      ///   '$url/api/v1/auth',
      ///   data: {
      ///     'login': login,
      ///     'password': password,
      ///   },
      /// );
      const authResponse = _mockAuthResponse;

      return Token.fromRawJson(authResponse.toString());
    } else {
      throw _errorText;
    }
  }
}

const _errorText =
    'Что-то пошло не так!\nПопробуйте ещё раз\n\nЛогин и пароль можете найти на Вашей карточке игрового клуба';

const _mockAuthResponse =  r'''{
  "access_token": "ShrekVesit2TonnyIOhranyaetSvoeBoloto", 
  "refresh_token": "FionnaVesitNa200KgMensheSmotritzaDetmiShreka", 
  "user": {
      "name": "Flutterist",
      "level": 3,
      "level_progress": 101,
      "balance": 5310.2145,
      "Image": "https://th.bing.com/th/id/OIP.vKo-lVzSgNdgO4ezkOBS8QHaEK?pid=ImgDet&w=474&h=266&rs=1" 
  }
}''';
