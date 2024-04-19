import 'package:arena_club/data/models/game_details_model.dart';
import 'package:arena_club/data/models/game_model.dart';
import 'package:arena_club/data/repository/interfaces/base_game_news_repo.dart';
import 'package:dio/dio.dart';

class GameNewsRepository implements BaseGameNewsRepository {
  final Dio dio;
  final String url;

  GameNewsRepository({required this.dio, required this.url});

  @override
  Future<GamesListResponse> fetchGames(int page) async {
    final response = await dio.get('$url/games', queryParameters: {
      'page': page,
      'page_size': 10,
    });

    return GamesListResponse.fromRawJson(response.toString());
  }

  @override
  Future<GameDetailsModel> fetchGameDetails(int id) async {
    final response = await dio.get('$url/games/$id');

    return GameDetailsModel.fromRawJson(response.toString());
  }
}
