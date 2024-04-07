part of '../profile_screen.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    super.key,
    this.userImage,
    required this.userName,
    required this.level,
    required this.progressValue,
    required this.balance,
  });

  final String? userImage;
  final String userName;
  final int level;
  final int progressValue;
  final double balance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              const AppCachedNetworkImage(
                imageUrl: null,
                width: 100,
                height: 100,
                borderRadius: 12,
              ),
              const SizedBox(width: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userName,
                    style: context.textTheme.s24w600(context),
                  ),
                  const SizedBox(height: 8),
                  Text('${context.locale?.level}: $level'),
                  const SizedBox(height: 4),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: 24,
                        width: context.mqSize.width / 2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: context.theme.levelProgressBgColor,
                        ),
                      ),
                      Positioned(
                        left: 0,
                        child: Container(
                          height: 22,
                          width: context.mqSize.width /
                              2 *
                              _calculateProgressPercentage(
                                  level, progressValue),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: context.theme.levelProgressBarColor,
                          ),
                        ),
                      ),
                      Text(
                        '$progressValue / ${_calculateValueForNextLevel(level)}',
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          Divider(
            thickness: 2,
            color: context.theme.appBarColor,
            height: 32,
          ),
          Row(
            children: [
              const Icon(
                Icons.monetization_on,
                color: Colors.yellow,
              ),
              const SizedBox(width: 8),
              Text.rich(
                TextSpan(
                  text: '${context.locale?.balance}: ',
                  style: context.textTheme.s18w600(context),
                  children: [
                    TextSpan(
                      text: balance.toStringAsFixed(2),
                      style: context.textTheme.s18w600(context).copyWith(
                            fontStyle: FontStyle.italic,
                            color: Colors.yellow,
                          ),
                    ),
                    const TextSpan(text: ' ₸'),
                  ],
                ),
              ),
              const Spacer(),
              AppFilledButton(
                text: context.locale?.refill ?? '',
                onTap: () {},
                isDense: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

double _calculateProgressPercentage(int level, int progress) {
  final int valueForNextLevel = _calculateValueForNextLevel(level);
  return progress / valueForNextLevel;
}

int _calculateValueForNextLevel(int level) {
  return level * (25 * 3.14).round();
}
