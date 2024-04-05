import 'package:arena_club/data/models/game_model.dart';

abstract class BaseGameNewsRepository {
  Future<GamesListResponse> fetchGames(int page);
}