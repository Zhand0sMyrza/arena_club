part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class UpdateProfileEvent extends ProfileEvent {}