// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'group_user_model.freezed.dart';
part 'group_user_model.g.dart';

@Freezed()
class GroupUserModel with _$GroupUserModel {
  const factory GroupUserModel({
    @JsonKey(name: '\$id') String? id,
    @JsonKey(name: '\$createdAt') String? createdAt,
    @JsonKey(name: '\$updatedAt') String? updatedAt,
    required String userId,
    required String groupId,
    @Default("pending") String status,
  }) = _GroupUserModel;

  factory GroupUserModel.fromJson(Map<String, dynamic> json) =>
      _$GroupUserModelFromJson(json);
}
