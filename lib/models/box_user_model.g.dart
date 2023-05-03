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
      sendRequestUserId: json['sendRequestUserId'] as String,
      receiveRequestUserId: json['receiveRequestUserId'] as String,
      sendRequestUserName: json['sendRequestUserName'] as String,
      receiveRequestUserName: json['receiveRequestUserName'] as String,
      sendRequestProfilePic: json['sendRequestProfilePic'] as String?,
      receiveRequestProfilePic: json['receiveRequestProfilePic'] as String?,
      status: json['status'] as String? ?? "accept",
    );

Map<String, dynamic> _$$_BoxUserModelToJson(_$_BoxUserModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      r'$createdAt': instance.createdAt,
      r'$updatedAt': instance.updatedAt,
      'sendRequestUserId': instance.sendRequestUserId,
      'receiveRequestUserId': instance.receiveRequestUserId,
      'sendRequestUserName': instance.sendRequestUserName,
      'receiveRequestUserName': instance.receiveRequestUserName,
      'sendRequestProfilePic': instance.sendRequestProfilePic,
      'receiveRequestProfilePic': instance.receiveRequestProfilePic,
      'status': instance.status,
    };
