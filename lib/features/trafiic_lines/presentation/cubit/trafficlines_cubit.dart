import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/model/traffic_line_model.dart';
import '../../domain/usecase/get_dlivary_usecase.dart';

part 'trafficlines_state.dart';

class TrafficLinesCubit extends Cubit<TrafficLinesState> {
  TrafficLinesCubit(this._delivaryLineUseCase) : super(TrafficLinesInitial());
  static TrafficLinesCubit get(context) => BlocProvider.of(context);
  TrafficModel? trafficModel;
  final DelivaryLineUseCase _delivaryLineUseCase;

  getTrafficLines() async {
    emit(GetTrafficLinesLoading());
    final result = await _delivaryLineUseCase.execute('');
    result.fold((failure) => emit(GetTrafficLinesError(failure.message)),
        (success) {
      trafficModel=success;
      emit(GetTrafficLinesLoaded());
    });
  }
}
