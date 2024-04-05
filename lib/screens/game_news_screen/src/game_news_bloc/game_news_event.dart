part of 'game_news_bloc.dart';

@immutable
abstract class GameNewsEvent {}

class FetchGamesEvent extends GameNewsEvent {
  final int page;

  FetchGamesEvent({required this.page});
}


class GamesNextPageEvent extends GameNewsEvent {}