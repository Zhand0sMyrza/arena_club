part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {
  final bool isLoading;

  ProfileLoadingState([this.isLoading = false]);
}

final class ProfileDataState extends ProfileState {
  final UserModel user;

  ProfileDataState({required this.user});
}

final class ProfileFetchErrorState extends ProfileState {}
