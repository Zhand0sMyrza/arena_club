import 'package:arena_club/data/models/game_details_model.dart';
import 'package:arena_club/data/models/game_model.dart';

abstract class BaseGameNewsRepository {
  Future<GamesListResponse> fetchGames(int page);
  Future<GameDetailsModel> fetchGameDetails(int id);
}