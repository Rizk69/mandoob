import 'package:flutter_bloc/flutter_bloc.dart';

enum FawaterViewState { currentOrdersExpanded, previousOrdersExpanded }

class FawaterViewCubit extends Cubit<FawaterViewState> {
  FawaterViewCubit() : super(FawaterViewState.currentOrdersExpanded);

  void toggleCurrentOrdersExpansion() {
    emit(FawaterViewState.currentOrdersExpanded);
  }

  void togglePreviousOrdersExpansion() {
    emit(FawaterViewState.previousOrdersExpanded);
  }
}
