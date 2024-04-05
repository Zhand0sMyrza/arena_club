import 'package:arena_club/common/app_widgets/app_bar_title.dart';
import 'package:arena_club/common/app_widgets/app_cached_network_image.dart';
import 'package:arena_club/common/app_widgets/buttons/tiled_button.dart';
import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:arena_club/common/extensions/theme_data_extension.dart';
import 'package:flutter/material.dart';

part 'components/profile_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(
          leftText: 'Arena',
          rightText: 'CLUB',
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const ProfileCard(
            userName: 'Humanoid',
            level: 3,
            progressValue: 100,
            balance: 5310.2123,
          ),
          const SizedBox(height: 48),
          TiledButton(
            onTap: () {},
            icon: const Icon(Icons.settings_outlined),
            label: 'Settings',
          ),
          const SizedBox(height: 4),
          TiledButton(
            onTap: () {},
            icon: const Icon(Icons.logout),
            label: 'Logout',
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              'About "ArenaCLUB"',
              style: context.textTheme.s14w400(
                context,
                context.theme.subtitleColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
