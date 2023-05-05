// ignore_for_file: invalid_annotation_target

import 'package:dongi/models/box_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'group_model.dart';
import 'user_model.dart';
part 'box_user_model.freezed.dart';
part 'box_user_model.g.dart';

@Freezed()
class BoxUserModel with _$BoxUserModel {
  const factory BoxUserModel({
    @JsonKey(name: '\$id') String? id,
    @JsonKey(name: '\$createdAt') String? createdAt,
    @JsonKey(name: '\$updatedAt') String? updatedAt,
    required UserModel userId,
    required GroupModel groupId,
    required BoxModel boxId,
    @Default("accept") String status,
  }) = _BoxUserModel;

  factory BoxUserModel.fromJson(Map<String, dynamic> json) =>
      _$BoxUserModelFromJson(json);
}
