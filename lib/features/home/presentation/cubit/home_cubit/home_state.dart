part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class SetPriceState extends HomeState {}


class GetHomeLoadingState extends HomeState {}

class GetHomeLoadedState extends HomeState {}

class GetHomeErrorState extends HomeState {
  final String message;

  GetHomeErrorState(this.message);
}


class EditPriceLoadingState extends HomeState {}

class EditPriceLoadedState extends HomeState {}

class EditPriceErrorState extends HomeState {
  final String message;

  EditPriceErrorState(this.message);
}

