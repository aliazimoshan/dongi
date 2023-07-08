// ignore_for_file: invalid_annotation_target
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
    @Default([]) List<String> groupUsers,
    @Default([]) List<String> boxIds,
  }) = _GroupModel;

  factory GroupModel.fromJson(Map<String, dynamic> json) =>
      _$GroupModelFromJson(json);
}
