// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_class.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginObjectImplCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$LoginObjectImplCopyWith(
          _$LoginObjectImpl value, $Res Function(_$LoginObjectImpl) then) =
      __$$LoginObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$LoginObjectImplCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$LoginObjectImpl>
    implements _$$LoginObjectImplCopyWith<$Res> {
  __$$LoginObjectImplCopyWithImpl(
      _$LoginObjectImpl _value, $Res Function(_$LoginObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$LoginObjectImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoginObjectImpl implements _LoginObject {
  _$LoginObjectImpl(this.email, this.password);

  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginObjectImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      __$$LoginObjectImplCopyWithImpl<_$LoginObjectImpl>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String email, final String password) =
      _$LoginObjectImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$LoginObjectImplCopyWith<_$LoginObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TraderObject {
  String get name => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TraderObjectCopyWith<TraderObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TraderObjectCopyWith<$Res> {
  factory $TraderObjectCopyWith(
          TraderObject value, $Res Function(TraderObject) then) =
      _$TraderObjectCopyWithImpl<$Res, TraderObject>;
  @useResult
  $Res call({String name, String address, String phone, int price});
}

/// @nodoc
class _$TraderObjectCopyWithImpl<$Res, $Val extends TraderObject>
    implements $TraderObjectCopyWith<$Res> {
  _$TraderObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? phone = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TraderObjectImplCopyWith<$Res>
    implements $TraderObjectCopyWith<$Res> {
  factory _$$TraderObjectImplCopyWith(
          _$TraderObjectImpl value, $Res Function(_$TraderObjectImpl) then) =
      __$$TraderObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String address, String phone, int price});
}

/// @nodoc
class __$$TraderObjectImplCopyWithImpl<$Res>
    extends _$TraderObjectCopyWithImpl<$Res, _$TraderObjectImpl>
    implements _$$TraderObjectImplCopyWith<$Res> {
  __$$TraderObjectImplCopyWithImpl(
      _$TraderObjectImpl _value, $Res Function(_$TraderObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? address = null,
    Object? phone = null,
    Object? price = null,
  }) {
    return _then(_$TraderObjectImpl(
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TraderObjectImpl implements _TraderObject {
  _$TraderObjectImpl(this.name, this.address, this.phone, this.price);

  @override
  final String name;
  @override
  final String address;
  @override
  final String phone;
  @override
  final int price;

  @override
  String toString() {
    return 'TraderObject(name: $name, address: $address, phone: $phone, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TraderObjectImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.phone, phone) || other.phone == phone) &&
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, address, phone, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TraderObjectImplCopyWith<_$TraderObjectImpl> get copyWith =>
      __$$TraderObjectImplCopyWithImpl<_$TraderObjectImpl>(this, _$identity);
}

abstract class _TraderObject implements TraderObject {
  factory _TraderObject(final String name, final String address,
      final String phone, final int price) = _$TraderObjectImpl;

  @override
  String get name;
  @override
  String get address;
  @override
  String get phone;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$TraderObjectImplCopyWith<_$TraderObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
