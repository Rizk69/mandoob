
import 'package:flutter_bloc/flutter_bloc.dart';

enum BottomNavBarItem { home, talabat, bugs, fawater, visible, hidden }

class BottomNavBarCubit extends Cubit<BottomNavBarItem> {
  BottomNavBarCubit() : super(BottomNavBarItem.home);

  void selectItem(BottomNavBarItem item) => emit(item);
  void show() => emit(BottomNavBarItem.visible);
  void hide() => emit(BottomNavBarItem.hidden);
}
