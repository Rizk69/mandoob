import 'package:bloc/bloc.dart';

enum BottomNavBarItem { home, talabat, bugs, fawater }

class BottomNavBarCubit extends Cubit<BottomNavBarItem> {
  BottomNavBarCubit() : super(BottomNavBarItem.home);

  void selectItem(BottomNavBarItem item) => emit(item);
}
