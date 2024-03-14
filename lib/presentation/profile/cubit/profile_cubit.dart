import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/domain/model/profile/user_model.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecase/get_profle_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit get(context) => BlocProvider.of(context);
  final ProfileUseCase _profileUseCase;

  ProfileCubit(this._profileUseCase) : super(ProfileInitial());
  UserModel? userModel;

  bool showRow = false;


  changeRowVisalbilty(){
    showRow = !showRow;
    emit(changeVisabialtyState());
  }

  Future<void> getProfile() async {
    try {
      emit(ProfileLoadingState());

      final result = await _profileUseCase.execute("");
      result.fold((failure) => emit(ProfileErrorState(failure.message)),
          (user) {
        userModel = user;
        emit(ProfileLoadedState());
      });
    } catch (e) {
      emit(ProfileErrorState('An error occurred while fetching profile data'));
    }
  }

  void selectColor(String color, int id) {
    print(id);
  }
}
