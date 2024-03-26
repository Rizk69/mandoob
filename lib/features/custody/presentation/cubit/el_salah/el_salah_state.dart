part of 'el_salah_cubit.dart';

@immutable
abstract class ElSalahState {}

class ElSalahInitial extends ElSalahState {}


class GetCartLoadingState extends ElSalahState {}

class GetCartLoadedState extends ElSalahState {}

class GetCartErrorState extends ElSalahState {
  final String message;

  GetCartErrorState(this.message);
}



class YourInitialState extends ElSalahState {}

class YourItemAddedState extends ElSalahState {}

class YourItemRemovedState extends ElSalahState {}
