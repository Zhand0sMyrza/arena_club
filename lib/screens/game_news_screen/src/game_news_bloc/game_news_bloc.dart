import 'package:arena_club/data/models/game_model.dart';
import 'package:arena_club/data/repository/repository.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'game_news_event.dart';
part 'game_news_state.dart';

class GameNewsBloc extends Bloc<GameNewsEvent, GameNewsState> {
  GameNewsBloc(this.repo) : super(GameNewsLoadingState(true)) {
    on<FetchGamesEvent>(_onFetchGames);
    on<GamesNextPageEvent>(_onGamesNextPage, transformer: droppable());
  }

  final Repository repo;
  int _page = 1;

  final _gamesList = <GameModel>[];

  Future _onFetchGames(
    FetchGamesEvent event,
    Emitter<GameNewsState> emit,
  ) async {
    try{
      emit(GameNewsLoadingState(true));
      final result = await repo.gameNewsRepo.fetchGames(_page);
      _gamesList.addAll(result.gamesList);
      emit(GameNewsLoadingState(false));
      emit(GameNewsDataState(gamesList: _gamesList));
    } catch(e){
      emit(GameNewsLoadingState(false));
      emit(GameNewsFailureState(e.toString()));
    }
  }

  Future _onGamesNextPage(
      GamesNextPageEvent event,
      Emitter<GameNewsState> emit,
      ) async {
    try{
      emit(GameNewsLoadingState(true));
      final tmpPage = _page +1;
      final result = await repo.gameNewsRepo.fetchGames(tmpPage);
      _gamesList.addAll(result.gamesList);
      _page = tmpPage;
      emit(GameNewsLoadingState(false));
      emit(GameNewsDataState(gamesList: _gamesList));
    } catch(e){
      emit(GameNewsLoadingState(false));
      emit(GameNewsFailureState(e.toString()));
    }
  }
}
