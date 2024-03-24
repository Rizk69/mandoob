part of 'trafficlines_cubit.dart';

@immutable
abstract class TrafficLinesState {}

class TrafficLinesInitial extends TrafficLinesState {}
class GetTrafficLinesLoaded extends TrafficLinesState {
  final TrafficModel? model;

  GetTrafficLinesLoaded(this.model);
}
class GetTrafficLinesLoading extends TrafficLinesState {}
class GetTrafficLinesError extends TrafficLinesState {
  final String message;

  GetTrafficLinesError(this.message);
}


class SelectTimeSuccessState extends TrafficLinesState {}



class SearchTrafficLoadingState extends TrafficLinesState {}
class SearchTrafficSuccessState extends TrafficLinesState {
  final TrafficModel? model;

  SearchTrafficSuccessState(this.model);
}
class SearchTrafficErrorState extends TrafficLinesState {
  final String message;

  SearchTrafficErrorState(this.message);
}




class DeleteTrafficLinesLoaded extends TrafficLinesState {}
class DeleteTrafficLinesLoading extends TrafficLinesState {}
class DeleteTrafficLinesError extends TrafficLinesState {
  final String message;
  DeleteTrafficLinesError(this.message);
}


class AddTrafficLinesLoaded extends TrafficLinesState {}
class AddTrafficLinesLoading extends TrafficLinesState {}
class AddTrafficLinesError extends TrafficLinesState {
  final String message;
  AddTrafficLinesError(this.message);
}