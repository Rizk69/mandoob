part of 'eahduh_cubit.dart';

@immutable
abstract class EahduhState {}

class EahduhInitial extends EahduhState {}

class GetEahduhLoadingState extends EahduhState {}

class GetEahduhLoadedState extends EahduhState {}

class GetEahduhErrorState extends EahduhState {
  final String message;

  GetEahduhErrorState(this.message);
}

class DeleteEahduhLoadingState extends EahduhState {}

class DeleteEahduhSuccessState extends EahduhState {}

class DeleteEahduhErrorState extends EahduhState {
  final String message;

  DeleteEahduhErrorState(this.message);
}class AddEahduhLoadingState extends EahduhState {}

class AddEahduhSuccessState extends EahduhState {}

class AddEahduhErrorState extends EahduhState {
  final String message;

  AddEahduhErrorState(this.message);
}
