import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'el_salah_state.dart';

class ElSalahCubit extends Cubit<ElSalahState> {
  ElSalahCubit() : super(ElSalahInitial());
}
