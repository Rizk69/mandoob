import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class YourCubit extends Cubit<YourState> {
  YourCubit() : super(YourInitialState());
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

abstract class YourState {}

class YourInitialState extends YourState {}

class YourItemAddedState extends YourState {}

class YourItemRemovedState extends YourState {}
