import 'package:arena_club/common/utils/constants.dart';
import 'package:arena_club/data/models/game_details_model.dart';
import 'package:arena_club/data/models/game_model.dart';
import 'package:arena_club/data/models/token_response.dart';
import 'package:arena_club/data/server/game_news_repo.dart';
import 'package:arena_club/data/server/profile_repo.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'arena_test.mocks.dart';
import 'data_test/mock_data.dart';

@GenerateNiceMocks([
  MockSpec<Dio>(),
  MockSpec<GameNewsRepository>(),
  MockSpec<ProfileRepository>(),
])
void main() {
  late final MockDio client;
  late final MockGameNewsRepository newsRepo;
  late final MockProfileRepository profileRepo;

  setUpAll(() {
    client = MockDio();
    newsRepo = MockGameNewsRepository();
    profileRepo = MockProfileRepository();
  });

  final RequestOptions requestOptions = RequestOptions();

  group('Test fetching games, success and failure', () {
    const gameNewsUrl =
        'https://api.rawg.io/api/games?key=${AppConstants.apiKey}&page=1&page_size=1';

    test('Fetching games success', () async {
      when(client.get(gameNewsUrl)).thenAnswer(
        (_) => Future.value(
          Response<GamesListResponse>(
            data: GamesListResponse.fromRawJson(MockData.gamesListResponse),
            requestOptions: requestOptions,
            statusCode: 200,
          ),
        ),
      );
      expect(await newsRepo.fetchGames(1), isA<GamesListResponse>());
    });

    test('Fetching games failure', () async {
      when(client.get(gameNewsUrl)).thenThrow(
        DioException(
          message: 'Failed to fetch games',
          requestOptions: requestOptions,
        ),
      );

      expect(() => client.get(gameNewsUrl), throwsException);
    });
  });

  group('Test fetch game details, success and failure', () {
    const int mockGameId = 3498;
    const gameDetailsUrl =
        'https://api.rawg.io/api/games/$mockGameId?key=${AppConstants.apiKey}';

    test('Fetching game details success', () async {
      when(client.get(gameDetailsUrl)).thenAnswer(
        (_) => Future.value(
          Response<GameDetailsModel>(
            data: GameDetailsModel.fromRawJson(MockData.gameDetails),
            requestOptions: requestOptions,
            statusCode: 200,
          ),
        ),
      );

      expect(
          await newsRepo.fetchGameDetails(mockGameId), isA<GameDetailsModel>());
    });
    final dioException = DioException(
      message: 'Failed to fetch game details',
      requestOptions: requestOptions,
    );

    test('Fetching game details failure', () async {
      when(client.get(gameDetailsUrl)).thenThrow(dioException);

      expect(() => client.get(gameDetailsUrl), throwsA(dioException));
    });
  });

  group('Test profile repository', () {
    test('Get saved user', () async {
      const user = UserModel(
        name: 'Test',
        level: 12,
        levelProgress: 123,
        balance: 456,
        image: null,
      );
      when(profileRepo.getSavedUser()).thenAnswer((_) async => user);

      expect(await profileRepo.getSavedUser(), user);
    });
  });
}
