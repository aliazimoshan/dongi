// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupUserModel _$$_GroupUserModelFromJson(Map<String, dynamic> json) =>
    _$_GroupUserModel(
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] as String?,
      updatedAt: json[r'$updatedAt'] as String?,
      userId: json['userId'] as String,
      groupId: json['groupId'] as String,
      status: json['status'] as String? ?? "pending",
    );

Map<String, dynamic> _$$_GroupUserModelToJson(_$_GroupUserModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      r'$createdAt': instance.createdAt,
      r'$updatedAt': instance.updatedAt,
      'userId': instance.userId,
      'groupId': instance.groupId,
      'status': instance.status,
    };
