part of 'trafficlines_cubit.dart';

@immutable
abstract class TrafficLinesState {}

class TrafficLinesInitial extends TrafficLinesState {}
class GetTrafficLinesLoaded extends TrafficLinesState {}
class GetTrafficLinesLoading extends TrafficLinesState {}
class GetTrafficLinesError extends TrafficLinesState {
  final String message;

  GetTrafficLinesError(this.message);
}


class SelectTimeSuccessState extends TrafficLinesState {}
