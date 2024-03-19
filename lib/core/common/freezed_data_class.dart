import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_class.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String email, String password) = _LoginObject;
}


@freezed
class TraderObject with _$TraderObject {
  factory TraderObject(String name, String address, String phone, int price) = _TraderObject;
}


