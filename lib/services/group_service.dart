import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart' as model;
import 'package:dongi/constants/appwrite_config.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../core/failure.dart';
import '../core/providers.dart';
import '../core/type_defs.dart';
import '../models/group_model.dart';

final groupAPIProvider = Provider((ref) {
  return GroupAPI(
    db: ref.watch(appwriteDatabaseProvider),
  );
});

abstract class IGroupAPI {
  FutureEither<model.Document> addGroup(GroupModel groupModel);
  FutureEither<model.DocumentList> getGroupList(String uid);
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
  //final Realtime _realtime;
  GroupAPI({
    required Databases db,
    //required Realtime realtime,
  }) : _db = db
  //_realtime = realtime
  ;

  @override
  FutureEither<model.Document> addGroup(GroupModel groupModel) async {
    try {
      final document = await _db.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.groupCollection,
        documentId: ID.unique(),
        data: groupModel.toMap(),
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
  FutureEither<model.DocumentList> getGroupList(String uid) async {
    try {
      final document = await _db.listDocuments(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.groupCollection,
        queries: [
          Query.equal('uid', uid),
        ],
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
}
