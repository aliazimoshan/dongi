// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ExpenseUserModel _$$_ExpenseUserModelFromJson(Map<String, dynamic> json) =>
    _$_ExpenseUserModel(
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] as String?,
      updatedAt: json[r'$updatedAt'] as String?,
      userId: json['userId'] as String,
      groupId: json['groupId'] as String,
      boxId: json['boxId'] as String,
      expenseId: json['expenseId'] as String,
      cost: json['cost'] as num? ?? 0,
      isPaid: json['isPaid'] as bool? ?? false,
    );

Map<String, dynamic> _$$_ExpenseUserModelToJson(_$_ExpenseUserModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      r'$createdAt': instance.createdAt,
      r'$updatedAt': instance.updatedAt,
      'userId': instance.userId,
      'groupId': instance.groupId,
      'boxId': instance.boxId,
      'expenseId': instance.expenseId,
      'cost': instance.cost,
      'isPaid': instance.isPaid,
    };
