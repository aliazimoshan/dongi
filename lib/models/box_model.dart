// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BoxModel {
  final String? id;
  final String title;
  final String? description;
  final String? image;
  final String groupId;
  final List<String> members;
  final String creatorId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  BoxModel({
    this.id,
    required this.title,
    required this.description,
    this.image,
    required this.groupId,
    required this.creatorId,
    this.members = const [],
    this.createdAt,
    this.updatedAt,
  });

  BoxModel copyWith({
    String? id,
    String? title,
    String? description,
    String? image,
    String? groupId,
    List<String>? members,
    String? creatorId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return BoxModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      image: image ?? this.image,
      groupId: groupId ?? this.groupId,
      members: members ?? this.members,
      creatorId: creatorId ?? this.creatorId,
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
      'members': members,
      'creatorId': creatorId,
    };
  }

  factory BoxModel.fromMap(Map<String, dynamic> map) {
    return BoxModel(
      id: map['\$id'] != null ? map['\$id'] as String : null,
      title: map['title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      groupId: map['groupId'] as String,
      members: List<String>.from(map['members'] ?? []),
      creatorId: map['creatorId'] as String,
      createdAt: map['\$createdAt'] != null
          ? DateTime.parse(map['\$createdAt'] as String)
          : null,
      updatedAt: map['\$updatedAt'] != null
          ? DateTime.parse(map['\$updatedAt'] as String)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BoxModel.fromJson(String source) =>
      BoxModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'BoxModel(id: $id, title: $title, description: $description, image: $image, groupId: $groupId, creatorId: $creatorId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant BoxModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.image == image &&
        other.groupId == groupId &&
        other.members == members &&
        other.creatorId == creatorId &&
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
        members.hashCode ^
        creatorId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
