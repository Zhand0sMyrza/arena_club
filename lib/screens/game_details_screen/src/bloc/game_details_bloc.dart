import 'package:arena_club/data/models/game_details_model.dart';
import 'package:arena_club/data/repository/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_details_event.dart';
part 'game_details_state.dart';

class GameDetailsBloc extends Bloc<GameDetailsEvent, GameDetailsState> {
  GameDetailsBloc(this.repository) : super(GameDetailsInitial()) {
    on<FetchGameDetails>(_onFetchGameDetails);
  }

  final Repository repository;

  Future<void> _onFetchGameDetails(
    FetchGameDetails event,
    Emitter<GameDetailsState> emit,
  ) async {
    emit(GameDetailsInitial());
    try {
      final details = await repository.gameNewsRepo.fetchGameDetails(event.id);
      emit(GameDetailsDataState(gameDetails: details));
    } catch (e) {
      emit(GameDetailsFailureState(e.toString()));
    }
  }
}
