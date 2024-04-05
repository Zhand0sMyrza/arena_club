import 'package:arena_club/data/repository/repository.dart';
import 'package:arena_club/screens/authorization_screen/src/bloc/auth_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_main_event.dart';
part 'app_main_state.dart';

class AppMainBloc extends Bloc<AppMainEvent, AppMainState> {
  AppMainBloc({required this.repo, required this.authBloc})
      : super(AppInitialState()) {
    on<AppStartedEvent>(_onAppStarted);
  }

  final Repository repo;
  final AuthBloc authBloc;

  Future<void> _onAppStarted(
    AppStartedEvent event,
    Emitter<AppMainState> emit,
  ) async {
    emit(AppSplashState());
    emit(AppLoadingState(isLoading: true));
    await repo.init();
    authBloc.add(CheckAuthEvent());

    /// имитация загрузки для сплеша, и для того чтобы выполнился CheckAuthEvent
    await Future.delayed(const Duration(seconds: 4));

    final isAuthorized = authBloc.isAuthorized;
    emit(AppLoadingState(isLoading: false));
    emit(AppStartedState(isAuthorized: isAuthorized));
  }
}
