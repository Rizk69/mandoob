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
mixin _$EditProfileObject {
  String get arabicUserName => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileObjectCopyWith<EditProfileObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileObjectCopyWith<$Res> {
  factory $EditProfileObjectCopyWith(
          EditProfileObject value, $Res Function(EditProfileObject) then) =
      _$EditProfileObjectCopyWithImpl<$Res, EditProfileObject>;
  @useResult
  $Res call(
      {String arabicUserName,
      String mobileNumber,
      String profilePicture,
      String password,
      String confirmPassword,
      String newPassword,
      String email});
}

/// @nodoc
class _$EditProfileObjectCopyWithImpl<$Res, $Val extends EditProfileObject>
    implements $EditProfileObjectCopyWith<$Res> {
  _$EditProfileObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arabicUserName = null,
    Object? mobileNumber = null,
    Object? profilePicture = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? newPassword = null,
    Object? email = null,
  }) {
    return _then(_value.copyWith(
      arabicUserName: null == arabicUserName
          ? _value.arabicUserName
          : arabicUserName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$EditProfileObjectImplCopyWith<$Res>
    implements $EditProfileObjectCopyWith<$Res> {
  factory _$$EditProfileObjectImplCopyWith(_$EditProfileObjectImpl value,
          $Res Function(_$EditProfileObjectImpl) then) =
      __$$EditProfileObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String arabicUserName,
      String mobileNumber,
      String profilePicture,
      String password,
      String confirmPassword,
      String newPassword,
      String email});
}

/// @nodoc
class __$$EditProfileObjectImplCopyWithImpl<$Res>
    extends _$EditProfileObjectCopyWithImpl<$Res, _$EditProfileObjectImpl>
    implements _$$EditProfileObjectImplCopyWith<$Res> {
  __$$EditProfileObjectImplCopyWithImpl(_$EditProfileObjectImpl _value,
      $Res Function(_$EditProfileObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arabicUserName = null,
    Object? mobileNumber = null,
    Object? profilePicture = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? newPassword = null,
    Object? email = null,
  }) {
    return _then(_$EditProfileObjectImpl(
      null == arabicUserName
          ? _value.arabicUserName
          : arabicUserName // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$EditProfileObjectImpl implements _EditProfileObject {
  _$EditProfileObjectImpl(
      this.arabicUserName,
      this.mobileNumber,
      this.profilePicture,
      this.password,
      this.confirmPassword,
      this.newPassword,
      this.email);

  @override
  final String arabicUserName;
  @override
  final String mobileNumber;
  @override
  final String profilePicture;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String newPassword;
  @override
  final String email;

  @override
  String toString() {
    return 'EditProfileObject(arabicUserName: $arabicUserName, mobileNumber: $mobileNumber, profilePicture: $profilePicture, password: $password, confirmPassword: $confirmPassword, newPassword: $newPassword, email: $email)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditProfileObjectImpl &&
            (identical(other.arabicUserName, arabicUserName) ||
                other.arabicUserName == arabicUserName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, arabicUserName, mobileNumber,
      profilePicture, password, confirmPassword, newPassword, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditProfileObjectImplCopyWith<_$EditProfileObjectImpl> get copyWith =>
      __$$EditProfileObjectImplCopyWithImpl<_$EditProfileObjectImpl>(
          this, _$identity);
}

abstract class _EditProfileObject implements EditProfileObject {
  factory _EditProfileObject(
      final String arabicUserName,
      final String mobileNumber,
      final String profilePicture,
      final String password,
      final String confirmPassword,
      final String newPassword,
      final String email) = _$EditProfileObjectImpl;

  @override
  String get arabicUserName;
  @override
  String get mobileNumber;
  @override
  String get profilePicture;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get newPassword;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$EditProfileObjectImplCopyWith<_$EditProfileObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PictureObject {
  String get base64 => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get lastModified => throw _privateConstructorUsedError;
  String get lastModifiedDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PictureObjectCopyWith<PictureObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureObjectCopyWith<$Res> {
  factory $PictureObjectCopyWith(
          PictureObject value, $Res Function(PictureObject) then) =
      _$PictureObjectCopyWithImpl<$Res, PictureObject>;
  @useResult
  $Res call(
      {String base64,
      String name,
      int size,
      String type,
      int lastModified,
      String lastModifiedDate});
}

/// @nodoc
class _$PictureObjectCopyWithImpl<$Res, $Val extends PictureObject>
    implements $PictureObjectCopyWith<$Res> {
  _$PictureObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64 = null,
    Object? name = null,
    Object? size = null,
    Object? type = null,
    Object? lastModified = null,
    Object? lastModifiedDate = null,
  }) {
    return _then(_value.copyWith(
      base64: null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      lastModified: null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as int,
      lastModifiedDate: null == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PictureObjectImplCopyWith<$Res>
    implements $PictureObjectCopyWith<$Res> {
  factory _$$PictureObjectImplCopyWith(
          _$PictureObjectImpl value, $Res Function(_$PictureObjectImpl) then) =
      __$$PictureObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String base64,
      String name,
      int size,
      String type,
      int lastModified,
      String lastModifiedDate});
}

/// @nodoc
class __$$PictureObjectImplCopyWithImpl<$Res>
    extends _$PictureObjectCopyWithImpl<$Res, _$PictureObjectImpl>
    implements _$$PictureObjectImplCopyWith<$Res> {
  __$$PictureObjectImplCopyWithImpl(
      _$PictureObjectImpl _value, $Res Function(_$PictureObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? base64 = null,
    Object? name = null,
    Object? size = null,
    Object? type = null,
    Object? lastModified = null,
    Object? lastModifiedDate = null,
  }) {
    return _then(_$PictureObjectImpl(
      null == base64
          ? _value.base64
          : base64 // ignore: cast_nullable_to_non_nullable
              as String,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      null == lastModified
          ? _value.lastModified
          : lastModified // ignore: cast_nullable_to_non_nullable
              as int,
      null == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$PictureObjectImpl implements _PictureObject {
  _$PictureObjectImpl(this.base64, this.name, this.size, this.type,
      this.lastModified, this.lastModifiedDate);

  @override
  final String base64;
  @override
  final String name;
  @override
  final int size;
  @override
  final String type;
  @override
  final int lastModified;
  @override
  final String lastModifiedDate;

  @override
  String toString() {
    return 'PictureObject(base64: $base64, name: $name, size: $size, type: $type, lastModified: $lastModified, lastModifiedDate: $lastModifiedDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PictureObjectImpl &&
            (identical(other.base64, base64) || other.base64 == base64) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.lastModified, lastModified) ||
                other.lastModified == lastModified) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, base64, name, size, type, lastModified, lastModifiedDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PictureObjectImplCopyWith<_$PictureObjectImpl> get copyWith =>
      __$$PictureObjectImplCopyWithImpl<_$PictureObjectImpl>(this, _$identity);
}

abstract class _PictureObject implements PictureObject {
  factory _PictureObject(
      final String base64,
      final String name,
      final int size,
      final String type,
      final int lastModified,
      final String lastModifiedDate) = _$PictureObjectImpl;

  @override
  String get base64;
  @override
  String get name;
  @override
  int get size;
  @override
  String get type;
  @override
  int get lastModified;
  @override
  String get lastModifiedDate;
  @override
  @JsonKey(ignore: true)
  _$$PictureObjectImplCopyWith<_$PictureObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterObject {
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get guardianName => throw _privateConstructorUsedError;
  String get guardianNumber => throw _privateConstructorUsedError;
  int get eduYearID => throw _privateConstructorUsedError;
  String get stage => throw _privateConstructorUsedError;
  int get stageId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res, RegisterObject>;
  @useResult
  $Res call(
      {String email,
      String password,
      String confirmPassword,
      String mobileNumber,
      String userName,
      String guardianName,
      String guardianNumber,
      int eduYearID,
      String stage,
      int stageId});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res, $Val extends RegisterObject>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? mobileNumber = null,
    Object? userName = null,
    Object? guardianName = null,
    Object? guardianNumber = null,
    Object? eduYearID = null,
    Object? stage = null,
    Object? stageId = null,
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
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      guardianName: null == guardianName
          ? _value.guardianName
          : guardianName // ignore: cast_nullable_to_non_nullable
              as String,
      guardianNumber: null == guardianNumber
          ? _value.guardianNumber
          : guardianNumber // ignore: cast_nullable_to_non_nullable
              as String,
      eduYearID: null == eduYearID
          ? _value.eduYearID
          : eduYearID // ignore: cast_nullable_to_non_nullable
              as int,
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      stageId: null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterObjectImplCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$$RegisterObjectImplCopyWith(_$RegisterObjectImpl value,
          $Res Function(_$RegisterObjectImpl) then) =
      __$$RegisterObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String password,
      String confirmPassword,
      String mobileNumber,
      String userName,
      String guardianName,
      String guardianNumber,
      int eduYearID,
      String stage,
      int stageId});
}

/// @nodoc
class __$$RegisterObjectImplCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res, _$RegisterObjectImpl>
    implements _$$RegisterObjectImplCopyWith<$Res> {
  __$$RegisterObjectImplCopyWithImpl(
      _$RegisterObjectImpl _value, $Res Function(_$RegisterObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? mobileNumber = null,
    Object? userName = null,
    Object? guardianName = null,
    Object? guardianNumber = null,
    Object? eduYearID = null,
    Object? stage = null,
    Object? stageId = null,
  }) {
    return _then(_$RegisterObjectImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == guardianName
          ? _value.guardianName
          : guardianName // ignore: cast_nullable_to_non_nullable
              as String,
      null == guardianNumber
          ? _value.guardianNumber
          : guardianNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == eduYearID
          ? _value.eduYearID
          : eduYearID // ignore: cast_nullable_to_non_nullable
              as int,
      null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as String,
      null == stageId
          ? _value.stageId
          : stageId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RegisterObjectImpl implements _RegisterObject {
  _$RegisterObjectImpl(
      this.email,
      this.password,
      this.confirmPassword,
      this.mobileNumber,
      this.userName,
      this.guardianName,
      this.guardianNumber,
      this.eduYearID,
      this.stage,
      this.stageId);

  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String mobileNumber;
  @override
  final String userName;
  @override
  final String guardianName;
  @override
  final String guardianNumber;
  @override
  final int eduYearID;
  @override
  final String stage;
  @override
  final int stageId;

  @override
  String toString() {
    return 'RegisterObject(email: $email, password: $password, confirmPassword: $confirmPassword, mobileNumber: $mobileNumber, userName: $userName, guardianName: $guardianName, guardianNumber: $guardianNumber, eduYearID: $eduYearID, stage: $stage, stageId: $stageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterObjectImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.guardianName, guardianName) ||
                other.guardianName == guardianName) &&
            (identical(other.guardianNumber, guardianNumber) ||
                other.guardianNumber == guardianNumber) &&
            (identical(other.eduYearID, eduYearID) ||
                other.eduYearID == eduYearID) &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.stageId, stageId) || other.stageId == stageId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      password,
      confirmPassword,
      mobileNumber,
      userName,
      guardianName,
      guardianNumber,
      eduYearID,
      stage,
      stageId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterObjectImplCopyWith<_$RegisterObjectImpl> get copyWith =>
      __$$RegisterObjectImplCopyWithImpl<_$RegisterObjectImpl>(
          this, _$identity);
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(
      final String email,
      final String password,
      final String confirmPassword,
      final String mobileNumber,
      final String userName,
      final String guardianName,
      final String guardianNumber,
      final int eduYearID,
      final String stage,
      final int stageId) = _$RegisterObjectImpl;

  @override
  String get email;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get mobileNumber;
  @override
  String get userName;
  @override
  String get guardianName;
  @override
  String get guardianNumber;
  @override
  int get eduYearID;
  @override
  String get stage;
  @override
  int get stageId;
  @override
  @JsonKey(ignore: true)
  _$$RegisterObjectImplCopyWith<_$RegisterObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgetPasswordObject {
  String get email => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  String get confirmedNewPassword => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgetPasswordObjectCopyWith<ForgetPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgetPasswordObjectCopyWith<$Res> {
  factory $ForgetPasswordObjectCopyWith(ForgetPasswordObject value,
          $Res Function(ForgetPasswordObject) then) =
      _$ForgetPasswordObjectCopyWithImpl<$Res, ForgetPasswordObject>;
  @useResult
  $Res call(
      {String email,
      String code,
      String newPassword,
      String confirmedNewPassword});
}

/// @nodoc
class _$ForgetPasswordObjectCopyWithImpl<$Res,
        $Val extends ForgetPasswordObject>
    implements $ForgetPasswordObjectCopyWith<$Res> {
  _$ForgetPasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? newPassword = null,
    Object? confirmedNewPassword = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      confirmedNewPassword: null == confirmedNewPassword
          ? _value.confirmedNewPassword
          : confirmedNewPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ForgetPasswordObjectImplCopyWith<$Res>
    implements $ForgetPasswordObjectCopyWith<$Res> {
  factory _$$ForgetPasswordObjectImplCopyWith(_$ForgetPasswordObjectImpl value,
          $Res Function(_$ForgetPasswordObjectImpl) then) =
      __$$ForgetPasswordObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String code,
      String newPassword,
      String confirmedNewPassword});
}

/// @nodoc
class __$$ForgetPasswordObjectImplCopyWithImpl<$Res>
    extends _$ForgetPasswordObjectCopyWithImpl<$Res, _$ForgetPasswordObjectImpl>
    implements _$$ForgetPasswordObjectImplCopyWith<$Res> {
  __$$ForgetPasswordObjectImplCopyWithImpl(_$ForgetPasswordObjectImpl _value,
      $Res Function(_$ForgetPasswordObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? code = null,
    Object? newPassword = null,
    Object? confirmedNewPassword = null,
  }) {
    return _then(_$ForgetPasswordObjectImpl(
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmedNewPassword
          ? _value.confirmedNewPassword
          : confirmedNewPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ForgetPasswordObjectImpl implements _ForgetPasswordObject {
  _$ForgetPasswordObjectImpl(
      this.email, this.code, this.newPassword, this.confirmedNewPassword);

  @override
  final String email;
  @override
  final String code;
  @override
  final String newPassword;
  @override
  final String confirmedNewPassword;

  @override
  String toString() {
    return 'ForgetPasswordObject(email: $email, code: $code, newPassword: $newPassword, confirmedNewPassword: $confirmedNewPassword)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ForgetPasswordObjectImpl &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.confirmedNewPassword, confirmedNewPassword) ||
                other.confirmedNewPassword == confirmedNewPassword));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, email, code, newPassword, confirmedNewPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ForgetPasswordObjectImplCopyWith<_$ForgetPasswordObjectImpl>
      get copyWith =>
          __$$ForgetPasswordObjectImplCopyWithImpl<_$ForgetPasswordObjectImpl>(
              this, _$identity);
}

abstract class _ForgetPasswordObject implements ForgetPasswordObject {
  factory _ForgetPasswordObject(
      final String email,
      final String code,
      final String newPassword,
      final String confirmedNewPassword) = _$ForgetPasswordObjectImpl;

  @override
  String get email;
  @override
  String get code;
  @override
  String get newPassword;
  @override
  String get confirmedNewPassword;
  @override
  @JsonKey(ignore: true)
  _$$ForgetPasswordObjectImplCopyWith<_$ForgetPasswordObjectImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ProfileObject {
  String get arabicUserName => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get newPassword => throw _privateConstructorUsedError;
  File get profilePicture => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileObjectCopyWith<ProfileObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileObjectCopyWith<$Res> {
  factory $ProfileObjectCopyWith(
          ProfileObject value, $Res Function(ProfileObject) then) =
      _$ProfileObjectCopyWithImpl<$Res, ProfileObject>;
  @useResult
  $Res call(
      {String arabicUserName,
      String mobileNumber,
      String password,
      String confirmPassword,
      String newPassword,
      File profilePicture});
}

/// @nodoc
class _$ProfileObjectCopyWithImpl<$Res, $Val extends ProfileObject>
    implements $ProfileObjectCopyWith<$Res> {
  _$ProfileObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arabicUserName = null,
    Object? mobileNumber = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? newPassword = null,
    Object? profilePicture = null,
  }) {
    return _then(_value.copyWith(
      arabicUserName: null == arabicUserName
          ? _value.arabicUserName
          : arabicUserName // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      newPassword: null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as File,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileObjectImplCopyWith<$Res>
    implements $ProfileObjectCopyWith<$Res> {
  factory _$$ProfileObjectImplCopyWith(
          _$ProfileObjectImpl value, $Res Function(_$ProfileObjectImpl) then) =
      __$$ProfileObjectImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String arabicUserName,
      String mobileNumber,
      String password,
      String confirmPassword,
      String newPassword,
      File profilePicture});
}

/// @nodoc
class __$$ProfileObjectImplCopyWithImpl<$Res>
    extends _$ProfileObjectCopyWithImpl<$Res, _$ProfileObjectImpl>
    implements _$$ProfileObjectImplCopyWith<$Res> {
  __$$ProfileObjectImplCopyWithImpl(
      _$ProfileObjectImpl _value, $Res Function(_$ProfileObjectImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arabicUserName = null,
    Object? mobileNumber = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? newPassword = null,
    Object? profilePicture = null,
  }) {
    return _then(_$ProfileObjectImpl(
      null == arabicUserName
          ? _value.arabicUserName
          : arabicUserName // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == newPassword
          ? _value.newPassword
          : newPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as File,
    ));
  }
}

/// @nodoc

class _$ProfileObjectImpl implements _ProfileObject {
  _$ProfileObjectImpl(this.arabicUserName, this.mobileNumber, this.password,
      this.confirmPassword, this.newPassword, this.profilePicture);

  @override
  final String arabicUserName;
  @override
  final String mobileNumber;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String newPassword;
  @override
  final File profilePicture;

  @override
  String toString() {
    return 'ProfileObject(arabicUserName: $arabicUserName, mobileNumber: $mobileNumber, password: $password, confirmPassword: $confirmPassword, newPassword: $newPassword, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileObjectImpl &&
            (identical(other.arabicUserName, arabicUserName) ||
                other.arabicUserName == arabicUserName) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.newPassword, newPassword) ||
                other.newPassword == newPassword) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @override
  int get hashCode => Object.hash(runtimeType, arabicUserName, mobileNumber,
      password, confirmPassword, newPassword, profilePicture);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileObjectImplCopyWith<_$ProfileObjectImpl> get copyWith =>
      __$$ProfileObjectImplCopyWithImpl<_$ProfileObjectImpl>(this, _$identity);
}

abstract class _ProfileObject implements ProfileObject {
  factory _ProfileObject(
      final String arabicUserName,
      final String mobileNumber,
      final String password,
      final String confirmPassword,
      final String newPassword,
      final File profilePicture) = _$ProfileObjectImpl;

  @override
  String get arabicUserName;
  @override
  String get mobileNumber;
  @override
  String get password;
  @override
  String get confirmPassword;
  @override
  String get newPassword;
  @override
  File get profilePicture;
  @override
  @JsonKey(ignore: true)
  _$$ProfileObjectImplCopyWith<_$ProfileObjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
