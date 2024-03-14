part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {}

class ProfileErrorState extends ProfileState {
  final String message;

  ProfileErrorState(this.message);
}

class EditProfileColorLoadingState extends ProfileState {}

class EditProfileColorLoadedState extends ProfileState {}

class EditProfileColorErrorState extends ProfileState {
  final String message;

  EditProfileColorErrorState(this.message);
}
