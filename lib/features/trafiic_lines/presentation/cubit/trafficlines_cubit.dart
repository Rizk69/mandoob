import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/trafiic_lines/data/network/add_requests.dart';
import 'package:mandoob/features/trafiic_lines/data/network/search_requests.dart';
import 'package:mandoob/features/trafiic_lines/domain/usecase/add_dlivary_usecase.dart';
import 'package:mandoob/features/trafiic_lines/domain/usecase/close_dlivary_usecase.dart';
import 'package:mandoob/features/trafiic_lines/domain/usecase/delete_dlivary_usecase.dart';
import 'package:mandoob/features/trafiic_lines/domain/usecase/search_dlivary_usecase.dart';

import '../../domain/model/traffic_line_model.dart';
import '../../domain/usecase/get_dlivary_usecase.dart';

part 'trafficlines_state.dart';

class TrafficLinesCubit extends Cubit<TrafficLinesState> {
  static TrafficLinesCubit get(context) => BlocProvider.of(context);
  final DelivaryLineUseCase _delivaryLineUseCase;
  final SearchDeliveryLineUseCase _searchDeliveryLineUseCase;
  final DeleteDeliveryLineUseCase _deleteDeliveryLineUseCase;
  final CloseDeliveryLineUseCase _closeDeliveryLineUseCase;
  final AddDeliveryLineUseCase _addDeliveryLineUseCase;

  TrafficLinesCubit(
      this._delivaryLineUseCase,
      this._searchDeliveryLineUseCase,
      this._deleteDeliveryLineUseCase,
      this._addDeliveryLineUseCase,
      this._closeDeliveryLineUseCase)
      : super(TrafficLinesInitial());

  TrafficModel? trafficModel;

  getTrafficLines() async {
    emit(GetTrafficLinesLoading());
    final result = await _delivaryLineUseCase.execute('');
    result.fold((failure) => emit(GetTrafficLinesError(failure.message)),
        (model) {
      trafficModel = model;
      emit(GetTrafficLinesLoaded(model));
    });
  }

  void searchTraffic(String query) {
    emit(SearchTrafficLoadingState());

    if (query.isEmpty) {
      emit(SearchTrafficSuccessState(trafficModel));
      return;
    }
    final filteredTrafficData = trafficModel?.data.where((item) {
          return item.customerName.toLowerCase().contains(query.toLowerCase());
        }).toList() ??
        [];

    if (filteredTrafficData.isNotEmpty) {
      final resultModel = TrafficModel(
        status: trafficModel?.status ?? false,
        message: "Search Results",
        countDataModel: trafficModel?.countDataModel ??
            CountDataTrafficModel(active: 0, notActive: 0),
        data: filteredTrafficData,
      );
      emit(SearchTrafficSuccessState(resultModel));
    } else {
      emit(SearchTrafficErrorState("No matching results found"));
    }
  }

  void filterTrafficByDate(DateTime date) {
    emit(SearchTrafficLoadingState()); // حالة التحميل

    // تحويل التاريخ المحدد إلى نص للمقارنة
    final dateString = DateFormat('yyyy-MM-dd').format(date);

    // تصفية البيانات بناءً على التاريخ
    final filteredData = trafficModel?.data.where((item) {
          return item.date.contains(dateString);
        }).toList() ??
        [];

    if (filteredData.isNotEmpty) {
      final resultModel = TrafficModel(
        status: trafficModel?.status ?? false,
        message: "نتائج البحث بناءً على التاريخ",
        countDataModel: trafficModel?.countDataModel ??
            CountDataTrafficModel(active: 0, notActive: 0),
        data: filteredData,
      );
      emit(SearchTrafficSuccessState(resultModel));
    } else {
      emit(SearchTrafficErrorState("لم يتم العثور على نتائج مطابقة"));
    }
  }

  DateTime focusDate = DateTime.now();

  selectTime(DateTime time) {
    focusDate = time;
    emit(SelectTimeSuccessState());
  }

  void getTrafficLinesForDate(DateTime selectedDate) async {
    emit(GetTrafficLinesLoading());

    final dateString = DateFormat('yyyy-MM-dd').format(selectedDate);

    final result = await _searchDeliveryLineUseCase
        .execute(SearchLineRequest(dateString.toString()));
    result.fold((failure) => emit(GetTrafficLinesError(failure.message)),
        (model) {
      trafficModel = model;
      emit(GetTrafficLinesLoaded(model));
    });
  }

  deleteTrafficLine(int id) async {
    emit(DeleteTrafficLinesLoading());
    final result = await _deleteDeliveryLineUseCase.execute(id);
    result.fold((failure) => emit(DeleteTrafficLinesError(failure.message)),
        (success) {
      emit(DeleteTrafficLinesLoaded());
    });
  }

  closeTrafficLine(int id) async {
    emit(CloseTrafficLinesLoaded());
    final result = await _closeDeliveryLineUseCase.execute(id);
    result.fold((failure) => emit(CloseTrafficLinesError(failure.message)),
        (success) {
      emit(CloseTrafficLinesLoaded());
    });
  }

  addTrafficLine({required String customerId, required String date}) async {
    emit(AddTrafficLinesLoading());
    final result =
        await _addDeliveryLineUseCase.execute(AddLineRequest(customerId, date));
    result.fold((failure) => emit(AddTrafficLinesError(failure.message)),
        (success) {
      emit(AddTrafficLinesLoaded());
    });
  }
}
