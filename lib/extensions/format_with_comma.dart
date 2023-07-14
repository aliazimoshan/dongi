import 'package:intl/intl.dart';

extension StringExtension on String {
  String formatWithCommas() {
    if (isEmpty) return this;
    final numberFormat = NumberFormat('#,##0');
    return numberFormat.format(int.parse(this));
  }
}
