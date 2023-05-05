// ignore_for_file: invalid_annotation_target

import 'package:dongi/models/box_model.dart';

import 'group_user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_model.freezed.dart';
part 'group_model.g.dart';

@Freezed()
class GroupModel with _$GroupModel {
  const factory GroupModel({
    @JsonKey(name: '\$id') String? id,
    @JsonKey(name: '\$createdAt') String? createdAt,
    @JsonKey(name: '\$updatedAt') String? updatedAt,
    required String title,
    String? description,
    String? image,
    required String creatorId,
    @Default(0) num totalBalance,
    @Default([]) List<GroupUserModel> groupUser,
    @Default([]) List<BoxModel> box,
  }) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
