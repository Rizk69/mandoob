import 'package:mandoob/features/orders/domain/model/talabat_model.dart';

abstract class TalabatViewState {}

class CurrentOrdersExpandedState extends TalabatViewState {}

class PreviousOrdersExpandedState extends TalabatViewState {}

class LoadingPresentState extends TalabatViewState {}

class ErrorPresentState extends TalabatViewState {
  final String errorMessage;
  ErrorPresentState(this.errorMessage);
}

class LoadedPresentState extends TalabatViewState {
  final TalabatModel talabatPresentModel;
  LoadedPresentState(this.talabatPresentModel);
}

class LoadingOldState extends TalabatViewState {}

class ErrorOldState extends TalabatViewState {
  final String errorMessage;
  ErrorOldState(this.errorMessage);
}

class LoadedOldState extends TalabatViewState {
  final TalabatModel talabatOldModel;
  LoadedOldState(this.talabatOldModel);
}
