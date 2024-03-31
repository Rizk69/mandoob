import 'package:flutter_bloc/flutter_bloc.dart';


enum DebtsViewState {
  currentOrdersExpanded,
  previousOrdersExpanded,
  loading,
  error,
  loaded
}
class DebtsViewCubit extends Cubit<DebtsViewState> {

  DebtsViewCubit() : super(DebtsViewState.currentOrdersExpanded);

  static DebtsViewCubit get(context) => BlocProvider.of(context);

  void toggleCurrentOrdersExpansion() {
    emit(DebtsViewState.currentOrdersExpanded);
  }

  void togglePreviousOrdersExpansion() {
    emit(DebtsViewState.previousOrdersExpanded);
  }

}

