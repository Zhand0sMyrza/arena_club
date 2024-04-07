import 'package:arena_club/common/app_widgets/app_bar_title.dart';
import 'package:arena_club/common/app_widgets/app_cached_network_image.dart';
import 'package:arena_club/common/app_widgets/loading_dialog.dart';
import 'package:arena_club/common/app_widgets/metacritic_rating.dart';
import 'package:arena_club/common/app_widgets/our_rating.dart';
import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:arena_club/common/extensions/theme_data_extension.dart';
import 'package:arena_club/data/models/game_model.dart';
import 'package:arena_club/screens/game_news_screen/src/game_news_bloc/game_news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameNewsScreen extends StatefulWidget {
  const GameNewsScreen({super.key});

  @override
  State<GameNewsScreen> createState() => _GameNewsScreenState();
}

class _GameNewsScreenState extends State<GameNewsScreen> {
  final ScrollController _scrollController = ScrollController();
  final PageStorageKey _scrollKey =
      const PageStorageKey('gameNewsPageScrollKey');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          leftText: 'Arena',
          rightText: 'Library',
        ),
      ),
      body: BlocConsumer<GameNewsBloc, GameNewsState>(
        listener: (context, state) {
          if (state is GameNewsLoadingState) {
            if (state.isLoading) {
              showLoadingLayer(context);
            } else {
              context.rootNavigator.pop();
            }
          }
        },
        buildWhen: (_, next) => next is GameNewsDataState,
        builder: (context, state) {
          if (state is GameNewsDataState) {
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollInfo) {
                if (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent) {
                  context.read<GameNewsBloc>().add(GamesNextPageEvent());
                }
                return false;
              },
              child: ListView.builder(
                key: _scrollKey,
                controller: _scrollController,
                itemCount: state.gamesList.length,
                itemBuilder: (context, index) => GameCard(
                  game: state.gamesList[index],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class GameCard extends StatelessWidget {
  const GameCard({super.key, required this.game});

  final GameModel game;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: context.theme.gameCardColor,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppCachedNetworkImage(
                imageUrl: game.imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                borderRadius: 6,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      game.name,
                      style: context.textTheme.s16w600(context),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Release date: ${game.released}',
                      style: context.textTheme.s12w400(context),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MetacriticRating(rating: game.metacritic),
              OurRating(ourRating: game.rating),
            ],
          ),
        ],
      ),
    );
  }
}
