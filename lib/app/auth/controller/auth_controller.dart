import 'package:appwrite/models.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../models/user_model.dart';
import '../../../router/router_notifier.dart';
import '../../../services/auth_service.dart';
import '../../../services/user_service.dart';
import '../sign_in/sign_in_page.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    ref: ref,
    authAPI: ref.watch(authAPIProvider),
    userAPI: ref.watch(userAPIProvider),
  );
});

final getUserData = FutureProvider.family((ref, String uid) {
  final userDetails = ref.watch(authControllerProvider.notifier);
  return userDetails.getUserData(uid);
});

final getUsersListData = FutureProvider.family((ref, List<String> uid) {
  final userDetails = ref.watch(authControllerProvider.notifier);
  return userDetails.getUsersListData(uid);
});

//final currentUserDetailsProvider = FutureProvider((ref) {
//  final currentUserId = ref.watch(currentUserAccountProvider).value!.$id;
//  final userDetails = ref.watch(userDetailsProvider(currentUserId));
//  return userDetails.value;
//});

//final userDetailsProvider = FutureProvider.family((ref, String uid) {
//  final authController = ref.watch(authControllerProvider.notifier);
//  return authController.getUserData(uid);
//});

//final currentUserAccountProvider = FutureProvider((ref) {
//  final authController = ref.watch(authControllerProvider.notifier);
//  return authController.currentUser();
//});

//final userIsLoggedIn = Provider<AuthType>(
//  (ref) {
//    final userAccountStatus = ref.watch(currentUserAccountProvider);
//    //final authStatus = ref.watch(userDetailsProvider);
//    print(userAccountStatus);
//    //print(authStatus);
//    if (userAccountStatus.isLoading) {
//      return AuthType.isLoading;
//    } else if (userAccountStatus.value == null) {
//      return AuthType.isNotLoggedIn;
//    } else {
//      return AuthType.isLoggedIn;
//    }
//  },
//);

final currentUserProvider = StateProvider<User?>((ref) {
  return null;
});

class AuthController extends StateNotifier<bool> {
  final AuthAPI authAPI;
  final UserAPI userAPI;
  final Ref ref;

  AuthController({
    required this.authAPI,
    required this.userAPI,
    required this.ref,
  }) : super(false);

  // state = isLoading

  Future<User?> currentUser() => authAPI.currentUserAccount();

  //void signIn({
  //  required String email,
  //  required String password,
  //  required BuildContext context,
  //}) async {
  //  state = true;
  //  final res = await _authAPI.signIn(
  //    email: email,
  //    password: password,
  //  );
  //  state = false;
  //  res.fold(
  //    (l) => showSnackBar(context, l.message),
  //    (r) => context.go(RouteName.home),
  //  );
  //}

  //void signInWithGoogle({required BuildContext context}) async {
  //  state = true;
  //  final res = await _authAPI.signInWithGoogle();
  //  state = false;

  //  res.fold(
  //    (l) => showSnackBar(context, l.message),
  //    (r) async {
  //      UserModel userModel = UserModel(
  //        id: r.$id,
  //        email: r.email,
  //        userName: r.name,
  //      );
  //      //Todo | If the user has an account don't save  data just update it if needed
  //      //and the snackbar should not pop up
  //      final res2 = await _userAPI.saveUserData(userModel);
  //      res2.fold(
  //        (l) => showSnackBar(context, l.message),
  //        (r) {
  //          showSnackBar(context, 'Accounted created!!');
  //          context.go(RouteName.home);
  //          //signIn(email: email, password: password, context: context);
  //        },
  //      );
  //    },
  //  );
  //}

  Future<UserModel> getUserData(String uid) async {
    final document = await userAPI.getUserData(uid);
    final updatedUser = UserModel.fromJson(document.data);
    return updatedUser;
  }

  Future<List<UserModel>> getUsersListData(List<String> userIds) async {
    final document = await userAPI.getUsersListData(userIds);
    return document.map((user) => UserModel.fromJson(user.data)).toList();
  }

  void logout(BuildContext context) async {
    final res = await authAPI.logout();
    res.fold(
      (l) => null,
      (r) {
        ref.read(currentUserProvider.notifier).state = null;
        context.go(RouteName.signin);
      },
    );
  }

  void forgetPassword(BuildContext context) async {
    final res = await authAPI.logout();
    res.fold(
      (l) => null,
      (r) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => SignInPage(),
          ),
          (route) => false,
        );
      },
    );
  }
}
