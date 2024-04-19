part of 'game_details_bloc.dart';

@immutable
sealed class GameDetailsEvent {}

final class FetchGameDetails extends GameDetailsEvent {
  final int id;

  FetchGameDetails(this.id);
}
