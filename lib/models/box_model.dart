// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BoxModel {
  final String id;
  final String title;
  final String description;
  final String image;
  final String groupId;
  final String creator;
  final DateTime createdAt;
  final DateTime updatedAt;
  BoxModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.groupId,
    required this.creator,
    required this.createdAt,
    required this.updatedAt,
  });

  BoxModel copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    String? groupId,
    String? creator,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BoxModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      groupId: groupId ?? this.groupId,
      creator: creator ?? this.creator,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'image': image,
      'groupId': groupId,
      'creator': creator,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory BoxModel.fromMap(Map<String, dynamic> map) {
    return BoxModel(
      id: map['id'] as String,
      title: map['title'] as String,
      description: map['description'] as String,
      image: map['image'] as String,
      groupId: map['groupId'] as String,
      creator: map['creator'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory BoxModel.fromJson(String source) =>
      BoxModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BoxModel(id: $id, title: $title, description: $description, image: $image, groupId: $groupId, creator: $creator, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant BoxModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image &&
        other.groupId == groupId &&
        other.creator == creator &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        image.hashCode ^
        groupId.hashCode ^
        creator.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
