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
  String? get profilePic => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  num? get totalExpense => throw _privateConstructorUsedError;
  List<UserFriendModel> get userFriend => throw _privateConstructorUsedError;
  List<GroupModel> get group => throw _privateConstructorUsedError;
  List<String> get transactions => throw _privateConstructorUsedError;
  List<String> get fToken => throw _privateConstructorUsedError;
  List<String> get token => throw _privateConstructorUsedError;

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
      String? profilePic,
      String? phoneNumber,
      num? totalExpense,
      List<UserFriendModel> userFriend,
      List<GroupModel> group,
      List<String> transactions,
      List<String> fToken,
      List<String> token});
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
    Object? profilePic = freezed,
    Object? phoneNumber = freezed,
    Object? totalExpense = freezed,
    Object? userFriend = null,
    Object? group = null,
    Object? transactions = null,
    Object? fToken = null,
    Object? token = null,
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
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalExpense: freezed == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as num?,
      userFriend: null == userFriend
          ? _value.userFriend
          : userFriend // ignore: cast_nullable_to_non_nullable
              as List<UserFriendModel>,
      group: null == group
          ? _value.group
          : group // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>,
      transactions: null == transactions
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fToken: null == fToken
          ? _value.fToken
          : fToken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      token: null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
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
      String? profilePic,
      String? phoneNumber,
      num? totalExpense,
      List<UserFriendModel> userFriend,
      List<GroupModel> group,
      List<String> transactions,
      List<String> fToken,
      List<String> token});
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
    Object? profilePic = freezed,
    Object? phoneNumber = freezed,
    Object? totalExpense = freezed,
    Object? userFriend = null,
    Object? group = null,
    Object? transactions = null,
    Object? fToken = null,
    Object? token = null,
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
      profilePic: freezed == profilePic
          ? _value.profilePic
          : profilePic // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      totalExpense: freezed == totalExpense
          ? _value.totalExpense
          : totalExpense // ignore: cast_nullable_to_non_nullable
              as num?,
      userFriend: null == userFriend
          ? _value._userFriend
          : userFriend // ignore: cast_nullable_to_non_nullable
              as List<UserFriendModel>,
      group: null == group
          ? _value._group
          : group // ignore: cast_nullable_to_non_nullable
              as List<GroupModel>,
      transactions: null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<String>,
      fToken: null == fToken
          ? _value._fToken
          : fToken // ignore: cast_nullable_to_non_nullable
              as List<String>,
      token: null == token
          ? _value._token
          : token // ignore: cast_nullable_to_non_nullable
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
      this.profilePic,
      this.phoneNumber,
      this.totalExpense = 0,
      final List<UserFriendModel> userFriend = const [],
      final List<GroupModel> group = const [],
      final List<String> transactions = const [],
      final List<String> fToken = const [],
      final List<String> token = const []})
      : _userFriend = userFriend,
        _group = group,
        _transactions = transactions,
        _fToken = fToken,
        _token = token;

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
  final String? profilePic;
  @override
  final String? phoneNumber;
  @override
  @JsonKey()
  final num? totalExpense;
  final List<UserFriendModel> _userFriend;
  @override
  @JsonKey()
  List<UserFriendModel> get userFriend {
    if (_userFriend is EqualUnmodifiableListView) return _userFriend;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userFriend);
  }

  final List<GroupModel> _group;
  @override
  @JsonKey()
  List<GroupModel> get group {
    if (_group is EqualUnmodifiableListView) return _group;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_group);
  }

  final List<String> _transactions;
  @override
  @JsonKey()
  List<String> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  final List<String> _fToken;
  @override
  @JsonKey()
  List<String> get fToken {
    if (_fToken is EqualUnmodifiableListView) return _fToken;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_fToken);
  }

  final List<String> _token;
  @override
  @JsonKey()
  List<String> get token {
    if (_token is EqualUnmodifiableListView) return _token;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_token);
  }

  @override
  String toString() {
    return 'UserModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, email: $email, userName: $userName, firstName: $firstName, lastName: $lastName, profilePic: $profilePic, phoneNumber: $phoneNumber, totalExpense: $totalExpense, userFriend: $userFriend, group: $group, transactions: $transactions, fToken: $fToken, token: $token)';
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
            (identical(other.profilePic, profilePic) ||
                other.profilePic == profilePic) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.totalExpense, totalExpense) ||
                other.totalExpense == totalExpense) &&
            const DeepCollectionEquality()
                .equals(other._userFriend, _userFriend) &&
            const DeepCollectionEquality().equals(other._group, _group) &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            const DeepCollectionEquality().equals(other._fToken, _fToken) &&
            const DeepCollectionEquality().equals(other._token, _token));
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
      profilePic,
      phoneNumber,
      totalExpense,
      const DeepCollectionEquality().hash(_userFriend),
      const DeepCollectionEquality().hash(_group),
      const DeepCollectionEquality().hash(_transactions),
      const DeepCollectionEquality().hash(_fToken),
      const DeepCollectionEquality().hash(_token));

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
      final String? profilePic,
      final String? phoneNumber,
      final num? totalExpense,
      final List<UserFriendModel> userFriend,
      final List<GroupModel> group,
      final List<String> transactions,
      final List<String> fToken,
      final List<String> token}) = _$_BoxModel;

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
  String? get profilePic;
  @override
  String? get phoneNumber;
  @override
  num? get totalExpense;
  @override
  List<UserFriendModel> get userFriend;
  @override
  List<GroupModel> get group;
  @override
  List<String> get transactions;
  @override
  List<String> get fToken;
  @override
  List<String> get token;
  @override
  @JsonKey(ignore: true)
  _$$_BoxModelCopyWith<_$_BoxModel> get copyWith =>
      throw _privateConstructorUsedError;
}
