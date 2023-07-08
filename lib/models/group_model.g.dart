// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GroupModel _$$_GroupModelFromJson(Map<String, dynamic> json) =>
    _$_GroupModel(
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] as String?,
      updatedAt: json[r'$updatedAt'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      creatorId: json['creatorId'] as String,
      totalBalance: json['totalBalance'] as num? ?? 0,
      groupUsers: (json['groupUsers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      boxIds: (json['boxIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_GroupModelToJson(_$_GroupModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      r'$createdAt': instance.createdAt,
      r'$updatedAt': instance.updatedAt,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'creatorId': instance.creatorId,
      'totalBalance': instance.totalBalance,
      'groupUsers': instance.groupUsers,
      'boxIds': instance.boxIds,
    };
