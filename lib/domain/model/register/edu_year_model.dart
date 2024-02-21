class EduYearsModel {
  List<EduYearsListModel> eduYearsList;

  EduYearsModel({required this.eduYearsList});

}

class EduYearsListModel {
  int id;
  String educationalYearArName;
  String educationalYearEnName;

  EduYearsListModel(
      {
        required this.id,
        required this.educationalYearArName,
        required this.educationalYearEnName,
      });

}

