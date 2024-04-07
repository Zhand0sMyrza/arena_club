import 'package:arena_club/data/models/token_response.dart';
import 'package:arena_club/data/repository/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Repository repo;

  ProfileBloc(this.repo) : super(ProfileInitial()) {
    on<UpdateProfileEvent>(_onUpdateProfile);
  }

  Future _onUpdateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoadingState(true));
    try {
      final user = await repo.profileRepo.getSavedUser();
      emit(ProfileLoadingState(false));
      emit(ProfileDataState(user: user));
    } catch (e) {
      emit(ProfileLoadingState(false));
      emit(ProfileFetchErrorState());
    }
  }

}
