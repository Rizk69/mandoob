class ExpensesModel {
  bool status;
  String message;
  List<ExpenseDataModel> expenses;

  ExpensesModel({
    required this.status,
    required this.message,
    required this.expenses,
  });
}

class ExpenseDataModel {
  int id;
  String reasonExpenseAr;
  String reasonExpenseEn;
  String price;
  String count;
  String date;
  String statusAr;
  String statusEn;

  ExpenseDataModel({
    required this.id,
    required this.reasonExpenseAr,
    required this.reasonExpenseEn,
    required this.price,
    required this.count,
    required this.date,
    required this.statusAr,
    required this.statusEn,
  });
}
