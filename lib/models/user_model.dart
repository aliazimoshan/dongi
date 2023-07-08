// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@Freezed()
class UserModel with _$UserModel {
  const factory UserModel({
    @JsonKey(name: '\$id') String? id,
    @JsonKey(name: '\$createdAt') String? createdAt,
    @JsonKey(name: '\$updatedAt') String? updatedAt,
    required String email,
    required String userName,
    String? firstName,
    String? lastName,
    String? profileImage,
    String? phoneNumber,
    @Default(0) num? totalExpense,
    @Default([]) List<String> userFriends,
    @Default([]) List<String> groupIds,
    @Default([]) List<String> transactions,
    @Default([]) List<String> firebaseTokens,
    @Default([]) List<String> tokens,
  }) = _BoxModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
