import 'package:arena_club/common/app_widgets/buttons/AppFilledButton.dart';
import 'package:arena_club/common/app_widgets/dialogs/alert_dialog.dart';
import 'package:arena_club/common/app_widgets/text_fields/filled_text_field.dart';
import 'package:arena_club/common/extensions/context_extension.dart';
import 'package:arena_club/common/extensions/theme_data_extension.dart';
import 'package:arena_club/common/gen/assets.gen.dart';
import 'package:arena_club/screens/authorization_screen/src/auth_screen_view_model.dart';
import 'package:arena_club/screens/authorization_screen/src/bloc/auth_bloc.dart';
import 'package:arena_club/screens/authorization_screen/src/components/auth_success_dialog.dart';
import 'package:arena_club/screens/profile_screen/src/bloc/profile_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class AuthorizationScreen extends StatefulWidget {
  const AuthorizationScreen({super.key});

  @override
  State<AuthorizationScreen> createState() => _AuthorizationScreenState();
}

class _AuthorizationScreenState extends State<AuthorizationScreen> {
  @override
  Widget build(BuildContext context) {
    final vm = context.read<AuthScreenVM>();

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: context.theme.bgColor,
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoadingState) {
              vm.setLoading(true);
            }
            if (state is AuthFailureState) {
              vm.setLoading(false);
              showAlertDialog(context).whenComplete(vm.clearFields);
            }
            if (state is AuthorizedState) {
              vm.setLoading(false);
              showAuthSuccessDialog(context, state.username)
                  .whenComplete(
                    context.rootNavigator.pop,
                  )
                  .whenComplete(
                    () =>
                        context.read<ProfileBloc>()..add(UpdateProfileEvent()),
                  );
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Assets.images.arenaCLUBLogo.image()),
                const SizedBox(height: 24),
                AppTextField(
                  controller: vm.loginController,
                  hintText: context.locale?.enterLogin ?? '',
                  onChanged: (_) => vm.validate(),
                ),
                const SizedBox(height: 16),
                AppTextField(
                  controller: vm.passwordController,
                  hintText: context.locale?.enterPassword ?? '',
                  obscured: true,
                  onChanged: (_) => vm.validate(),
                ),
                const SizedBox(height: 40),
                Consumer<AuthScreenVM>(
                  builder: (context, vm, _) => AppFilledButton(
                    enabled: vm.buttonEnabled,
                    loading: vm.loading,
                    onTap: () {
                      context.read<AuthBloc>().add(
                            SignInEvent(
                              login: vm.loginController.text.trim(),
                              password: vm.passwordController.text.trim(),
                            ),
                          );
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    text: context.locale?.signIn ?? '',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
