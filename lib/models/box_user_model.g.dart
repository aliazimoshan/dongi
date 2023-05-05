// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoxUserModel _$$_BoxUserModelFromJson(Map<String, dynamic> json) =>
    _$_BoxUserModel(
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] as String?,
      updatedAt: json[r'$updatedAt'] as String?,
      userId: UserModel.fromJson(json['userId'] as Map<String, dynamic>),
      groupId: GroupModel.fromJson(json['groupId'] as Map<String, dynamic>),
      boxId: BoxModel.fromJson(json['boxId'] as Map<String, dynamic>),
      status: json['status'] as String? ?? "accept",
    );

Map<String, dynamic> _$$_BoxUserModelToJson(_$_BoxUserModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      r'$createdAt': instance.createdAt,
      r'$updatedAt': instance.updatedAt,
      'userId': instance.userId,
      'groupId': instance.groupId,
      'boxId': instance.boxId,
      'status': instance.status,
    };
