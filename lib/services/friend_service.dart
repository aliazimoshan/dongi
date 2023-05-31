import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dongi/constants/appwrite_config.dart';
import 'package:dongi/models/user_friend_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../core/failure.dart';
import '../providers/appwrite_provider.dart';
import '../core/type_defs.dart';

final friendAPIProvider = Provider((ref) {
  return FriendAPI(
    db: ref.watch(appwriteDatabaseProvider),
    //functions: ref.watch(appwriteFunctionProvider),
  );
});

abstract class IFriendAPI {
  FutureEither<Document> addFriend(UserFriendModel friendModel);
  Future<List<Document>> getFriends(String uid);
  Future<Document> getFriendDetail(String uid, String friendId);
  FutureEither<bool> deleteFriend(String id);
  //
  //FutureEitherVoid saveUserData(UserModel userModel);
  //Future<model.Document> getUserData(String uid);
  //Future<List<model.Document>> searchUserByName(String name);
  //FutureEitherVoid updateUserData(UserModel userModel);
  //Stream<RealtimeMessage> getLatestUserProfileData();
  //FutureEitherVoid followUser(UserModel user);
}

class FriendAPI implements IFriendAPI {
  final Databases _db;
  //final Functions _functions;
  FriendAPI({
    required Databases db,
    //required Functions functions,
  }) : _db = db;
  //_functions = functions;

  @override
  FutureEither<Document> addFriend(UserFriendModel friendModel) async {
    try {
      final document = await _db.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.userFriendCollection,
        documentId: ID.unique(),
        data: friendModel.toJson(),
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
  FutureEither<bool> deleteFriend(String id) async {
    try {
      await _db.deleteDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.userFriendCollection,
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
  Future<List<Document>> getFriends(String uid) async {
    final document = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.userFriendCollection,
      queries: [
        Query.equal('creatorId', uid),
        //Query.select("attributes")
      ],
    );
    return document.documents;
  }

  @override
  Future<Document> getFriendDetail(String uid, String friendId) async {
    final document = await _db.getDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.userFriendCollection,
      documentId: friendId,
    );
    return document;
  }
}
