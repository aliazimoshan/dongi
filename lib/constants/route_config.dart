import 'package:dongi/app/group/group_list/group_list_page.dart';
import 'package:dongi/app/home/home_page.dart';
import 'package:dongi/app/onboarding/onboarding_page.dart';
import 'package:dongi/app/register/sign_in/sign_in_page.dart';
import 'package:dongi/app/register/sign_up/sign_up_page.dart';
import 'package:dongi/models/group_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/group/create_group/create_group_page.dart';
import '../app/group/group_review/group_detail_page.dart';
import '../app/group/update_group/update_group_page.dart';
import '../app/register/auth_controller/auth_controller.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final routerProvider = StateProvider.family(
  (ref, arg) => _goRouterConfig(ref),
);

class RouteNameConfig {
  static String home = '/';
  static String splash = '/splash';
  static String signin = '/signin';
  static String signup = '/signup';
  static String onboarding = '/onboarding';
  static String groupList = '/group';
  static String createGroup = '/group/create';
  static String updateGroup = '/group/update';
  static String groupDetail(String? groupId) =>
      '/group/${groupId ?? ":groupId"}';
}

GoRouter _goRouterConfig(StateProviderRef ref) {
  return GoRouter(
    initialLocation: RouteNameConfig.groupList,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: RouteNameConfig.home,
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: RouteNameConfig.signup,
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        path: RouteNameConfig.signin,
        builder: (context, state) => SignInPage(),
      ),
      GoRoute(
        path: RouteNameConfig.onboarding,
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        path: RouteNameConfig.groupList,
        builder: (context, state) => GroupListPage(),
      ),
      GoRoute(
        path: RouteNameConfig.createGroup,
        builder: (context, state) => CreateGroupPage(),
      ),
      GoRoute(
        path: RouteNameConfig.updateGroup,
        builder: (context, state) {
          GroupModel groupModel = state.extra as GroupModel;
          return UpdateGroupPage(groupModel: groupModel);
        },
      ),
      GoRoute(
        path: RouteNameConfig.groupDetail(null),
        builder: (context, state) {
          String groupId = state.params['groupId']!;
          return GroupDetailPage(groupId: groupId);
        },
      ),
    ],
    redirect: (context, state) async {
      bool isUserSigningIn = false;
      if (state.location == RouteNameConfig.signup ||
          state.location == RouteNameConfig.signin) {
        //user try to sign in or sign up
        isUserSigningIn = true;
      }

      if (isUserSigningIn) return null;

      final currentUserProvider =
          await ref.read(authControllerProvider.notifier).currentUser();
      if (currentUserProvider != null) {
        return null;
      }

      return RouteNameConfig.signin;
    },
  );
}
