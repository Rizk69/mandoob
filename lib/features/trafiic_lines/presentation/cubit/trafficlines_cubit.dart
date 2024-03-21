import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/features/trafiic_lines/data/network/search_requests.dart';
import 'package:mandoob/features/trafiic_lines/domain/usecase/search_dlivary_usecase.dart';

import '../../domain/model/traffic_line_model.dart';
import '../../domain/usecase/get_dlivary_usecase.dart';

part 'trafficlines_state.dart';

class TrafficLinesCubit extends Cubit<TrafficLinesState> {
  static TrafficLinesCubit get(context) => BlocProvider.of(context);
  final DelivaryLineUseCase _delivaryLineUseCase;
  final SearchDeliveryLineUseCase _searchDeliveryLineUseCase;

  TrafficLinesCubit(this._delivaryLineUseCase, this._searchDeliveryLineUseCase)
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

    final result = await _searchDeliveryLineUseCase.execute(SearchLineRequest(
      dateString.toString()
    ));
    result.fold((failure) => emit(GetTrafficLinesError(failure.message)),
        (model) {
      trafficModel = model;
      emit(GetTrafficLinesLoaded(model));
    });
  }
}
