class ConfirmModel {
  final bool status;
  final String message;
  final num invoiceId;
  final num priceDoler;
  final num priceLera;

  ConfirmModel({
    required this.status,
    required this.message,
    required this.invoiceId,
    required this.priceDoler,
    required this.priceLera,
  });
}
