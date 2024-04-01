import 'package:mandoob/features/orders/domain/model/company_products_model.dart';

abstract class NewTalabatState {}

class NewTalabatLoading extends NewTalabatState {}

class NewTalabatSuccess extends NewTalabatState {}

class NewTalabatFailure extends NewTalabatState {
  final String massage;

  NewTalabatFailure(this.massage);
}

class ProductCountChanged extends NewTalabatState {
  final int productId;
  final int count;

  ProductCountChanged(this.productId, this.count);
}

class ProductUnitChanged extends NewTalabatState {
  final int productId;
  final UnitModel unit;

  ProductUnitChanged(this.productId, this.unit);
}

class ProductFilterChanged extends NewTalabatState {
  final String filter;

  ProductFilterChanged(this.filter);
}

