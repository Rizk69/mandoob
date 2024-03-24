import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial());
  static AppCubit get(context) => BlocProvider.of(context);


  bool isDark = false;

  void changeAppMode() {
    AppPreferences _appPreferences = instance<AppPreferences>();
    isDark = !isDark;
    _appPreferences.setIsDark(isDark);
    print("Is dark : $isDark");
    emit(AppChangeModeState());
  }




}
