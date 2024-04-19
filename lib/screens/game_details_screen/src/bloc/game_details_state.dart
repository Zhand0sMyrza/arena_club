part of 'game_details_bloc.dart';

@immutable
sealed class GameDetailsState {}

final class GameDetailsInitial extends GameDetailsState {}

final class GameDetailsDataState extends GameDetailsState {
  final GameDetailsModel gameDetails;

  GameDetailsDataState({required this.gameDetails});
}

final class GameDetailsFailureState extends GameDetailsState{
  final String error;

  GameDetailsFailureState(this.error);
}
