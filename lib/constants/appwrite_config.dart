class AppwriteConfig {
  static const String projectId = "63d7f6d76a7b8b1dfec6";
  static const String databaseId = "63d7f76893cd2c0af894";
  static const String endPoint = "https://api.dispose.ir/v1";
  static const String usersCollection = '63d7f7862d321a55caa8';
  static const String groupCollection = '63fca819d4c90825a5ba';
  static const String imagesBucket = '63fccbd9199c4c5f9142';
  static String imageUrl(String imageId) =>
      '$endPoint/storage/buckets/$imagesBucket/files/$imageId/view?project=$projectId&mode=admin';
}
