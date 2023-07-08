// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'box_user_model.freezed.dart';
part 'box_user_model.g.dart';

@Freezed()
class BoxUserModel with _$BoxUserModel {
  const factory BoxUserModel({
    @JsonKey(name: '\$id') String? id,
    @JsonKey(name: '\$createdAt') String? createdAt,
    @JsonKey(name: '\$updatedAt') String? updatedAt,
    required String userId,
    required String groupId,
    required String boxId,
    @Default("accept") String status,
  }) = _BoxUserModel;

  factory BoxUserModel.fromJson(Map<String, dynamic> json) =>
      _$BoxUserModelFromJson(json);
}
