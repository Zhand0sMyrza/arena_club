import 'package:arena_club/data/repository/repository.dart';
import 'package:arena_club/screens/game_details_screen/src/bloc/game_details_bloc.dart';
import 'package:arena_club/screens/game_details_screen/src/game_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

CupertinoPageRoute gameDetailsScreenRoute(RouteSettings settings, int gameId) {
  return CupertinoPageRoute(
    settings: settings,
    builder: (context) => BlocProvider<GameDetailsBloc>(
      create: (context) => GameDetailsBloc(context.read<Repository>())
        ..add(FetchGameDetails(gameId)),
      child: const GameDetailsScreen(),
    ),
  );
}
