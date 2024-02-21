import 'package:mandoob/app/constants.dart';
import 'package:mandoob/app/extension.dart';
import 'package:mandoob/data/responses/register/register_response.dart';
import 'package:mandoob/data/responses/register/register_student_response.dart';
import 'package:mandoob/domain/model/register/edu_year_model.dart';
import 'package:mandoob/domain/model/register/register_model.dart';
import 'package:mandoob/domain/model/register/register_student_model.dart';
import 'package:mandoob/domain/model/register/stage_model.dart';

extension RegisterMapper on RegisterResponse? {
  RegisterModel toDomain() {
    return RegisterModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnString.orEmpty() ?? Constants.empty,
      this?.userId.orZero() ?? Constants.zero,
      this?.userArName.orEmpty() ?? Constants.empty,
      this?.userPicture.orEmpty() ?? Constants.empty,
      this?.userTypeId.orZero() ?? Constants.zero,
      this?.userTypeArName.orEmpty() ?? Constants.empty,
      this?.token.toDomain(),
    );
  }
}

extension TokenMapper on TokenResponse? {
  TokenModel toDomain() {
    return TokenModel(
      this?.funcs.orZero() ?? Constants.zero,
      this!.eduCompList ?? [],
      this?.token.orEmpty() ?? Constants.empty,
      this?.returnValue.orZero() ?? Constants.zero,
      this?.roleId.orZero() ?? Constants.zero,
      this?.typeId.orZero() ?? Constants.zero,
    );
  }
}

extension RegisterStudentMapper on RegisterStudentResponse? {
  RegisterStudentModel toDomain() {
    return RegisterStudentModel(
      this?.returnValue.orZero() ?? Constants.zero,
      this?.returnString.orEmpty() ?? Constants.empty,
      this?.studentID.orZero() ?? Constants.zero,
      this?.userID.orZero() ?? Constants.zero,
    );
  }
}

extension StageMapper on StageResponse? {
  StageModel toDomain() {
    return StageModel(
      this?.stageId.orZero() ?? Constants.zero,
      this?.stageName.orEmpty() ?? Constants.empty,
    );
  }
}

extension EduYearResponseMapper on EduYearResponse? {
  EduYearsModel toDomain() {
    return EduYearsModel(
      eduYearsList: this?.eduYearsList?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension EduYearListResponseMapper on EduYearListResponse? {
  EduYearsListModel toDomain() {
    return EduYearsListModel(
      id: this?.id.orZero() ?? Constants.zero,
      educationalYearArName: this?.educationalYearArName.orEmpty() ?? Constants.empty,
      educationalYearEnName: this?.educationalYearEnName.orEmpty() ?? Constants.empty,
    );
  }
}
