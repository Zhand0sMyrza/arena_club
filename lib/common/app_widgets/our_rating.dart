import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:arena_club/common/extensions/theme_data_extension.dart';
import 'package:flutter/material.dart';

class OurRating extends StatelessWidget {
  const OurRating({
    super.key,
    required this.ourRating,
  });

  final double ourRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '${context.locale?.ourRating} ',
          style: context.textTheme.s14w600(context),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: context.theme.iconColor,
          ),
          child: Text.rich(
            TextSpan(
              text: ourRating.toStringAsFixed(1),
              children: [
                TextSpan(
                  text: ' / 5',
                  style: context.textTheme.s14w600(context),
                ),
              ],
            ),
            style: context.textTheme.s14w400(context),
          ),
        ),
      ],
    );
  }
}
