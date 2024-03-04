import 'package:flutter_bloc/flutter_bloc.dart';

enum TalabatViewState { currentOrdersExpanded, previousOrdersExpanded }

class TalabatViewCubit extends Cubit<TalabatViewState> {
  TalabatViewCubit() : super(TalabatViewState.currentOrdersExpanded);

  void toggleCurrentOrdersExpansion() {
    emit(TalabatViewState.currentOrdersExpanded);
  }

  void togglePreviousOrdersExpansion() {
    emit(TalabatViewState.previousOrdersExpanded);
  }
}
