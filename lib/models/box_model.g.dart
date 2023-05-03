// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'box_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BoxModel _$$_BoxModelFromJson(Map<String, dynamic> json) => _$_BoxModel(
      id: json[r'$id'] as String?,
      createdAt: json[r'$createdAt'] as String?,
      updatedAt: json[r'$updatedAt'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      image: json['image'] as String?,
      groupId: json['groupId'] as String,
      boxUser: (json['boxUser'] as List<dynamic>?)
              ?.map((e) => BoxUserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      total: json['total'] as num? ?? 0,
      creatorId: json['creatorId'] as String,
    );

Map<String, dynamic> _$$_BoxModelToJson(_$_BoxModel instance) =>
    <String, dynamic>{
      r'$id': instance.id,
      r'$createdAt': instance.createdAt,
      r'$updatedAt': instance.updatedAt,
      'title': instance.title,
      'description': instance.description,
      'image': instance.image,
      'groupId': instance.groupId,
      'boxUser': instance.boxUser,
      'total': instance.total,
      'creatorId': instance.creatorId,
    };
