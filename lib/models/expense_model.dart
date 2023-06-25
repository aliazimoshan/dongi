// ignore_for_file: invalid_annotation_target
import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_model.freezed.dart';
part 'expense_model.g.dart';

@Freezed()
class ExpenseModel with _$ExpenseModel {
  const factory ExpenseModel({
    @JsonKey(name: '\$id') String? id,
    @JsonKey(name: '\$createdAt') String? createdAt,
    @JsonKey(name: '\$updatedAt') String? updatedAt,
    required String title,
    String? description,
    String? categoryId,
    required String boxId,
    required String groupId,
    required String creatorId,
    @Default(0) num cost,
    @Default(true) bool equal,
    @Default([]) List<String> expenseUsers,
  }) = _ExpenseModel;

  factory ExpenseModel.fromJson(Map<String, dynamic> json) =>
      _$ExpenseModelFromJson(json);
}
