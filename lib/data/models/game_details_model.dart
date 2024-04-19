import 'dart:convert';

import 'package:arena_club/common/utils/formatter_utils.dart';

class GameDetailsModel {
  final int id;
  final String name;
  final int metacritic;
  final String released;
  final String image;
  final double rating;
  final String description;

  GameDetailsModel({
    required this.id,
    required this.name,
    required this.metacritic,
    required this.released,
    required this.image,
    required this.rating,
    required this.description,
  });

  factory GameDetailsModel.fromRawJson(String str) =>
      GameDetailsModel.fromJson(json.decode(str));

  String get releaseDate => Formatter.ddMMMyyyy(released);

  factory GameDetailsModel.fromJson(Map<String, dynamic> json) {
    return GameDetailsModel(
      id: json["id"],
      name: json["name"],
      metacritic: json["metacritic"],
      released: json["released"],
      image: json["background_image"],
      rating: json["rating"],
      description: json["description_raw"],
    );
  }
}
