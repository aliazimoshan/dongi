// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpenseModel _$$_ExpenseModelFromJson(Map<String, dynamic> json) =>
    _$_ExpenseModel(
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] as String?,
      updatedAt: json[r'$updatedAt'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      categoryId: json['categoryId'] as String?,
      boxId: json['boxId'] as String,
      groupId: json['groupId'] as String,
      creatorId: json['creatorId'] as String,
      cost: json['cost'] as num? ?? 0,
      equal: json['equal'] as bool? ?? true,
      expenseUsers: (json['expenseUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_ExpenseModelToJson(_$_ExpenseModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      r'$createdAt': instance.createdAt,
      r'$updatedAt': instance.updatedAt,
      'title': instance.title,
      'description': instance.description,
      'categoryId': instance.categoryId,
      'boxId': instance.boxId,
      'groupId': instance.groupId,
      'creatorId': instance.creatorId,
      'cost': instance.cost,
      'equal': instance.equal,
      'expenseUsers': instance.expenseUsers,
    };
