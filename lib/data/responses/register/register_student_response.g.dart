// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_student_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterStudentResponse _$RegisterStudentResponseFromJson(
        Map<String, dynamic> json) =>
    RegisterStudentResponse(
      returnValue: json['returnValue'] as int?,
      returnString: json['returnString'] as String?,
      studentID: json['student_ID'] as int?,
      userID: json['user_ID'] as int?,
    );

Map<String, dynamic> _$RegisterStudentResponseToJson(
        RegisterStudentResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnString': instance.returnString,
      'student_ID': instance.studentID,
      'user_ID': instance.userID,
    };

StageResponse _$StageResponseFromJson(Map<String, dynamic> json) =>
    StageResponse(
      json['stage_id'] as int?,
      json['stage_name'] as String?,
    );

Map<String, dynamic> _$StageResponseToJson(StageResponse instance) =>
    <String, dynamic>{
      'stage_id': instance.stageId,
      'stage_name': instance.stageName,
    };

EduYearResponse _$EduYearResponseFromJson(Map<String, dynamic> json) =>
    EduYearResponse(
      eduYearsList: (json['eduYearsList'] as List<dynamic>?)
          ?.map((e) => EduYearListResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EduYearResponseToJson(EduYearResponse instance) =>
    <String, dynamic>{
      'eduYearsList': instance.eduYearsList,
    };

EduYearListResponse _$EduYearListResponseFromJson(Map<String, dynamic> json) =>
    EduYearListResponse(
      id: json['id'] as int?,
      educationalYearArName: json['Educational_year_ar_name'] as String?,
      educationalYearEnName: json['Educational_year_en_name'] as String?,
    );

Map<String, dynamic> _$EduYearListResponseToJson(
        EduYearListResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Educational_year_ar_name': instance.educationalYearArName,
      'Educational_year_en_name': instance.educationalYearEnName,
    };
