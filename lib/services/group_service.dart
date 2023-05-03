import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dongi/constants/appwrite_config.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../core/failure.dart';
import '../providers/appwrite_provider.dart';
import '../core/type_defs.dart';
import '../models/group_model.dart';

final groupAPIProvider = Provider((ref) {
  return GroupAPI(
    db: ref.watch(appwriteDatabaseProvider),
    functions: ref.watch(appwriteFunctionProvider),
  );
});

abstract class IGroupAPI {
  FutureEither<Document> addGroup(GroupModel groupModel);
  FutureEither<Document> updateGroup(GroupModel groupModel);
  Future<List<Document>> getGroups(String uid);
  Future<Document> getGroupDetail(String uid, String groupId);
  FutureEither<bool> deleteGroup(String id);
  //
  //FutureEitherVoid saveUserData(UserModel userModel);
  //Future<model.Document> getUserData(String uid);
  //Future<List<model.Document>> searchUserByName(String name);
  //FutureEitherVoid updateUserData(UserModel userModel);
  //Stream<RealtimeMessage> getLatestUserProfileData();
  //FutureEitherVoid followUser(UserModel user);
}

class GroupAPI implements IGroupAPI {
  final Databases _db;
  final Functions _functions;
  GroupAPI({
    required Databases db,
    required Functions functions,
  })  : _db = db,
        _functions = functions;

  @override
  FutureEither<Document> addGroup(GroupModel groupModel) async {
    try {
      final document = await _db.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.groupCollection,
        documentId: ID.unique(),
        data: groupModel.toJson(),
      );
      return right(document);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occurred',
          st,
        ),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  @override
  FutureEither<Document> updateGroup(GroupModel groupModel) async {
    try {
      final document = await _db.updateDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.groupCollection,
        documentId: groupModel.id!,
        data: groupModel.toJson(),
      );
      return right(document);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occurred',
          st,
        ),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  @override
  FutureEither<bool> deleteGroup(String id) async {
    try {
      await _db.deleteDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.groupCollection,
        documentId: id,
      );
      return right(true);
    } on AppwriteException catch (e, st) {
      return left(
        Failure(
          e.message ?? 'Some unexpected error occurred',
          st,
        ),
      );
    } catch (e, st) {
      return left(Failure(e.toString(), st));
    }
  }

  @override
  Future<List<Document>> getGroups(String uid) async {
    final document = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.groupCollection,
      queries: [
        Query.equal('creatorId', uid),
      ],
    );
    return document.documents;
  }

  @override
  Future<Document> getGroupDetail(String uid, String groupId) async {
    final document = await _db.getDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.groupCollection,
      documentId: groupId,
    );
    return document;
  }
}
