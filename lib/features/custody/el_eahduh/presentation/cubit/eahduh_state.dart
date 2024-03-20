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
