import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/core/routes/app_router.dart';
import 'package:untitled/core/shared_preferences/shared_preferences_helper.dart';
import 'package:untitled/dependency_injection/service_locator.dart';

Future<void> main() async {
  // Configure injection
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  final sharedPreferencesHelper = getIt<SharedPreferencesHelper>();
  runApp(
    ProviderScope(
      child: Builder(builder: (context) {
        return Consumer(builder: (context, ref, child) => const MyApp());
      }),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
      child: ScreenUtilInit(
        designSize: const Size(
          375,
          758,
        ),
        builder: (context, child) {
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: "Midas",
            routerConfig: getIt<AppRouter>().config(),
          );
        },
      ),
    );
  }
}
