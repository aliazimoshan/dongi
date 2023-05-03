// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GroupModel _$GroupModelFromJson(Map<String, dynamic> json) {
  return _GroupModel.fromJson(json);
}

/// @nodoc
mixin _$GroupModel {
  @JsonKey(name: '\$id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '\$createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: '\$updatedAt')
  String? get updatedAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  num get totalBalance => throw _privateConstructorUsedError;
  List<GroupUserModel> get groupUser => throw _privateConstructorUsedError;
  List<BoxModel> get box => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GroupModelCopyWith<GroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GroupModelCopyWith<$Res> {
  factory $GroupModelCopyWith(
          GroupModel value, $Res Function(GroupModel) then) =
      _$GroupModelCopyWithImpl<$Res, GroupModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String? id,
      @JsonKey(name: '\$createdAt') String? createdAt,
      @JsonKey(name: '\$updatedAt') String? updatedAt,
      String title,
      String? description,
      String? image,
      String creatorId,
      num totalBalance,
      List<GroupUserModel> groupUser,
      List<BoxModel> box});
}

/// @nodoc
class _$GroupModelCopyWithImpl<$Res, $Val extends GroupModel>
    implements $GroupModelCopyWith<$Res> {
  _$GroupModelCopyWithImpl(this._value, this._then);

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
    Object? title = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? creatorId = null,
    Object? totalBalance = null,
    Object? groupUser = null,
    Object? box = null,
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as num,
      groupUser: null == groupUser
          ? _value.groupUser
          : groupUser // ignore: cast_nullable_to_non_nullable
              as List<GroupUserModel>,
      box: null == box
          ? _value.box
          : box // ignore: cast_nullable_to_non_nullable
              as List<BoxModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GroupModelCopyWith<$Res>
    implements $GroupModelCopyWith<$Res> {
  factory _$$_GroupModelCopyWith(
          _$_GroupModel value, $Res Function(_$_GroupModel) then) =
      __$$_GroupModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String? id,
      @JsonKey(name: '\$createdAt') String? createdAt,
      @JsonKey(name: '\$updatedAt') String? updatedAt,
      String title,
      String? description,
      String? image,
      String creatorId,
      num totalBalance,
      List<GroupUserModel> groupUser,
      List<BoxModel> box});
}

/// @nodoc
class __$$_GroupModelCopyWithImpl<$Res>
    extends _$GroupModelCopyWithImpl<$Res, _$_GroupModel>
    implements _$$_GroupModelCopyWith<$Res> {
  __$$_GroupModelCopyWithImpl(
      _$_GroupModel _value, $Res Function(_$_GroupModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? image = freezed,
    Object? creatorId = null,
    Object? totalBalance = null,
    Object? groupUser = null,
    Object? box = null,
  }) {
    return _then(_$_GroupModel(
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
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      totalBalance: null == totalBalance
          ? _value.totalBalance
          : totalBalance // ignore: cast_nullable_to_non_nullable
              as num,
      groupUser: null == groupUser
          ? _value._groupUser
          : groupUser // ignore: cast_nullable_to_non_nullable
              as List<GroupUserModel>,
      box: null == box
          ? _value._box
          : box // ignore: cast_nullable_to_non_nullable
              as List<BoxModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GroupModel implements _GroupModel {
  const _$_GroupModel(
      {@JsonKey(name: '\$id') this.id,
      @JsonKey(name: '\$createdAt') this.createdAt,
      @JsonKey(name: '\$updatedAt') this.updatedAt,
      required this.title,
      this.description,
      this.image,
      required this.creatorId,
      this.totalBalance = 0,
      final List<GroupUserModel> groupUser = const [],
      final List<BoxModel> box = const []})
      : _groupUser = groupUser,
        _box = box;

  factory _$_GroupModel.fromJson(Map<String, dynamic> json) =>
      _$$_GroupModelFromJson(json);

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
  final String title;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final String creatorId;
  @override
  @JsonKey()
  final num totalBalance;
  final List<GroupUserModel> _groupUser;
  @override
  @JsonKey()
  List<GroupUserModel> get groupUser {
    if (_groupUser is EqualUnmodifiableListView) return _groupUser;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_groupUser);
  }

  final List<BoxModel> _box;
  @override
  @JsonKey()
  List<BoxModel> get box {
    if (_box is EqualUnmodifiableListView) return _box;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_box);
  }

  @override
  String toString() {
    return 'GroupModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, description: $description, image: $image, creatorId: $creatorId, totalBalance: $totalBalance, groupUser: $groupUser, box: $box)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GroupModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.totalBalance, totalBalance) ||
                other.totalBalance == totalBalance) &&
            const DeepCollectionEquality()
                .equals(other._groupUser, _groupUser) &&
            const DeepCollectionEquality().equals(other._box, _box));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      createdAt,
      updatedAt,
      title,
      description,
      image,
      creatorId,
      totalBalance,
      const DeepCollectionEquality().hash(_groupUser),
      const DeepCollectionEquality().hash(_box));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GroupModelCopyWith<_$_GroupModel> get copyWith =>
      __$$_GroupModelCopyWithImpl<_$_GroupModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GroupModelToJson(
      this,
    );
  }
}

abstract class _GroupModel implements GroupModel {
  const factory _GroupModel(
      {@JsonKey(name: '\$id') final String? id,
      @JsonKey(name: '\$createdAt') final String? createdAt,
      @JsonKey(name: '\$updatedAt') final String? updatedAt,
      required final String title,
      final String? description,
      final String? image,
      required final String creatorId,
      final num totalBalance,
      final List<GroupUserModel> groupUser,
      final List<BoxModel> box}) = _$_GroupModel;

  factory _GroupModel.fromJson(Map<String, dynamic> json) =
      _$_GroupModel.fromJson;

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
  String get title;
  @override
  String? get description;
  @override
  String? get image;
  @override
  String get creatorId;
  @override
  num get totalBalance;
  @override
  List<GroupUserModel> get groupUser;
  @override
  List<BoxModel> get box;
  @override
  @JsonKey(ignore: true)
  _$$_GroupModelCopyWith<_$_GroupModel> get copyWith =>
      throw _privateConstructorUsedError;
}
