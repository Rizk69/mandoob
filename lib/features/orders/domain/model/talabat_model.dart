class TalabatModel {
  final bool status;
  final String message;
  final BalanceTalabat balance;
  final List<OrdersTalabat> orders;

  TalabatModel({
    required this.status,
    required this.message,
    required this.balance,
    required this.orders,
  });

  factory TalabatModel.empty() {
    return TalabatModel(
      status: false,
      message: '',
      balance: BalanceTalabat.empty(),
      orders: [],
    );
  }

  TalabatModel copyWith({
    bool? status,
    String? message,
    BalanceTalabat? balance,
    List<OrdersTalabat>? orders,
  }) {
    return TalabatModel(
      status: status ?? this.status,
      message: message ?? this.message,
      balance: balance ?? this.balance,
      orders: orders ?? this.orders,
    );
  }
}


class OrdersTalabat {
  final int id;
  final String orderNo;
  final String date;
  final int priceDoler;
  final String status_ar;
  final String status_en;
  final int priceLera;

  OrdersTalabat({
    required this.id,
    required this.orderNo,
    required this.date,
    required this.priceDoler,
    required this.status_ar,
    required this.status_en,
    required this.priceLera,
  });

  factory OrdersTalabat.example() {
    return OrdersTalabat(
      id: 0,
      orderNo: 'Default',
      date: '',
      priceDoler: 0,
      status_ar: '',
      status_en: '',
      priceLera: 0,
    );
  }

  OrdersTalabat copyWith({
    int? id,
    String? orderNo,
    String? date,
    int? priceDoler,
    String? status_ar,
    String? status_en,
    int? priceLera,
  }) {
    return OrdersTalabat(
      id: id ?? this.id,
      orderNo: orderNo ?? this.orderNo,
      date: date ?? this.date,
      priceDoler: priceDoler ?? this.priceDoler,
      status_ar: status_ar ?? this.status_ar,
      status_en: status_en ?? this.status_en,
      priceLera: priceLera ?? this.priceLera,
    );
  }
}

class BalanceTalabat {
  final int totalDoler;
  final int totalLera;

  BalanceTalabat({
    required this.totalDoler,
    required this.totalLera,
  });

  factory BalanceTalabat.empty() {
    return BalanceTalabat(
      totalDoler: 0,
      totalLera: 0,
    );
  }

  BalanceTalabat copyWith({
    int? totalDoler,
    int? totalLera,
  }) {
    return BalanceTalabat(
      totalDoler: totalDoler ?? this.totalDoler,
      totalLera: totalLera ?? this.totalLera,
    );
  }
}
