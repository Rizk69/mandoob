class DeptTraderModel {
  bool status;
  String message;
  List<DebtDetail> debts;

  DeptTraderModel({
    required this.status,
    required this.message,
    required this.debts,
  });
}

class DebtDetail {
  int id;
  String traderName;
  num debtDoler;
  num debtLera;
  String lastDate;
  String dueDate;

  DebtDetail({
    required this.id,
    required this.traderName,
    required this.debtDoler,
    required this.debtLera,
    required this.lastDate,
    required this.dueDate,
  });
}
