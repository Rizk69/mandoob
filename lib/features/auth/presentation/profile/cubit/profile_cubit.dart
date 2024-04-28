import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/features/auth/data/network/auth_requests.dart';
import 'package:mandoob/features/auth/domain/model/profile/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../domain/usecase/get_profle_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit get(context) => BlocProvider.of(context);
  final ProfileUseCase _profileUseCase;
  final ProfileEditColorUseCase _profileEditColorUseCase;
  AppPreferences _appPreferences = instance<AppPreferences>();

  ProfileCubit(this._profileUseCase, this._profileEditColorUseCase)
      : super(ProfileInitial()) {}
  UserModel? userModel;
  String? primaryColor;

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
      emit(EditProfileColorLoadingState());

      final result =
          await _profileEditColorUseCase.execute(ColorProfile(id.toString()));
      result
          .fold((failure) => emit(EditProfileColorErrorState(failure.message)),
              (user) {
        primaryColor = color;
        _appPreferences.setPrimaryColor(color);
        emit(EditProfileColorLoadedState());
      });
    } catch (e) {
      emit(EditProfileColorErrorState(
          'An error occurred while fetching profile data'));
    }
  }
}
