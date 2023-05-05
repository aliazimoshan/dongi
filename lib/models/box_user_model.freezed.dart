// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'box_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BoxUserModel _$BoxUserModelFromJson(Map<String, dynamic> json) {
  return _BoxUserModel.fromJson(json);
}

/// @nodoc
mixin _$BoxUserModel {
  @JsonKey(name: '\$id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '\$createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: '\$updatedAt')
  String? get updatedAt => throw _privateConstructorUsedError;
  UserModel get userId => throw _privateConstructorUsedError;
  GroupModel get groupId => throw _privateConstructorUsedError;
  BoxModel get boxId => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoxUserModelCopyWith<BoxUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoxUserModelCopyWith<$Res> {
  factory $BoxUserModelCopyWith(
          BoxUserModel value, $Res Function(BoxUserModel) then) =
      _$BoxUserModelCopyWithImpl<$Res, BoxUserModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String? id,
      @JsonKey(name: '\$createdAt') String? createdAt,
      @JsonKey(name: '\$updatedAt') String? updatedAt,
      UserModel userId,
      GroupModel groupId,
      BoxModel boxId,
      String status});

  $UserModelCopyWith<$Res> get userId;
  $GroupModelCopyWith<$Res> get groupId;
  $BoxModelCopyWith<$Res> get boxId;
}

/// @nodoc
class _$BoxUserModelCopyWithImpl<$Res, $Val extends BoxUserModel>
    implements $BoxUserModelCopyWith<$Res> {
  _$BoxUserModelCopyWithImpl(this._value, this._then);

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
    Object? userId = null,
    Object? groupId = null,
    Object? boxId = null,
    Object? status = null,
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserModel,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as GroupModel,
      boxId: null == boxId
          ? _value.boxId
          : boxId // ignore: cast_nullable_to_non_nullable
              as BoxModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get userId {
    return $UserModelCopyWith<$Res>(_value.userId, (value) {
      return _then(_value.copyWith(userId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GroupModelCopyWith<$Res> get groupId {
    return $GroupModelCopyWith<$Res>(_value.groupId, (value) {
      return _then(_value.copyWith(groupId: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BoxModelCopyWith<$Res> get boxId {
    return $BoxModelCopyWith<$Res>(_value.boxId, (value) {
      return _then(_value.copyWith(boxId: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_BoxUserModelCopyWith<$Res>
    implements $BoxUserModelCopyWith<$Res> {
  factory _$$_BoxUserModelCopyWith(
          _$_BoxUserModel value, $Res Function(_$_BoxUserModel) then) =
      __$$_BoxUserModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String? id,
      @JsonKey(name: '\$createdAt') String? createdAt,
      @JsonKey(name: '\$updatedAt') String? updatedAt,
      UserModel userId,
      GroupModel groupId,
      BoxModel boxId,
      String status});

  @override
  $UserModelCopyWith<$Res> get userId;
  @override
  $GroupModelCopyWith<$Res> get groupId;
  @override
  $BoxModelCopyWith<$Res> get boxId;
}

/// @nodoc
class __$$_BoxUserModelCopyWithImpl<$Res>
    extends _$BoxUserModelCopyWithImpl<$Res, _$_BoxUserModel>
    implements _$$_BoxUserModelCopyWith<$Res> {
  __$$_BoxUserModelCopyWithImpl(
      _$_BoxUserModel _value, $Res Function(_$_BoxUserModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? userId = null,
    Object? groupId = null,
    Object? boxId = null,
    Object? status = null,
  }) {
    return _then(_$_BoxUserModel(
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
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as UserModel,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as GroupModel,
      boxId: null == boxId
          ? _value.boxId
          : boxId // ignore: cast_nullable_to_non_nullable
              as BoxModel,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BoxUserModel implements _BoxUserModel {
  const _$_BoxUserModel(
      {@JsonKey(name: '\$id') this.id,
      @JsonKey(name: '\$createdAt') this.createdAt,
      @JsonKey(name: '\$updatedAt') this.updatedAt,
      required this.userId,
      required this.groupId,
      required this.boxId,
      this.status = "accept"});

  factory _$_BoxUserModel.fromJson(Map<String, dynamic> json) =>
      _$$_BoxUserModelFromJson(json);

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
  final UserModel userId;
  @override
  final GroupModel groupId;
  @override
  final BoxModel boxId;
  @override
  @JsonKey()
  final String status;

  @override
  String toString() {
    return 'BoxUserModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, userId: $userId, groupId: $groupId, boxId: $boxId, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BoxUserModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.boxId, boxId) || other.boxId == boxId) &&
            (identical(other.status, status) || other.status == status));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, createdAt, updatedAt, userId, groupId, boxId, status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BoxUserModelCopyWith<_$_BoxUserModel> get copyWith =>
      __$$_BoxUserModelCopyWithImpl<_$_BoxUserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_BoxUserModelToJson(
      this,
    );
  }
}

abstract class _BoxUserModel implements BoxUserModel {
  const factory _BoxUserModel(
      {@JsonKey(name: '\$id') final String? id,
      @JsonKey(name: '\$createdAt') final String? createdAt,
      @JsonKey(name: '\$updatedAt') final String? updatedAt,
      required final UserModel userId,
      required final GroupModel groupId,
      required final BoxModel boxId,
      final String status}) = _$_BoxUserModel;

  factory _BoxUserModel.fromJson(Map<String, dynamic> json) =
      _$_BoxUserModel.fromJson;

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
  UserModel get userId;
  @override
  GroupModel get groupId;
  @override
  BoxModel get boxId;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_BoxUserModelCopyWith<_$_BoxUserModel> get copyWith =>
      throw _privateConstructorUsedError;
}
