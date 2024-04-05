import 'package:arena_club/data/repository/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this.repo) : super(AuthInitial()) {
    on<CheckAuthEvent>(_onCheckAuth);
    on<SignInEvent>(_onSignIn);
  }

  final Repository repo;
  bool isAuthorized = false;

  Future _onCheckAuth(
    CheckAuthEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      isAuthorized = await repo.authRepo.isAuthorized();
    } catch (e) {
      emit(AuthFailureState(errorText: e.toString()));
    }
  }

  Future _onSignIn(
    SignInEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoadingState());
    try {
      final authResponse =
          await repo.authRepo.signIn(event.login, event.password);
      isAuthorized = true;
      emit(AuthorizedState(username: authResponse.user.name));
    } catch (e) {
      emit(AuthFailureState(errorText: e.toString()));
    }
  }
}
