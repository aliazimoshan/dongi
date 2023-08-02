import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../constants/appwrite_config.dart';
import '../providers/appwrite_provider.dart';

final homeAPIProvider = Provider((ref) {
  return HomeAPI(
    db: ref.watch(appwriteDatabaseProvider),
    //functions: ref.watch(appwriteFunctionProvider),
  );
});

abstract class IHomeAPI {
  Future<List<Document>> getGroupsInHome(String uid);
}

class HomeAPI implements IHomeAPI {
  final Databases _db;
  HomeAPI({required Databases db}) : _db = db;

  @override
  Future<List<Document>> getGroupsInHome(String uid) async {
    final document = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.groupCollection,
      queries: [
        Query.equal('creatorId', uid),
        Query.orderDesc('\$createdAt'),
        Query.limit(3),
      ],
    );
    return document.documents;
  }
}
