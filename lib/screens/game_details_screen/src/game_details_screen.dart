import 'package:arena_club/common/app_widgets/app_cached_network_image.dart';
import 'package:arena_club/common/app_widgets/buttons/app_filled_button.dart';
import 'package:arena_club/common/app_widgets/metacritic_rating.dart';
import 'package:arena_club/common/app_widgets/our_rating.dart';
import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:arena_club/common/extensions/theme_data_extension.dart';
import 'package:arena_club/screens/game_details_screen/src/bloc/game_details_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GameDetailsScreen extends StatelessWidget {
  const GameDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GameDetailsBloc, GameDetailsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: state is GameDetailsDataState ? null : AppBar(),
          body: state is GameDetailsDataState
              ? CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      floating: true,
                      pinned: true,
                      expandedHeight: 180,
                      leading: IconButton(
                        onPressed: context.navigator.pop,
                        style: IconButton.styleFrom(
                          backgroundColor: context.theme.appBarColor,
                        ),
                        icon: const Icon(Icons.arrow_back),
                      ),
                      flexibleSpace: FlexibleSpaceBar(
                        background: AppCachedNetworkImage(
                          imageUrl: state.gameDetails.image,
                          fit: BoxFit.cover,
                        ),
                        title: Container(
                          width: double.maxFinite,
                          color: context.theme.appBarColor,
                          child: Text(
                            state.gameDetails.name,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        titlePadding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                    ),
                    SliverPadding(
                      padding: const EdgeInsets.all(16),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            AppFilledButton(
                              text: context.locale?.play ?? '',
                              onTap: () {},
                              backgroundColor: context.theme.blueMain,
                              textColor: Colors.white,
                            ),
                            const SizedBox(height: 24),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      context.locale?.gameRatings ?? '',
                                      style: context.textTheme.s18w600(context),
                                    ),
                                    const SizedBox(height: 8),
                                    MetacriticRating(
                                      rating: state.gameDetails.metacritic,
                                    ),
                                    const SizedBox(height: 8),
                                    OurRating(
                                      ourRating: state.gameDetails.rating,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      context.locale?.releasedDate ?? '',
                                      style: context.textTheme.s18w600(context),
                                    ),
                                    const SizedBox(height: 8),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 6,
                                        vertical: 4,
                                      ),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Text(
                                        state.gameDetails.releaseDate,
                                        style: context.textTheme
                                            .s14w600(context, Colors.black),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              color: context.theme.appBarColor,
                              height: 24,
                              thickness: 3,
                            ),
                            Text(state.gameDetails.description),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
