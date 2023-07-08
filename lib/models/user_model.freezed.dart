// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _BoxModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  @JsonKey(name: '\$id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '\$createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: '\$updatedAt')
  String? get updatedAt => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  String? get profileImage => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  num? get totalExpense => throw _privateConstructorUsedError;
  List<String> get userFriends => throw _privateConstructorUsedError;
  List<String> get groupIds => throw _privateConstructorUsedError;
  List<String> get transactions => throw _privateConstructorUsedError;
  List<String> get firebaseTokens => throw _privateConstructorUsedError;
  List<String> get tokens => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String? id,
      @JsonKey(name: '\$createdAt') String? createdAt,
      @JsonKey(name: '\$updatedAt') String? updatedAt,
      String email,
      String userName,
      String? firstName,
      String? lastName,
      String? profileImage,
      String? phoneNumber,
      num? totalExpense,
      List<String> userFriends,
      List<String> groupIds,
      List<String> transactions,
      List<String> firebaseTokens,
      List<String> tokens});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? email = null,
    Object? userName = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? phoneNumber = freezed,
    Object? totalExpense = freezed,
    Object? userFriends = null,
    Object? groupIds = null,
    Object? transactions = null,
    Object? firebaseTokens = null,
    Object? tokens = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalExpense: freezed == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as num?,
      userFriends: null == userFriends
          ? _value.userFriends
          : userFriends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupIds: null == groupIds
          ? _value.groupIds
          : groupIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      firebaseTokens: null == firebaseTokens
          ? _value.firebaseTokens
          : firebaseTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tokens: null == tokens
          ? _value.tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BoxModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$$_BoxModelCopyWith(
          _$_BoxModel value, $Res Function(_$_BoxModel) then) =
      __$$_BoxModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String? id,
      @JsonKey(name: '\$createdAt') String? createdAt,
      @JsonKey(name: '\$updatedAt') String? updatedAt,
      String email,
      String userName,
      String? firstName,
      String? lastName,
      String? profileImage,
      String? phoneNumber,
      num? totalExpense,
      List<String> userFriends,
      List<String> groupIds,
      List<String> transactions,
      List<String> firebaseTokens,
      List<String> tokens});
}

/// @nodoc
class __$$_BoxModelCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$_BoxModel>
    implements _$$_BoxModelCopyWith<$Res> {
  __$$_BoxModelCopyWithImpl(
      _$_BoxModel _value, $Res Function(_$_BoxModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? email = null,
    Object? userName = null,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profileImage = freezed,
    Object? phoneNumber = freezed,
    Object? totalExpense = freezed,
    Object? userFriends = null,
    Object? groupIds = null,
    Object? transactions = null,
    Object? firebaseTokens = null,
    Object? tokens = null,
  }) {
    return _then(_$_BoxModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profileImage: freezed == profileImage
          ? _value.profileImage
          : profileImage // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalExpense: freezed == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as num?,
      userFriends: null == userFriends
          ? _value._userFriends
          : userFriends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      groupIds: null == groupIds
          ? _value._groupIds
          : groupIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      firebaseTokens: null == firebaseTokens
          ? _value._firebaseTokens
          : firebaseTokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
      tokens: null == tokens
          ? _value._tokens
          : tokens // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BoxModel implements _BoxModel {
  const _$_BoxModel(
      {@JsonKey(name: '\$id') this.id,
      @JsonKey(name: '\$createdAt') this.createdAt,
      @JsonKey(name: '\$updatedAt') this.updatedAt,
      required this.email,
      required this.userName,
      this.firstName,
      this.lastName,
      this.profileImage,
      this.phoneNumber,
      this.totalExpense = 0,
      final List<String> userFriends = const [],
      final List<String> groupIds = const [],
      final List<String> transactions = const [],
      final List<String> firebaseTokens = const [],
      final List<String> tokens = const []})
      : _userFriends = userFriends,
        _groupIds = groupIds,
        _transactions = transactions,
        _firebaseTokens = firebaseTokens,
        _tokens = tokens;

  factory _$_BoxModel.fromJson(Map<String, dynamic> json) =>
      _$$_BoxModelFromJson(json);

  @override
  @JsonKey(name: '\$id')
  final String? id;
  @override
  @JsonKey(name: '\$createdAt')
  final String? createdAt;
  @override
  @JsonKey(name: '\$updatedAt')
  final String? updatedAt;
  @override
  final String email;
  @override
  final String userName;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? profileImage;
  @override
  final String? phoneNumber;
  @override
  @JsonKey()
  final num? totalExpense;
  final List<String> _userFriends;
  @override
  @JsonKey()
  List<String> get userFriends {
    if (_userFriends is EqualUnmodifiableListView) return _userFriends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userFriends);
  }

  final List<String> _groupIds;
  @override
  @JsonKey()
  List<String> get groupIds {
    if (_groupIds is EqualUnmodifiableListView) return _groupIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupIds);
  }

  final List<String> _transactions;
  @override
  @JsonKey()
  List<String> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  final List<String> _firebaseTokens;
  @override
  @JsonKey()
  List<String> get firebaseTokens {
    if (_firebaseTokens is EqualUnmodifiableListView) return _firebaseTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_firebaseTokens);
  }

  final List<String> _tokens;
  @override
  @JsonKey()
  List<String> get tokens {
    if (_tokens is EqualUnmodifiableListView) return _tokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tokens);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, email: $email, userName: $userName, firstName: $firstName, lastName: $lastName, profileImage: $profileImage, phoneNumber: $phoneNumber, totalExpense: $totalExpense, userFriends: $userFriends, groupIds: $groupIds, transactions: $transactions, firebaseTokens: $firebaseTokens, tokens: $tokens)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoxModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profileImage, profileImage) ||
                other.profileImage == profileImage) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            const DeepCollectionEquality()
                .equals(other._userFriends, _userFriends) &&
            const DeepCollectionEquality().equals(other._groupIds, _groupIds) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            const DeepCollectionEquality()
                .equals(other._firebaseTokens, _firebaseTokens) &&
            const DeepCollectionEquality().equals(other._tokens, _tokens));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      email,
      userName,
      firstName,
      lastName,
      profileImage,
      phoneNumber,
      totalExpense,
      const DeepCollectionEquality().hash(_userFriends),
      const DeepCollectionEquality().hash(_groupIds),
      const DeepCollectionEquality().hash(_transactions),
      const DeepCollectionEquality().hash(_firebaseTokens),
      const DeepCollectionEquality().hash(_tokens));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoxModelCopyWith<_$_BoxModel> get copyWith =>
      __$$_BoxModelCopyWithImpl<_$_BoxModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoxModelToJson(
      this,
    );
  }
}

abstract class _BoxModel implements UserModel {
  const factory _BoxModel(
      {@JsonKey(name: '\$id') final String? id,
      @JsonKey(name: '\$createdAt') final String? createdAt,
      @JsonKey(name: '\$updatedAt') final String? updatedAt,
      required final String email,
      required final String userName,
      final String? firstName,
      final String? lastName,
      final String? profileImage,
      final String? phoneNumber,
      final num? totalExpense,
      final List<String> userFriends,
      final List<String> groupIds,
      final List<String> transactions,
      final List<String> firebaseTokens,
      final List<String> tokens}) = _$_BoxModel;

  factory _BoxModel.fromJson(Map<String, dynamic> json) = _$_BoxModel.fromJson;

  @override
  @JsonKey(name: '\$id')
  String? get id;
  @override
  @JsonKey(name: '\$createdAt')
  String? get createdAt;
  @override
  @JsonKey(name: '\$updatedAt')
  String? get updatedAt;
  @override
  String get email;
  @override
  String get userName;
  @override
  String? get firstName;
  @override
  String? get lastName;
  @override
  String? get profileImage;
  @override
  String? get phoneNumber;
  @override
  num? get totalExpense;
  @override
  List<String> get userFriends;
  @override
  List<String> get groupIds;
  @override
  List<String> get transactions;
  @override
  List<String> get firebaseTokens;
  @override
  List<String> get tokens;
  @override
  @JsonKey(ignore: true)
  _$$_BoxModelCopyWith<_$_BoxModel> get copyWith =>
      throw _privateConstructorUsedError;
}
