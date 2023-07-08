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
      profileImage: json['profileImage'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      totalExpense: json['totalExpense'] as num? ?? 0,
      userFriends: (json['userFriends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      groupIds: (json['groupIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      transactions: (json['transactions'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      firebaseTokens: (json['firebaseTokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tokens: (json['tokens'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
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
      'profileImage': instance.profileImage,
      'phoneNumber': instance.phoneNumber,
      'totalExpense': instance.totalExpense,
      'userFriends': instance.userFriends,
      'groupIds': instance.groupIds,
      'transactions': instance.transactions,
      'firebaseTokens': instance.firebaseTokens,
      'tokens': instance.tokens,
    };
