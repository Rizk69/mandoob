import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ElSalahCubit extends Cubit<ElSalahState> {
  ElSalahCubit() : super(YourInitialState());
  int countItems = 0;

  void addItem() {
    countItems++;
    emit(YourItemAddedState());
  }

  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void removeItem() {
    if (countItems != 0) {
      countItems--;
    }

    emit(YourItemRemovedState());
  }
}

abstract class ElSalahState {}

class YourInitialState extends ElSalahState {}

class YourItemAddedState extends ElSalahState {}

class YourItemRemovedState extends ElSalahState {}
