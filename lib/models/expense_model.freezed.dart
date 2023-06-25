// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExpenseModel _$ExpenseModelFromJson(Map<String, dynamic> json) {
  return _ExpenseModel.fromJson(json);
}

/// @nodoc
mixin _$ExpenseModel {
  @JsonKey(name: '\$id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: '\$createdAt')
  String? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: '\$updatedAt')
  String? get updatedAt => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get categoryId => throw _privateConstructorUsedError;
  String get boxId => throw _privateConstructorUsedError;
  String get groupId => throw _privateConstructorUsedError;
  String get creatorId => throw _privateConstructorUsedError;
  num get cost => throw _privateConstructorUsedError;
  bool get equal => throw _privateConstructorUsedError;
  List<String> get expenseUsers => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExpenseModelCopyWith<ExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseModelCopyWith<$Res> {
  factory $ExpenseModelCopyWith(
          ExpenseModel value, $Res Function(ExpenseModel) then) =
      _$ExpenseModelCopyWithImpl<$Res, ExpenseModel>;
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String? id,
      @JsonKey(name: '\$createdAt') String? createdAt,
      @JsonKey(name: '\$updatedAt') String? updatedAt,
      String title,
      String? description,
      String? categoryId,
      String boxId,
      String groupId,
      String creatorId,
      num cost,
      bool equal,
      List<String> expenseUsers});
}

/// @nodoc
class _$ExpenseModelCopyWithImpl<$Res, $Val extends ExpenseModel>
    implements $ExpenseModelCopyWith<$Res> {
  _$ExpenseModelCopyWithImpl(this._value, this._then);

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
    Object? categoryId = freezed,
    Object? boxId = null,
    Object? groupId = null,
    Object? creatorId = null,
    Object? cost = null,
    Object? equal = null,
    Object? expenseUsers = null,
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
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      boxId: null == boxId
          ? _value.boxId
          : boxId // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as num,
      equal: null == equal
          ? _value.equal
          : equal // ignore: cast_nullable_to_non_nullable
              as bool,
      expenseUsers: null == expenseUsers
          ? _value.expenseUsers
          : expenseUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExpenseModelCopyWith<$Res>
    implements $ExpenseModelCopyWith<$Res> {
  factory _$$_ExpenseModelCopyWith(
          _$_ExpenseModel value, $Res Function(_$_ExpenseModel) then) =
      __$$_ExpenseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '\$id') String? id,
      @JsonKey(name: '\$createdAt') String? createdAt,
      @JsonKey(name: '\$updatedAt') String? updatedAt,
      String title,
      String? description,
      String? categoryId,
      String boxId,
      String groupId,
      String creatorId,
      num cost,
      bool equal,
      List<String> expenseUsers});
}

/// @nodoc
class __$$_ExpenseModelCopyWithImpl<$Res>
    extends _$ExpenseModelCopyWithImpl<$Res, _$_ExpenseModel>
    implements _$$_ExpenseModelCopyWith<$Res> {
  __$$_ExpenseModelCopyWithImpl(
      _$_ExpenseModel _value, $Res Function(_$_ExpenseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? title = null,
    Object? description = freezed,
    Object? categoryId = freezed,
    Object? boxId = null,
    Object? groupId = null,
    Object? creatorId = null,
    Object? cost = null,
    Object? equal = null,
    Object? expenseUsers = null,
  }) {
    return _then(_$_ExpenseModel(
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
      categoryId: freezed == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as String?,
      boxId: null == boxId
          ? _value.boxId
          : boxId // ignore: cast_nullable_to_non_nullable
              as String,
      groupId: null == groupId
          ? _value.groupId
          : groupId // ignore: cast_nullable_to_non_nullable
              as String,
      creatorId: null == creatorId
          ? _value.creatorId
          : creatorId // ignore: cast_nullable_to_non_nullable
              as String,
      cost: null == cost
          ? _value.cost
          : cost // ignore: cast_nullable_to_non_nullable
              as num,
      equal: null == equal
          ? _value.equal
          : equal // ignore: cast_nullable_to_non_nullable
              as bool,
      expenseUsers: null == expenseUsers
          ? _value._expenseUsers
          : expenseUsers // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExpenseModel implements _ExpenseModel {
  const _$_ExpenseModel(
      {@JsonKey(name: '\$id') this.id,
      @JsonKey(name: '\$createdAt') this.createdAt,
      @JsonKey(name: '\$updatedAt') this.updatedAt,
      required this.title,
      this.description,
      this.categoryId,
      required this.boxId,
      required this.groupId,
      required this.creatorId,
      this.cost = 0,
      this.equal = true,
      final List<String> expenseUsers = const []})
      : _expenseUsers = expenseUsers;

  factory _$_ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$$_ExpenseModelFromJson(json);

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
  final String? categoryId;
  @override
  final String boxId;
  @override
  final String groupId;
  @override
  final String creatorId;
  @override
  @JsonKey()
  final num cost;
  @override
  @JsonKey()
  final bool equal;
  final List<String> _expenseUsers;
  @override
  @JsonKey()
  List<String> get expenseUsers {
    if (_expenseUsers is EqualUnmodifiableListView) return _expenseUsers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expenseUsers);
  }

  @override
  String toString() {
    return 'ExpenseModel(id: $id, createdAt: $createdAt, updatedAt: $updatedAt, title: $title, description: $description, categoryId: $categoryId, boxId: $boxId, groupId: $groupId, creatorId: $creatorId, cost: $cost, equal: $equal, expenseUsers: $expenseUsers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExpenseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.boxId, boxId) || other.boxId == boxId) &&
            (identical(other.groupId, groupId) || other.groupId == groupId) &&
            (identical(other.creatorId, creatorId) ||
                other.creatorId == creatorId) &&
            (identical(other.cost, cost) || other.cost == cost) &&
            (identical(other.equal, equal) || other.equal == equal) &&
            const DeepCollectionEquality()
                .equals(other._expenseUsers, _expenseUsers));
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
      categoryId,
      boxId,
      groupId,
      creatorId,
      cost,
      equal,
      const DeepCollectionEquality().hash(_expenseUsers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExpenseModelCopyWith<_$_ExpenseModel> get copyWith =>
      __$$_ExpenseModelCopyWithImpl<_$_ExpenseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExpenseModelToJson(
      this,
    );
  }
}

abstract class _ExpenseModel implements ExpenseModel {
  const factory _ExpenseModel(
      {@JsonKey(name: '\$id') final String? id,
      @JsonKey(name: '\$createdAt') final String? createdAt,
      @JsonKey(name: '\$updatedAt') final String? updatedAt,
      required final String title,
      final String? description,
      final String? categoryId,
      required final String boxId,
      required final String groupId,
      required final String creatorId,
      final num cost,
      final bool equal,
      final List<String> expenseUsers}) = _$_ExpenseModel;

  factory _ExpenseModel.fromJson(Map<String, dynamic> json) =
      _$_ExpenseModel.fromJson;

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
  String? get categoryId;
  @override
  String get boxId;
  @override
  String get groupId;
  @override
  String get creatorId;
  @override
  num get cost;
  @override
  bool get equal;
  @override
  List<String> get expenseUsers;
  @override
  @JsonKey(ignore: true)
  _$$_ExpenseModelCopyWith<_$_ExpenseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
