import 'dart:convert';

class Token {
  final String accessToken;
  final String refreshToken;
  final UserModel user;

  const Token({
    required this.accessToken,
    required this.refreshToken,
    required this.user,
  });

  factory Token.fromRawJson(String str) => Token.fromJson(json.decode(str));

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
      accessToken: json['access_token'],
      refreshToken: json['refresh_token'],
      user: UserModel.fromJson(json['user']),
    );
  }
}

class UserModel {
  final String name;
  final int level;
  final int levelProgress;
  final double balance;
  final String? image;

  const UserModel({
    required this.name,
    required this.level,
    required this.levelProgress,
    required this.balance,
    required this.image,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      level: json['level'],
      levelProgress: json['level_progress'],
      balance: json['balance'],
      image: json['image'],
    );
  }
}
