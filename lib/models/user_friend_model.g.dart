// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_friend_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserFriendModel _$$_UserFriendModelFromJson(Map<String, dynamic> json) =>
    _$_UserFriendModel(
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] as String?,
      updatedAt: json[r'$updatedAt'] as String?,
      sendRequestUserId: json['sendRequestUserId'] as String,
      receiveRequestUserId: json['receiveRequestUserId'] as String,
      sendRequestUserName: json['sendRequestUserName'] as String,
      receiveRequestUserName: json['receiveRequestUserName'] as String,
      sendRequestProfilePic: json['sendRequestProfilePic'] as String?,
      receiveRequestProfilePic: json['receiveRequestProfilePic'] as String?,
      status: json['status'] as String? ?? "pending",
    );

Map<String, dynamic> _$$_UserFriendModelToJson(_$_UserFriendModel instance) =>
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
