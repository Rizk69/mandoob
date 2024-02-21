import 'package:json_annotation/json_annotation.dart';

part 'register_student_response.g.dart';

@JsonSerializable()
class RegisterStudentResponse {
  @JsonKey(name: "returnValue")
  int? returnValue;
  @JsonKey(name: "returnString")
  String? returnString;
  @JsonKey(name: "student_ID")
  int? studentID;
  @JsonKey(name: "user_ID")
  int? userID;

  RegisterStudentResponse({
    this.returnValue,
    this.returnString,
    this.studentID,
    this.userID,
  });

  factory RegisterStudentResponse.fromJson(Map<String, dynamic> json) =>
      _$RegisterStudentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterStudentResponseToJson(this);
}


@JsonSerializable()
class StageResponse {
  @JsonKey(name: "stage_id")
  final int? stageId;
  @JsonKey(name: "stage_name")
  final String? stageName;

  StageResponse(this.stageId, this.stageName);

  factory StageResponse.fromJson(Map<String, dynamic> json) =>
      _$StageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StageResponseToJson(this);
}

@JsonSerializable()
class EduYearResponse {
  @JsonKey(name: "eduYearsList")
  List<EduYearListResponse>? eduYearsList;

  EduYearResponse({this.eduYearsList});

  factory EduYearResponse.fromJson(Map<String, dynamic> json) =>
      _$EduYearResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EduYearResponseToJson(this);
}

@JsonSerializable()
class EduYearListResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "Educational_year_ar_name")
  String? educationalYearArName;
  @JsonKey(name: "Educational_year_en_name")
  String? educationalYearEnName;


  EduYearListResponse({
    this.id,
    this.educationalYearArName,
    this.educationalYearEnName,
  });

  factory EduYearListResponse.fromJson(Map<String, dynamic> json) =>
      _$EduYearListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$EduYearListResponseToJson(this);
}

