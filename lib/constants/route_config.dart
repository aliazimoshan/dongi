import 'package:dongi/app/home/home_page.dart';
import 'package:dongi/app/onboarding/onboarding_page.dart';
import 'package:dongi/app/register/sign_in/sign_in_page.dart';
import 'package:dongi/app/register/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
}

GoRouter _goRouterConfig(StateProviderRef ref) {
  return GoRouter(
    initialLocation: RouteNameConfig.home,
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
    ],
    redirect: (context, state) {
      return null;
      //final AuthType isLoggedInProvider = ref.watch(userIsLoggedIn);
      //final isLoggingIn = state.location == RouteNameConfig.signin ||
      //    state.location == RouteNameConfig.signup;
      //print(isLoggedInProvider);
      //switch (isLoggedInProvider) {
      //  case AuthType.isLoading:
      //    //Loading Screen or Splash
      //    return RouteNameConfig.onboarding;
      //  case AuthType.isNotLoggedIn:
      //  case AuthType.isLoggedOut:
      //    if (isLoggingIn) {
      //      return null;
      //    } else {
      //      return RouteNameConfig.signin;
      //    }
      //  case AuthType.isLoggedIn:
      //    return null;
      //  default:
      //    return null;
      //}
      //return userAccountStatus.when(
      //  data: (user) {
      //    if (user != null) {
      //      return RouteNameConfig.home;
      //    }
      //    return RouteNameConfig.signin;
      //  },
      //  error: (error, stackTrace) => null,
      //  loading: () => null,
      //);
    },
  );
}
