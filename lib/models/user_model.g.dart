// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoxModel _$$_BoxModelFromJson(Map<String, dynamic> json) => _$_BoxModel(
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] as String?,
      updatedAt: json[r'$updatedAt'] as String?,
      email: json['email'] as String,
      userName: json['userName'] as String,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      profilePic: json['profilePic'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      totalExpense: json['totalExpense'] as num? ?? 0,
      userFriend: (json['userFriend'] as List<dynamic>?)
              ?.map((e) => UserFriendModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      group: (json['group'] as List<dynamic>?)
              ?.map((e) => GroupModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      fToken: (json['fToken'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      token:
          (json['token'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$_BoxModelToJson(_$_BoxModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      r'$createdAt': instance.createdAt,
      r'$updatedAt': instance.updatedAt,
      'email': instance.email,
      'userName': instance.userName,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePic': instance.profilePic,
      'phoneNumber': instance.phoneNumber,
      'totalExpense': instance.totalExpense,
      'userFriend': instance.userFriend,
      'group': instance.group,
      'transactions': instance.transactions,
      'fToken': instance.fToken,
      'token': instance.token,
    };
