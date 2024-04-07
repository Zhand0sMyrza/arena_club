import 'dart:convert';

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
    final accessToken = prefs.getString(AppConstants.accessTokenKey);
    return accessToken != null && accessToken.isNotEmpty && accessToken != '';
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

      final tokenResult = Token.fromRawJson(authResponse.toString());

      await Future.wait(
        [
          prefs.setString(
            AppConstants.accessTokenKey,
            tokenResult.accessToken,
          ),
          prefs.setString(
            AppConstants.refreshTokenKey,
            tokenResult.refreshToken,
          ),
          prefs.setString(
            AppConstants.userModelKey,
            json.encode(tokenResult.user.toJson()),
          ),
        ],
      );

      return tokenResult;
    } else {
      throw Exception();
    }
  }

  @override
  Future<void> logout() async {
    // await dio.post('$url/api/v1/logout');
    await prefs.clear();
  }
}

const _mockAuthResponse = r'''{
  "access_token": "ShrekVesit2TonnyIOhranyaetSvoeBoloto", 
  "refresh_token": "FionnaVesitNa200KgMensheSmotritzaDetmiShreka", 
  "user": {
      "name": "Flutterist",
      "level": 3,
      "level_progress": 101,
      "balance": 2301.2145,
      "image": "https://th.bing.com/th/id/OIP.vKo-lVzSgNdgO4ezkOBS8QHaEK?pid=ImgDet&w=474&h=266&rs=1" 
  }
}''';
