class DebtDelegateModel {
  bool status;
  String message;
  List<DebtDelegateDataModel> debts;

  DebtDelegateModel({
    required this.status,
    required this.message,
    required this.debts,
  });
}


class DebtDelegateDataModel {
  int id;
  String debtPriceDoler;
  String debtPriceLera;
  String date;
  String reasonExpensesNameAr;
  String reasonExpensesNameEn;

  DebtDelegateDataModel({
    required this.id,
    required this.debtPriceDoler,
    required this.debtPriceLera,
    required this.date,
    required this.reasonExpensesNameAr,
    required this.reasonExpensesNameEn,
  });
}
