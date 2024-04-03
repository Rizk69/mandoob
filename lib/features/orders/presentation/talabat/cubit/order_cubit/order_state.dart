part of 'order_cubit.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}


class GetOrderLoading extends OrderState {}

class GetOrderSuccess extends OrderState {}

class GetOrderFailure extends OrderState {
  final String massage;

  GetOrderFailure(this.massage);
}


class IncreaseCountLoading extends OrderState {}

class IncreaseCountSuccess extends OrderState {
  final String massage;

  IncreaseCountSuccess(this.massage);
}

class IncreaseCountFailure extends OrderState {
  final String massage;

  IncreaseCountFailure(this.massage);
}


class DecreaseCountLoading extends OrderState {}

class DecreaseCountSuccess extends OrderState {

  final String massage;

  DecreaseCountSuccess(this.massage);
}

class DecreaseCountFailure extends OrderState {
  final String massage;

  DecreaseCountFailure(this.massage);
}

class DeleteOrderLoading extends OrderState {}

class DeleteOrderSuccess extends OrderState {
  final String massage;

  DeleteOrderSuccess(this.massage);
}

class DeleteOrderFailure extends OrderState {
  final String massage;

  DeleteOrderFailure(this.massage);
}