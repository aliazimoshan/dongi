import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:dongi/constants/appwrite_config.dart';
import 'package:dongi/models/expense_user_model.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../core/failure.dart';
import '../models/expense_model.dart';
import '../providers/appwrite_provider.dart';
import '../core/type_defs.dart';

final expenseAPIProvider = Provider((ref) {
  return ExpenseAPI(
    db: ref.watch(appwriteDatabaseProvider),
    //functions: ref.watch(appwriteFunctionProvider),
  );
});

abstract class IExpenseAPI {
  FutureEither<Document> addExpense(
    ExpenseModel expenseModel, {
    required String customId,
  });
  FutureEither<Document> updateExpense(Map updateExpenseModel);
  Future<List<Document>> getExpenses(String uid);
  Future<List<Document>> getExpensesInBox(String groupId);
  Future<Document> getExpenseDetail(String expenseId);
  Future<List<Document>> getUsersInExpense(List<String> userIds);
  Future<List<Document>> getCurrentUserExpenses(String uid);
  FutureEither<bool> deleteExpense(String id);
  FutureEither<bool> deleteAllExpense(List<String> ids);
  FutureEither<bool> addExpenseUser(
    ExpenseUserModel expenseUser, {
    required String customId,
  });
  FutureEither<bool> deleteExpenseUser(String id);
}

class ExpenseAPI implements IExpenseAPI {
  final Databases _db;
  //final Functions _functions;
  ExpenseAPI({
    required Databases db,
    //required Functions functions,
  }) : _db = db;
  //_functions = functions

  @override
  FutureEither<Document> addExpense(
    ExpenseModel expenseModel, {
    required String customId,
  }) async {
    try {
      final document = await _db.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.expenseCollection,
        documentId: customId,
        data: expenseModel.toJson(),
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
  FutureEither<Document> updateExpense(Map updateExpenseModel) async {
    try {
      final document = await _db.updateDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.expenseCollection,
        documentId: updateExpenseModel["\$id"],
        data: updateExpenseModel,
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
  FutureEither<bool> deleteExpense(String id) async {
    try {
      await _db.deleteDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.expenseCollection,
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
  FutureEither<bool> deleteAllExpense(List<String> ids) async {
    try {
      for (var id in ids) {
        try {
          await _db.deleteDocument(
            databaseId: AppwriteConfig.databaseId,
            collectionId: AppwriteConfig.expenseCollection,
            documentId: id,
          );
        } catch (e) {
          rethrow;
        }
      }
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
  FutureEither<bool> addExpenseUser(
    ExpenseUserModel expenseUser, {
    required String customId,
  }) async {
    try {
      await _db.createDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.expenseUserCollection,
        documentId: customId,
        data: expenseUser.toJson(),
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
  FutureEither<bool> deleteExpenseUser(String id) async {
    try {
      await _db.deleteDocument(
        databaseId: AppwriteConfig.databaseId,
        collectionId: AppwriteConfig.expenseUserCollection,
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
  Future<List<Document>> getExpenses(String uid) async {
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
  Future<List<Document>> getExpensesInBox(String boxId) async {
    final document = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.expenseCollection,
      queries: [
        // Show the new expense on top
        Query.orderDesc('\$createdAt'),
        Query.equal('boxId', boxId),
      ],
    );
    return document.documents;
  }

  @override
  Future<Document> getExpenseDetail(String expenseId) async {
    final document = await _db.getDocument(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.expenseCollection,
      documentId: expenseId,
      //queries: [
      //  Query.equal('\$id', expenseId),
      //],
    );
    return document;
  }

  @override
  Future<List<Document>> getUsersInExpense(List<String> userIds) async {
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
  Future<List<Document>> getCurrentUserExpenses(String uid) async {
    final document = await _db.listDocuments(
      databaseId: AppwriteConfig.databaseId,
      collectionId: AppwriteConfig.expenseCollection,
      queries: [
        Query.equal('creatorId', uid),
      ],
    );
    return document.documents;
  }
}
