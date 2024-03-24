import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';
import 'package:meta/meta.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppPreferences appPreferences = instance<AppPreferences>();
  late bool isDark;

  AppCubit() : super(AppInitial()) {
    isDark = appPreferences.getIsDark();
  }

  static AppCubit get(context) => BlocProvider.of(context);

  void changeAppMode() {
    isDark = !isDark;
    appPreferences.setIsDark(isDark);
    print("Is dark : $isDark");
    emit(AppChangeModeState());
  }
}
