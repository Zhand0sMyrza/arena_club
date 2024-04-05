import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
    this.fit,
  });

  final String? imageUrl;
  final double? height;
  final double? width;
  final double? borderRadius;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? 0),
        ),
      ),
      child: imageUrl != null
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
              fit: fit,
              errorWidget: (context, _, __) {
                return Container(color: Colors.red);
              },
            )
          : Container(
              color: Colors.red,
              height: 100,
              width: 100,
            ),
    );
  }
}
