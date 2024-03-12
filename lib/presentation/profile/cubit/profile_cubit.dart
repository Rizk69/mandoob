import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/data/responses/profile/user_response.dart';
import 'package:mandoob/domain/model/user/UserModel.dart';
import 'package:meta/meta.dart';

import '../../../domain/usecase/get_profle_usecase.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  static ProfileCubit get(context) => BlocProvider.of(context);
  final ProfileUseCase _profileUseCase;

  ProfileCubit(this._profileUseCase) : super(ProfileInitial());
  UserModel? userModel;
  Future<void> getProfile() async {
    try {
      emit(ProfileLoadingState());

      final result = await _profileUseCase.execute();
      result.fold((failure) => emit(ProfileErrorState(failure.message)),
          (user) {
        print("_________${user.user?.name}");
        userModel = user;
        emit(ProfileLoadedState());
      });
    } catch (e) {
      emit(ProfileErrorState('An error occurred while fetching profile data'));
    }
  }
}
