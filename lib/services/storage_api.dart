import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:dongi/constants/appwrite_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../core/providers.dart';

final storageAPIProvider = Provider((ref) {
  return StorageAPI(
    storage: ref.watch(appwriteStorageProvider),
  );
});

class StorageAPI {
  final Storage _storage;
  StorageAPI({required Storage storage}) : _storage = storage;

  Future<List<String>> uploadImage(List<File> files) async {
    List<String> imageLinks = [];
    for (final file in files) {
      final uploadedImage = await _storage.createFile(
        bucketId: AppwriteConfig.imagesBucket,
        fileId: ID.unique(),
        file: InputFile.fromPath(path: file.path),
      );
      imageLinks.add(
        AppwriteConfig.imageUrl(uploadedImage.$id),
      );
    }
    return imageLinks;
  }

  Future<void> deleteImage(String image) async {
    String imageId = image.substring(
      image.indexOf('/files/') + 7,
      image.indexOf('/view'),
    );
    await _storage.deleteFile(
      bucketId: AppwriteConfig.imagesBucket,
      fileId: imageId,
    );
  }
}
