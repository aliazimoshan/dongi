extension StringExtension on String {
  String formatWithCommas() {
    final regex = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    return replaceAllMapped(regex, (match) => '${match[1]},');
  }
}
