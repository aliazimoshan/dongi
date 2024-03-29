import 'package:dongi/app/box/box_detail/box_detail_page.dart';
import 'package:dongi/app/expense/create_expense/create_expense_page.dart';
import 'package:dongi/app/expense/made_by/made_by_page.dart';
import 'package:dongi/app/expense/split/split_page.dart';
import 'package:dongi/app/friends/friends_list/friends_list_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../app/auth/controller/auth_controller.dart';
import '../app/auth/sign_in/sign_in_page.dart';
import '../app/auth/sign_up/sign_up_page.dart';
import '../app/box/create_box/create_box_page.dart';
import '../app/box/update_box/update_box_page.dart';
import '../app/expense/expense_detail/expense_detail_page.dart';
import '../app/expense/update_expense/update_expense_page.dart';
import '../app/group/create_group/create_group_page.dart';
import '../app/group/group_detail/group_detail_page.dart';
import '../app/group/group_list/group_list_page.dart';
import '../app/group/update_group/update_group_page.dart';
import '../app/home/home_page.dart';
import '../app/onboarding/onboarding_page.dart';
import '../app/splash/splash_page.dart';
import '../models/box_model.dart';
import '../models/group_model.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final routerProvider = StateProvider.family(
  (ref, arg) => _goRouterConfig(ref),
);

class RouteName {
  const RouteName._();

  static String home = '/';
  static String splash = '/splash';
  static String signin = '/signin';
  static String signup = '/signup';
  static String onboarding = '/onboarding';
  static String groupList = '/group';
  static String createGroup = '/group/create';
  static String updateGroup = '/group/update';
  static String createBox = '/box/create';
  static String updateBox = '/box/update';
  static String groupDetail(String? groupId) =>
      '/group/${groupId ?? ":groupId"}';
  static String boxDetail(String? boxId) => '/box/${boxId ?? ":boxId"}';
  static String friendList = '/friend/list';
  static String createExpense = '/expense/create';
  static String updateExpense = '/expense/update';
  static String expenseMadeBy = '/expense/madeByd';
  static String expenseSplit = '/expense/split';
  static String expenseDetail = '/expense/detail';
}

GoRouter _goRouterConfig(StateProviderRef ref) {
  return GoRouter(
    initialLocation: RouteName.splash,
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: RouteName.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: RouteName.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouteName.signup,
        builder: (context, state) => SignUpPage(),
      ),
      GoRoute(
        path: RouteName.signin,
        builder: (context, state) => SignInPage(),
      ),
      GoRoute(
        path: RouteName.onboarding,
        builder: (context, state) => OnboardingPage(),
      ),
      GoRoute(
        path: RouteName.groupList,
        builder: (context, state) => const GroupListPage(),
      ),
      GoRoute(
        path: RouteName.createGroup,
        builder: (context, state) => CreateGroupPage(),
      ),
      GoRoute(
        path: RouteName.friendList,
        builder: (context, state) => const FriendsListPage(),
      ),
      GoRoute(
        path: RouteName.createBox,
        builder: (context, state) {
          Map extra = state.extra as Map<String, dynamic>;
          return CreateBoxPage(
            groupModel: extra["groupModel"],
          );
        },
      ),
      GoRoute(
        path: RouteName.updateGroup,
        builder: (context, state) {
          GroupModel groupModel = state.extra as GroupModel;
          return UpdateGroupPage(groupModel: groupModel);
        },
      ),
      GoRoute(
        path: RouteName.updateBox,
        builder: (context, state) {
          Map extra = state.extra as Map<String, dynamic>;
          return UpdateBoxPage(boxModel: extra['boxModel']);
        },
      ),
      GoRoute(
        path: RouteName.boxDetail(null),
        builder: (context, state) {
          String boxId = state.params['boxId']!;
          Map extra = state.extra as Map<String, dynamic>;
          return BoxDetailPage(
            boxId: boxId,
            groupModel: extra['groupModel'],
          );
        },
      ),
      GoRoute(
        path: RouteName.groupDetail(null),
        builder: (context, state) {
          String groupId = state.params['groupId']!;
          return GroupDetailPage(groupId: groupId);
        },
      ),
      GoRoute(
        path: RouteName.createExpense,
        builder: (context, state) {
          Map extra = state.extra as Map<String, dynamic>;
          return CreateExpensePage(
            boxModel: extra['boxModel'],
            groupModel: extra['groupModel'],
          );
        },
      ),
      GoRoute(
        path: RouteName.updateExpense,
        builder: (context, state) {
          Map extra = state.extra as Map<String, dynamic>;
          return UpdateExpensePage(
            expenseModel: extra['expenseModel'],
            boxModel: extra['boxModel'],
            groupModel: extra['groupModel'],
          );
        },
      ),
      GoRoute(
        path: RouteName.expenseMadeBy,
        builder: (context, state) => const MadeByPage(),
      ),
      GoRoute(
          path: RouteName.expenseSplit,
          builder: (context, state) {
            Map extra = state.extra as Map<String, dynamic>;
            return SplitPage(
              expenseCost: extra["expenseCost"],
            );
          }),
      GoRoute(
          path: RouteName.expenseDetail,
          builder: (context, state) {
            Map extra = state.extra as Map<String, dynamic>;
            return ExpenseDetailPage(
              expenseId: extra["expenseId"],
            );
          }),
    ],
    redirect: (context, state) async {
      if (state.location == RouteName.signup ||
          state.location == RouteName.signin ||
          state.location == RouteName.splash) {
        //user try to sign in or sign up
        return null;
      }

      final user = ref.watch(currentUserProvider);
      if (user != null) {
        return null;
      }

      return RouteName.signin;
    },
  );
}



//import 'package:dongi/app/splash/splash_page.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_riverpod/flutter_riverpod.dart';
//import 'package:go_router/go_router.dart';
//import 'package:riverpod_annotation/riverpod_annotation.dart';

//import '../app/box/create_box/create_box_page.dart';
//import '../app/box/update_box/update_box_page.dart';
//import '../app/group/create_group/create_group_page.dart';
//import '../app/group/group_detail/group_detail_page.dart';
//import '../app/group/group_list/group_list_page.dart';
//import '../app/group/update_group/update_group_page.dart';
//import '../app/home/home_page.dart';
//import '../app/onboarding/onboarding_page.dart';
//import '../app/register/auth_controller/auth_controller.dart';
//import '../app/register/sign_in/sign_in_page.dart';
//import '../app/register/sign_up/sign_up_page.dart';
//import '../models/box_model.dart';
//import '../models/group_model.dart';

//class RouteName {
//  const RouteName._();

//  static String home = '/';
//  static String splash = '/splash';
//  static String signin = '/signin';
//  static String signup = '/signup';
//  static String onboarding = '/onboarding';
//  static String groupList = '/group';
//  static String createGroup = '/group/create';
//  static String updateGroup = '/group/update';
//  static String createBox = '/box/create';
//  static String updateBox = '/box/update';
//  static String groupDetail(String? groupId) =>
//      '/group/${groupId ?? ":groupId"}';
//}

///// This notifier is meant to implement the [Listenable] our [GoRouter] needs.
/////
///// We aim to trigger redirects whenever's needed.
///// This is done by calling our (only) listener every time we want to notify stuff.
///// This allows to centralize global redirecting logic in this class.
///// In this simple case, we just listen to auth changes.
/////
///// SIDE NOTE.
///// This might look overcomplicated at a first glance;
///// Instead, this method aims to follow some good some good practices:
/////   1. It doesn't require us to pipe down any `ref` parameter
/////   2. It works as a complete replacement for [ChangeNotifier] (it's a [Listenable] implementation)
/////   3. It allows for listening to multiple providers if needed (we do have a [Ref] now!)
//class RouterNotifier extends AutoDisposeAsyncNotifier<void>
//    implements Listenable {
//  VoidCallback? routerListener;
//  bool isAuth = false; // Useful for our global redirect function

//  @override
//  Future<void> build() async {
//    // One could watch more providers and write logic accordingly

//    isAuth =
//        await ref.watch(authControllerProvider.notifier).currentUser() != null;
//    //   isAuth = await ref.watch(
//    //authControllerProvider.selectAsync((data) => data != null),
//    //);

//    ref.listenSelf((_, __) {
//      // One could write more conditional logic for when to call redirection
//      if (state.isLoading) return;
//      routerListener?.call();
//    });
//  }

//  /// Redirects the user when our authentication changes
//  String? redirect(BuildContext context, GoRouterState state) {
//    if (this.state.isLoading || this.state.hasError) return null;

//    final isSplash = state.location == RouteName.splash;

//    if (isSplash) {
//      return isAuth ? RouteName.home : RouteName.signin;
//    }

//    final isLoggingIn = state.location == RouteName.signin ||
//        state.location == RouteName.signup;
//    if (isLoggingIn) return isAuth ? RouteName.home : null;

//    return isAuth ? null : RouteName.splash;
//  }

//  /// Our application routes. Obtained through code generation
//  List<GoRoute> get routes => [
//        GoRoute(
//          path: RouteName.splash,
//          builder: (context, state) => SplashPage(),
//        ),
//        GoRoute(
//          path: RouteName.home,
//          builder: (context, state) => HomePage(),
//        ),
//        GoRoute(
//          path: RouteName.signup,
//          builder: (context, state) => SignUpPage(),
//        ),
//        GoRoute(
//          path: RouteName.signin,
//          builder: (context, state) => SignInPage(),
//        ),
//        GoRoute(
//          path: RouteName.onboarding,
//          builder: (context, state) => OnboardingPage(),
//        ),
//        GoRoute(
//          path: RouteName.groupList,
//          builder: (context, state) => GroupListPage(),
//        ),
//        GoRoute(
//          path: RouteName.createGroup,
//          builder: (context, state) => CreateGroupPage(),
//        ),
//        GoRoute(
//          path: RouteName.createBox,
//          builder: (context, state) {
//            String groupId = state.extra as String;
//            return CreateBoxPage(groupId);
//          },
//        ),
//        GoRoute(
//          path: RouteName.updateGroup,
//          builder: (context, state) {
//            GroupModel groupModel = state.extra as GroupModel;
//            return UpdateGroupPage(groupModel: groupModel);
//          },
//        ),
//        GoRoute(
//          path: RouteName.updateBox,
//          builder: (context, state) {
//            BoxModel boxModel = state.extra as BoxModel;
//            return UpdateBoxPage(boxModel: boxModel);
//          },
//        ),
//        GoRoute(
//          path: RouteName.groupDetail(null),
//          builder: (context, state) {
//            String groupId = state.params['groupId']!;
//            return GroupDetailPage(groupId: groupId);
//          },
//        ),
//      ];

//  /// Adds [GoRouter]'s listener as specified by its [Listenable].
//  /// [GoRouteInformationProvider] uses this method on creation to handle its
//  /// internal [ChangeNotifier].
//  /// Check out the internal implementation of [GoRouter] and
//  /// [GoRouteInformationProvider] to see this in action.
//  @override
//  void addListener(VoidCallback listener) {
//    routerListener = listener;
//  }

//  /// Removes [GoRouter]'s listener as specified by its [Listenable].
//  /// [GoRouteInformationProvider] uses this method when disposing,
//  /// so that it removes its callback when destroyed.
//  /// Check out the internal implementation of [GoRouter] and
//  /// [GoRouteInformationProvider] to see this in action.
//  @override
//  void removeListener(VoidCallback listener) {
//    routerListener = null;
//  }
//}

//final routerNotifierProvider =
//    AutoDisposeAsyncNotifierProvider<RouterNotifier, void>(() {
//  return RouterNotifier();
//});

///// A simple extension to determine wherever should we redirect our users
////extension RedirectionBasedOnRole on UserRole {
////  /// Redirects the users based on [this] and its current [location]
////  String? redirectBasedOn(String location) {
////    switch (this) {
////      case UserRole.admin:
////        return null;
////      case UserRole.verifiedUser:
////      case UserRole.unverifiedUser:
////        if (location == AdminPage.path) return HomePage.path;
////        return null;
////      case UserRole.guest:
////      case UserRole.none:
////        if (location != HomePage.path) return HomePage.path;
////        return null;
////    }
////  }
////}

