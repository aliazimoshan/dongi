import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dongi/constants/appwrite_config.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../core/failure.dart';
import '../providers/appwrite_provider.dart';
import '../core/type_defs.dart';
import '../models/box_model.dart';

final boxAPIProvider = Provider((ref) {
  return BoxAPI(
    db: ref.watch(appwriteDatabaseProvider),
    //functions: ref.watch(appwriteFunctionProvider),
  );
});

abstract class IBoxAPI {
  FutureEither<Document> addBox(BoxModel boxModel);
  FutureEither<Document> updateBox(BoxModel boxModel);
  Future<List<Document>> getBoxes(String uid);
  Future<List<Document>> getBoxesInGroup(String groupId);
  Future<Document> getBoxDetail(String boxId);
  Future<List<Document>> getUsersInBox(List<String> userIds);
  Future<List<Document>> getCurrentUserBoxes(String uid);
  FutureEither<bool> deleteBox(String id);
}

class BoxAPI implements IBoxAPI {
  final Databases _db;
  //final Functions _functions;
  BoxAPI({
    required Databases db,
    //required Functions functions,
  }) : _db = db;
  //_functions = functions

  @override
  FutureEither<Document> addBox(BoxModel boxModel) async {
    try {
      final document = await _db.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.boxCollection,
        documentId: ID.unique(),
        data: boxModel.toJson(),
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
  FutureEither<Document> updateBox(BoxModel boxModel) async {
    try {
      final document = await _db.updateDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.boxCollection,
        documentId: boxModel.id!,
        data: boxModel.toJson(),
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
  FutureEither<bool> deleteBox(String id) async {
    try {
      await _db.deleteDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.boxCollection,
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
  Future<List<Document>> getBoxes(String uid) async {
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
  Future<List<Document>> getBoxesInGroup(String groupId) async {
    final document = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.boxCollection,
      queries: [
        Query.equal('groupId', groupId),
      ],
    );
    return document.documents;
  }

  @override
  Future<Document> getBoxDetail(String boxId) async {
    final document = await _db.getDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.boxCollection,
      documentId: boxId,
      //queries: [
      //  Query.equal('groupId', groupId),
      //],
    );
    return document;
  }

  @override
  Future<List<Document>> getUsersInBox(List<String> userIds) async {
    try {
      if (userIds.isEmpty) return [];
      final document = await _db.listDocuments(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.usersCollection,
        queries: [
          Query.equal('\$id', userIds),
        ],
      );
      return document.documents;
    } catch (e) {
      return [];
    }
  }

  @override
  Future<List<Document>> getCurrentUserBoxes(String uid) async {
    final document = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.boxCollection,
      queries: [
        Query.equal('creatorId', uid),
      ],
    );
    return document.documents;
  }
}
