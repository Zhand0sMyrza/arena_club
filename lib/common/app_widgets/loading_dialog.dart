import 'dart:ui';

import 'package:flutter/material.dart';

Future<bool?> showLoadingLayer(BuildContext context) async {
  return showDialog(
    context: context,
    barrierDismissible: true,
    builder: (context) {
      return Dialog.fullscreen(
        backgroundColor: Colors.transparent,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
          child: const Center(child: CircularProgressIndicator()),
        ),
      );
    },
  );
}
