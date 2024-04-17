import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

@immutable
abstract class DebtsState {}



class DebtsInitial extends DebtsState {}

class GetDelegateDebtsLoadingState extends DebtsState {}

class GetDelegateDebtsErrorState extends DebtsState {
  final String message;
  GetDelegateDebtsErrorState(this.message);
}

class GetDelegateDebtsLoadedState extends DebtsState {}


class GetTraderDebtsLoadingState extends DebtsState {}

class GetTraderDebtsErrorState extends DebtsState {
  final String message;
  GetTraderDebtsErrorState(this.message);
}

class GetTraderDebtsLoadedState extends DebtsState {}

class CurrentOrdersExpanded extends DebtsState {}
class PreviousOrdersExpanded extends DebtsState {}


