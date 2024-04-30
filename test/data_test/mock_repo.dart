import 'package:arena_club/common/utils/constants.dart';
import 'package:arena_club/data/models/game_details_model.dart';
import 'package:arena_club/data/models/game_model.dart';
import 'package:arena_club/data/repository/interfaces/base_game_news_repo.dart';
import 'package:http/http.dart' as http;

import 'mock_data.dart';

class MockRepo implements BaseGameNewsRepository {
  final http.Client client;

  MockRepo(this.client);

  /// Был вынужден добавить fetchGameDetails даже если не использую его в примере
  /// Такой вот implements диктатор
  @override
  Future<GameDetailsModel> fetchGameDetails(int id) async {
    final response = await client.get(Uri.parse(
        'https://api.rawg.io/api/games/$id?key=${AppConstants.apiKey}'));
    if (response.statusCode == 200) {
      return GameDetailsModel.fromRawJson(MockData.gameDetails);
    } else {
      throw Exception('Failed to fetch game details');
    }
  }

  @override
  Future<GamesListResponse> fetchGames(int page) async {
    final response = await client.get(Uri.parse(
        'https://api.rawg.io/api/games?key=${AppConstants.apiKey}&page=1&page_size=1'));
    if (response.statusCode == 200) {
      return GamesListResponse.fromRawJson(MockData.gamesListResponse);
    } else {
      throw Exception('Failed to fetch games');
    }
  }
}
