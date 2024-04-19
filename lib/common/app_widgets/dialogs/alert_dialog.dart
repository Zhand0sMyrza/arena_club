import 'package:arena_club/common/app_widgets/buttons/app_filled_button.dart';
import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/text_theme_extension.dart';
import 'package:arena_club/common/extensions/theme_data_extension.dart';
import 'package:flutter/material.dart';

Future<void> showAlertDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) => Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: context.theme.alertDialogBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              context.locale?.authErrorDialogText ?? '',
              textAlign: TextAlign.center,
              style: context.textTheme.s14w400(context),
            ),
            const SizedBox(height: 24),
            AppFilledButton(
              text: context.locale?.close ?? '',
              onTap: context.navigator.pop,
            ),
          ],
        ),
      ),
    ),
  );
}
