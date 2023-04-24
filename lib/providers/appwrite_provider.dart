import 'package:appwrite/appwrite.dart';
import 'package:dongi/constants/appwrite_config.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appwriteClientProvider = Provider((ref) {
  Client client = Client();
  return client
      .setEndpoint(AppwriteConfig.endPoint)
      .setProject(AppwriteConfig.projectId)
      .setSelfSigned(status: true);
});

final appwriteAccountProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Account(client);
});

final appwriteDatabaseProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Databases(client);
});

final appwriteStorageProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Storage(client);
});

final appwriteRealtimeProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Realtime(client);
});

final appwriteFunctionProvider = Provider((ref) {
  final client = ref.watch(appwriteClientProvider);
  return Functions(client);
});





//final appWriteInitializeProvider = FutureProvider.autoDispose((ref) async {
//  try {
//    //final projects = ref.watch(appWriteProjectsProvider);
//    final database = ref.watch(appwriteDatabaseProvider);


//    // Create a new collection
//    final collection = await database.create(
//      name: 'My Collection',
//      read: ['*'],
//      write: ['*'],
//      rules: [],
//      project:
//          project['\$id'], // Use the project ID returned by the create method
//    );

//    return collection;
//  } on AppwriteException catch (e) {
//    // Handle any errors that occur
//    print('Error creating collection or project: ${e.message}');
//    rethrow;
//  }
//});
