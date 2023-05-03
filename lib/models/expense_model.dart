//// ignore_for_file: public_member_api_docs, sort_constructors_first
//import 'dart:convert';

//class ExpenseModel {
//  final String id;
//  final String title;
//  final String icon;
//  final String description;
//  final String boxId;
//  final String creator;
//  final String cost;
//  final DateTime createdAt;
//  final DateTime updatedAt;
//  ExpenseModel({
//    required this.id,
//    required this.title,
//    required this.icon,
//    required this.description,
//    required this.boxId,
//    required this.creator,
//    required this.cost,
//    required this.createdAt,
//    required this.updatedAt,
//  });

//  ExpenseModel copyWith({
//    String? id,
//    String? title,
//    String? icon,
//    String? description,
//    String? boxId,
//    String? creator,
//    String? cost,
//    DateTime? createdAt,
//    DateTime? updatedAt,
//  }) {
//    return ExpenseModel(
//      id: id ?? this.id,
//      title: title ?? this.title,
//      icon: icon ?? this.icon,
//      description: description ?? this.description,
//      boxId: boxId ?? this.boxId,
//      creator: creator ?? this.creator,
//      cost: cost ?? this.cost,
//      createdAt: createdAt ?? this.createdAt,
//      updatedAt: updatedAt ?? this.updatedAt,
//    );
//  }

//  Map<String, dynamic> toMap() {
//    return <String, dynamic>{
//      'id': id,
//      'title': title,
//      'icon': icon,
//      'description': description,
//      'boxId': boxId,
//      'creator': creator,
//      'cost': cost,
//      'createdAt': createdAt.millisecondsSinceEpoch,
//      'updatedAt': updatedAt.millisecondsSinceEpoch,
//    };
//  }

//  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
//    return ExpenseModel(
//      id: map['id'] as String,
//      title: map['title'] as String,
//      icon: map['icon'] as String,
//      description: map['description'] as String,
//      boxId: map['boxId'] as String,
//      creator: map['creator'] as String,
//      cost: map['cost'] as String,
//      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
//      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
//    );
//  }

//  String toJson() => json.encode(toMap());

//  factory ExpenseModel.fromJson(String source) =>
//      ExpenseModel.fromMap(json.decode(source) as Map<String, dynamic>);

//  @override
//  String toString() {
//    return 'ExpenseModel(id: $id, title: $title, icon: $icon, description: $description, boxId: $boxId, creator: $creator, cost: $cost, createdAt: $createdAt, updatedAt: $updatedAt)';
//  }

//  @override
//  bool operator ==(covariant ExpenseModel other) {
//    if (identical(this, other)) return true;

//    return other.id == id &&
//        other.title == title &&
//        other.icon == icon &&
//        other.description == description &&
//        other.boxId == boxId &&
//        other.creator == creator &&
//        other.cost == cost &&
//        other.createdAt == createdAt &&
//        other.updatedAt == updatedAt;
//  }

//  @override
//  int get hashCode {
//    return id.hashCode ^
//        title.hashCode ^
//        icon.hashCode ^
//        description.hashCode ^
//        boxId.hashCode ^
//        creator.hashCode ^
//        cost.hashCode ^
//        createdAt.hashCode ^
//        updatedAt.hashCode;
//  }
//}
