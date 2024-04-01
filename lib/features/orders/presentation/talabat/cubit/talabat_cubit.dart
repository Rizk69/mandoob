import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/orders/domain/model/talabat_model.dart';

import '../../../domain/usecase/talabat_usecases.dart';

enum TalabatViewState {
  currentOrdersExpanded,
  previousOrdersExpanded,
  loadingPresent,
  errorPresent,
  loadedPresent,
  loadingOld,
  errorOld,
  loadedOld
}

class TalabatViewCubit extends Cubit<TalabatViewState> {
  GetOldTalabatUseCase _getOldTalabatUseCase;
  GetPresentTalabatUseCase _getPresentTalabatUseCase;
  TalabatViewCubit(this._getOldTalabatUseCase, this._getPresentTalabatUseCase)
      : super(TalabatViewState.currentOrdersExpanded);
  TalabatModel? talabatOldModel;
  TalabatModel? talabatPresentModel;
  static TalabatViewCubit get(context) => BlocProvider.of(context);

  void toggleCurrentOrdersExpansion() {
    emit(TalabatViewState.currentOrdersExpanded);
  }

  void togglePreviousOrdersExpansion() {
    emit(TalabatViewState.previousOrdersExpanded);
  }

  void getOldTalabat() async {
    emit(TalabatViewState.loadingOld);
    final result = await _getOldTalabatUseCase.execute("");
    result.fold((failure) => emit(TalabatViewState.errorOld), (success) {
      talabatOldModel = success;
      emit(TalabatViewState.loadedOld);
    });
  }

  void getPresentTalabat() async {
    emit(TalabatViewState.loadingPresent); // Emit loading state
    final result = await _getPresentTalabatUseCase.execute("");
    result.fold(
        (failure) => emit(TalabatViewState.errorPresent), // Emit error state
        (success) {
      talabatPresentModel = success;
      emit(TalabatViewState.loadedPresent);
    });
  }
}
