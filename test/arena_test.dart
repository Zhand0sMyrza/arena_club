import 'package:arena_club/common/utils/constants.dart';
import 'package:arena_club/data/models/game_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'arena_test.mocks.dart';
import 'data_test/mock_data.dart';
import 'data_test/mock_repo.dart';

@GenerateMocks([http.Client])
void main() {
  group('Test fetching games, success and failure', () {
    final client = MockClient();
    final repo = MockRepo(client);
    final gameNewsUrl = Uri.parse(
        'https://api.rawg.io/api/games?key=${AppConstants.apiKey}&page=1&page_size=1');

    test('Fetching games success', () async {
      when(
        client.get(gameNewsUrl),
      ).thenAnswer((_) async => http.Response(MockData.gamesListResponse, 200));

      final gameList = await repo.fetchGames(1);
      expect(gameList, isA<GamesListResponse>());
      expect(gameList.gamesList.first.name, 'Grand Theft Auto V');
    });

    test('Fetching games failure', () async {
      when(client.get(gameNewsUrl))
          .thenThrow(Exception('Failed to fetch games'));

      try {
        await repo.fetchGames(0);
      } catch (e) {
        expect(e, isInstanceOf<Exception>());
        expect(e.toString(), equals('Exception: Failed to fetch games'));
      }
    });
  });
}
