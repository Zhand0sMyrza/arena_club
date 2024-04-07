import 'package:arena_club/common/app_theme/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPlaceholder extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const ShimmerPlaceholder(
      {Key? key, required this.child, required this.isLoading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color baseColor = ColorPalette.redMain.withOpacity(0.3);
    Color highlightColor = ColorPalette.blueMain.withOpacity(0.3);

    return isLoading
        ? Shimmer.fromColors(
            baseColor: baseColor,
            highlightColor: highlightColor,
            enabled: true,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10),
              ),
              child: child,
            ),
          )
        : child;
  }
}
