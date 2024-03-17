import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/data/network/requests.dart';
import 'package:mandoob/domain/model/profile/user_model.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecase/edit_Color_Profile_usecases.dart';
import '../../../domain/usecase/get_profle_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit get(context) => BlocProvider.of(context);
  final ProfileUseCase _profileUseCase;
  final EditColorProfileUseCase _editColorProfileUseCase;

  ProfileCubit(this._profileUseCase, this._editColorProfileUseCase)
      : super(ProfileInitial());
  UserModel? userModel;

  bool showRow = false;

  changeRowVisalbilty() {
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

  void selectColor(String color, int id) async {
    try {
      emit(ProfileLoadingState());

      final result =
          await _editColorProfileUseCase.execute(ColorProfile(id.toString()));
      result.fold(
        (failure) => emit(EditProfileColorErrorState(failure.message)),
        (r) => emit(EditProfileColorLoadedState()),
      );
    } catch (e) {
      emit(ProfileErrorState('An error occurred while fetching profile data'));
    }
  }
}
