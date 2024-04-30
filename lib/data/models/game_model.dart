import 'dart:convert';

import 'package:arena_club/common/utils/formatter_utils.dart';

class GamesListResponse {
  final List<GameModel> gamesList;

  const GamesListResponse({required this.gamesList});

  factory GamesListResponse.fromRawJson(String str) =>
      GamesListResponse.fromJson(json.decode(str));

  factory GamesListResponse.fromJson(Map<String, dynamic> json) =>
      GamesListResponse(
        gamesList: List<GameModel>.from(
          json['results'].map(
            (game) => GameModel.fromJson(game),
          ),
        ),
      );
}

class GameModel {
  final int id;
  final String name;
  final String released;
  final String imagePath;
  final double rating;
  final int metacritic;

  const GameModel({
    required this.id,
    required this.name,
    required this.released,
    required this.imagePath,
    required this.rating,
    required this.metacritic,
  });

   String get releaseDate => Formatter.ddMMMyyyy(released);

  factory GameModel.fromJson(Map<String, dynamic> json) {
    return GameModel(
      id: json['id'],
      name: json['name'],
      released: json['released'],
      imagePath: json['background_image'],
      rating: json['rating'],
      metacritic: json['metacritic'],
    );
  }
}
