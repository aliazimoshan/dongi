// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_user_model.freezed.dart';
part 'expense_user_model.g.dart';

@Freezed()
class ExpenseUserModel with _$ExpenseUserModel {
  const factory ExpenseUserModel({
    @JsonKey(name: '\$id') String? id,
    @JsonKey(name: '\$createdAt') String? createdAt,
    @JsonKey(name: '\$updatedAt') String? updatedAt,
    required String userId,
    required String groupId,
    required String boxId,
    required String expenseId,
    @Default(0) num cost,
    @Default(false) bool isPaid,
  }) = _ExpenseUserModel;

  factory ExpenseUserModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseUserModelFromJson(json);
}
