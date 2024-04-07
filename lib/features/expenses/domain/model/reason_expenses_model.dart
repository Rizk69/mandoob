class ReasonExpensesModel {
  bool status;
  String message;
  List<ReasonExpense> reasonExpense;

  ReasonExpensesModel({
    required this.status,
    required this.message,
    required this.reasonExpense,
  });

}

class ReasonExpense {
  int id;
  String nameAr;
  String nameEn;

  ReasonExpense({
    required this.id,
    required this.nameAr,
    required this.nameEn,
  });

}
