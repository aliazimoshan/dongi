import 'package:appwrite/models.dart' as model;
import 'package:dongi/app/register/sign_in/sign_in_page.dart';
import 'package:dongi/constants/route_config.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils.dart';
import '../../../models/user_model.dart';
import '../../../services/auth_service.dart';
import '../../../services/user_service.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, bool>((ref) {
  return AuthController(
    authAPI: ref.watch(authAPIProvider),
    userAPI: ref.watch(userAPIProvider),
  );
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

class AuthController extends StateNotifier<bool> {
  final AuthAPI _authAPI;
  final UserAPI _userAPI;
  AuthController({
    required AuthAPI authAPI,
    required UserAPI userAPI,
  })  : _authAPI = authAPI,
        _userAPI = userAPI,
        super(false);
  // state = isLoading

  Future<model.Account?> currentUser() => _authAPI.currentUserAccount();

  void signUp({
    required BuildContext context,
    required String email,
    required String userName,
    required String password,
  }) async {
    state = true;
    final res = await _authAPI.signUp(
      email: email,
      password: password,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        UserModel userModel = UserModel(
          id: r.$id,
          email: email,
          userName: userName,
        );
        final res2 = await _userAPI.saveUserData(userModel);
        res2.fold(
          (l) => showSnackBar(context, l.message),
          (r) {
            showSnackBar(context, 'Accounted created!!');
            //context.go(RouteNameConfig.home);
            signIn(email: email, password: password, context: context);
          },
        );
      },
    );
  }

  void signIn({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authAPI.signIn(
      email: email,
      password: password,
    );
    state = false;
    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) => context.go(RouteNameConfig.home),
    );
  }

  void signInWithGoogle({required BuildContext context}) async {
    state = true;
    final res = await _authAPI.signInWithGoogle();
    state = false;

    res.fold(
      (l) => showSnackBar(context, l.message),
      (r) async {
        UserModel userModel = UserModel(
          id: r.$id,
          email: r.email,
          userName: r.name,
        );
        //Todo | If the user has an account don't save  data just update it if needed
        //and the snackbar should not pop up
        final res2 = await _userAPI.saveUserData(userModel);
        res2.fold(
          (l) => showSnackBar(context, l.message),
          (r) {
            showSnackBar(context, 'Accounted created!!');
            context.go(RouteNameConfig.home);
            //signIn(email: email, password: password, context: context);
          },
        );
      },
    );
  }

  Future<UserModel> getUserData(String uid) async {
    final document = await _userAPI.getUserData(uid);
    final updatedUser = UserModel.fromMap(document.data);
    return updatedUser;
  }

  void logout(BuildContext context) async {
    final res = await _authAPI.logout();
    res.fold(
      (l) => null,
      (r) => context.go(RouteNameConfig.signin),
    );
  }

  void forgetPassword(BuildContext context) async {
    final res = await _authAPI.logout();
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
