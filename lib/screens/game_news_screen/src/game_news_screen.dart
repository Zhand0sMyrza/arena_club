import 'dart:math';

import 'package:arena_club/common/app_widgets/app_bar_title.dart';
import 'package:arena_club/common/app_widgets/loading_dialog.dart';
import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:arena_club/screens/game_news_screen/src/components/game_card.dart';
import 'package:arena_club/screens/game_news_screen/src/components/timer_overlay_painter.dart';
import 'package:arena_club/screens/game_news_screen/src/game_news_bloc/game_news_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameNewsScreen extends StatefulWidget {
  const GameNewsScreen({super.key});

  @override
  State<GameNewsScreen> createState() => _GameNewsScreenState();
}

class _GameNewsScreenState extends State<GameNewsScreen> {
  /// Чтобы сохранить позицию скролла при обновлении состояния
  final PageStorageKey _scrollKey =
      const PageStorageKey('gameNewsPageScrollKey');
  final OverlayPortalController _overlayController = OverlayPortalController();
  final _overlayLink = LayerLink();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          leftText: 'Arena',
          rightText: 'Library',
        ),
        actions: [
          IconButton(
            onPressed: _overlayController.toggle,
            icon: const Icon(
              Icons.av_timer_rounded,
            ),
          )
        ],
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
                _overlayController.hide();
                return false;
              },
              child: OverlayPortal(
                overlayChildBuilder: (context) => CompositedTransformFollower(
                  offset: const Offset(-15, -5),
                  link: _overlayLink,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: CustomPaint(
                      painter: TimerOverlayPainter(),
                      child: Container(
                        width: 160,
                        height: 100,
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          context.locale?.youHaveMinutesLeft(
                                Random().nextInt(12),
                                Random().nextInt(59),
                              ) ??
                              '',
                          overflow: TextOverflow.visible,
                          textAlign: TextAlign.center,
                          style: context.textTheme.s16w500(context),
                        ),
                      ),
                    ),
                  ),
                ),
                controller: _overlayController,
                child: CompositedTransformTarget(
                  link: _overlayLink,
                  child: ListView.builder(
                    key: _scrollKey,
                    itemCount: state.gamesList.length,
                    itemBuilder: (context, index) => GameCard(
                      game: state.gamesList[index],

                      /// Именованный роут использовал только для примера
                      /// Если бы страниц было больше, вынес бы названия роутов в отдельный класс
                      onTap: () => context.navigator.pushNamed(
                        '/gameDetailsScreen',
                        arguments: state.gamesList[index].id,
                      ),
                    ),
                  ),
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
