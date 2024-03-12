part of 'profile_cubit.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  // final UserResponse userResponse;
  //
  // ProfileLoadedState({required this.userResponse});
}

class ProfileErrorState extends ProfileState {
  final String message;

  ProfileErrorState(this.message);
}
