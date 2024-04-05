import 'package:arena_club/data/repository/repository.dart';
import 'package:arena_club/screens/game_news_screen/src/game_news_bloc/game_news_bloc.dart';
import 'package:arena_club/screens/game_news_screen/src/game_news_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

CupertinoPageRoute gameNewsScreenRoute(RouteSettings routeSettings) {
  return CupertinoPageRoute(
    settings: routeSettings,
    builder: (context) => BlocProvider<GameNewsBloc>(
      create: (context) => GameNewsBloc(context.read<Repository>())
        ..add(FetchGamesEvent(page: 1)),
      child: const GameNewsScreen(),
    ),
  );
}
