// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dongi/models/box_model.dart';
import 'package:dongi/models/user_model.dart';
import 'package:flutter/foundation.dart';

class GroupModel {
  final String? id;
  final String title;
  final String? description;
  final String? image;
  final String creatorId;
  final num totalBalance;
  final List<UserModel> members;
  final List<BoxModel?> boxes;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  GroupModel({
    this.id,
    required this.title,
    this.description,
    this.image,
    required this.creatorId,
    required this.totalBalance,
    required this.members,
    required this.boxes,
    this.createdAt,
    this.updatedAt,
  });

  GroupModel copyWith({
    String? title,
    String? description,
    String? image,
    String? creatorId,
    num? totalBalance,
    List<UserModel>? members,
    List<BoxModel?>? boxes,
  }) {
    return GroupModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      creatorId: creatorId ?? this.creatorId,
      totalBalance: totalBalance ?? this.totalBalance,
      members: members ?? this.members,
      boxes: boxes ?? this.boxes,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'creatorId': creatorId,
      'totalBalance': totalBalance,
      'members': members.map((x) => x.toMap()).toList(),
      'boxes': boxes.isNotEmpty ? boxes.map((x) => x!.toMap()).toList() : null,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      id: map['\$id'] != null ? map['\$id'] as String : null,
      title: map['title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      creatorId: map['creatorId'] as String,
      totalBalance: map['totalBalance'] as num,
      members: List<UserModel>.from(
        (map['members'] as List).map<UserModel>(
          (x) => UserModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      boxes: List<BoxModel?>.from(
        (map['boxes'] as List).map<BoxModel>(
          (x) => BoxModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      createdAt: map['\$createdAt'] != null
          ? DateTime.parse(map['\$createdAt'] as String)
          : null,
      updatedAt: map['\$updatedAt'] != null
          ? DateTime.parse(map['\$updatedAt'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GroupModel.fromJson(String source) =>
      GroupModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GroupModel(id: $id, title: $title, description: $description, image: $image, creatorId: $creatorId, members: $members, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant GroupModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image &&
        other.creatorId == creatorId &&
        listEquals(other.members, members) &&
        listEquals(other.boxes, boxes) &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        image.hashCode ^
        creatorId.hashCode ^
        members.hashCode ^
        boxes.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
