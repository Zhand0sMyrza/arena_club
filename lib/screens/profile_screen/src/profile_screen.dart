import 'package:arena_club/app_main/bloc/app_main_bloc.dart';
import 'package:arena_club/common/app_widgets/app_bar_title.dart';
import 'package:arena_club/common/app_widgets/app_cached_network_image.dart';
import 'package:arena_club/common/app_widgets/buttons/tiled_button.dart';
import 'package:arena_club/common/app_widgets/shimmer_placeholder.dart';
import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:arena_club/common/extensions/theme_data_extension.dart';
import 'package:arena_club/screens/profile_screen/src/bloc/profile_bloc.dart';
import 'package:arena_club/screens/profile_screen/src/components/animated_refill_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'components/profile_card.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  /// Пример использования MethodChannel
  final callMethodChannel =
      const MethodChannel("com.example.flutter/arenaChannel");

  String btry = '123';

  Future<void> callSupport(String number) async {
    await callMethodChannel.invokeMethod("callNumber", {'number': number});
  }

  Future<void> checkBatteryLevel() async {
    final battery =
        await callMethodChannel.invokeMethod<int>("getBatteryLevel");
    if (mounted) {
      setState(() => btry = battery.toString());
    }
  }

  @override
  void initState() {
    checkBatteryLevel();
    super.initState();
  }

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
          BlocConsumer<ProfileBloc, ProfileState>(
            listener: (context, state) {
              if (state is ProfileFetchErrorState) {
                context.read<AppMainBloc>().add(LogoutEvent());
              }
            },
            builder: (context, state) {
              if (state is ProfileDataState) {
                return ProfileCard(
                  userName: state.user.name,
                  level: state.user.level,
                  progressValue: state.user.levelProgress,
                  balance: state.user.balance,
                  userImage: state.user.image,
                );
              }
              return ProfileCard.placeholder();
            },
          ),
          const SizedBox(height: 48),
          TiledButton(
            onTap: () {},
            icon: const Icon(Icons.settings_outlined),
            label: context.locale?.settings ?? '',
          ),
          const SizedBox(height: 4),
          TiledButton(
            onTap: () => callSupport('77021112233'),
            icon: const Icon(Icons.support_agent),
            label: context.locale?.callSupport ?? '',
          ),
          const SizedBox(height: 4),
          TiledButton(
            onTap: () {
              context.read<AppMainBloc>().add(LogoutEvent());
            },
            icon: const Icon(Icons.logout),
            label: context.locale?.logout ?? '',
          ),
          const SizedBox(height: 24),
          Text('${context.locale?.batteryLevel} $btry'),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: Text(
              context.locale?.aboutArenaClub ?? '',
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


