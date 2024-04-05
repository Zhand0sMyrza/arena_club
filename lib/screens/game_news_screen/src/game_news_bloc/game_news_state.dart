part of 'game_news_bloc.dart';

@immutable
sealed class GameNewsState {}

class GameNewsLoadingState extends GameNewsState {
  final bool isLoading;

  GameNewsLoadingState(this.isLoading);
}


class GameNewsDataState extends GameNewsState{
  final List<GameModel> gamesList;

  GameNewsDataState({required this.gamesList});
}

class GameNewsFailureState extends GameNewsState{
  final String message;

  GameNewsFailureState(this.message);
}