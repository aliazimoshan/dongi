import 'package:dongi/constants/route_config.dart';
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
    return MaterialApp.router(
      theme: ThemeData(
        primarySwatch: ColorConfig.primarySwatch,
        scaffoldBackgroundColor: ColorConfig.white,
      ),
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routerProvider(ref)),
      //home: userAccountStatus.when(
      //  data: (user) {
      //    if (user != null) {
      //      return HomePage();
      //    }
      //    return SignInPage();
      //  },
      //  error: (error, st) => Text(error.toString()),
      //  loading: () => const Center(child: CircularProgressIndicator()),
      //),
    );
  }
}
