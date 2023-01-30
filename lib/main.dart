import 'package:dongi/app/expense/create_expense/create_expense_page.dart';
import 'package:dongi/app/home/home_page.dart';
import 'package:dongi/app/onboarding/onboarding_page.dart';
import 'package:dongi/app/register/auth_controller/auth_controller.dart';
import 'package:dongi/app/register/sign_in/sign_in_page.dart';
import 'package:dongi/app/register/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import './constants/color_config.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  //await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAccountStatus = ref.watch(currentUserAccountProvider);
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: ColorConfig.primarySwatch,
        scaffoldBackgroundColor: ColorConfig.white,
      ),
      debugShowCheckedModeBanner: false,
      home: userAccountStatus.when(
        data: (user) {
          if (user != null) {
            return HomePage();
          }
          return const SignInPage();
        },
        error: (error, st) => Text(error.toString()),
        loading: () => const CircularProgressIndicator(),
      ),
    );
  }
}
