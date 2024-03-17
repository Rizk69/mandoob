import 'package:flutter_bloc/flutter_bloc.dart';

class NewTalabatCubit extends Cubit<int> {
  NewTalabatCubit() : super(0);

  int count = 0;

  void increment() {
    count++;
    emit(count);
  }

  void decrement() {
    if (count > 0) {
      count--;
      emit(count);
    }
  }
}
