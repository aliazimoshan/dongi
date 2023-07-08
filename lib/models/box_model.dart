// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'box_model.freezed.dart';
part 'box_model.g.dart';

@Freezed()
class BoxModel with _$BoxModel {
  const factory BoxModel({
    @JsonKey(name: '\$id') String? id,
    @JsonKey(name: '\$createdAt') String? createdAt,
    @JsonKey(name: '\$updatedAt') String? updatedAt,
    required String title,
    String? description,
    String? image,
    required String groupId,
    @Default([]) List<String> boxUsers,
    @Default(0) num? total,
    required String creatorId,
  }) = _BoxModel;

  factory BoxModel.fromJson(Map<String, dynamic> json) =>
      _$BoxModelFromJson(json);
}
