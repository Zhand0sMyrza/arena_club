import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:flutter/material.dart';

class MetacriticRating extends StatelessWidget {
  const MetacriticRating({
    super.key,
    required this.rating,
  });

  final int rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 125,
      padding: const EdgeInsets.fromLTRB(6, 2, 4, 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.red,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Metacritic',
            style: context.textTheme.s14w400(context),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              color: Colors.white,
            ),
            child: Text(
              ' $rating ',
              style: context.textTheme.s14w600(
                context,
                Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}