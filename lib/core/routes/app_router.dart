import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';

class RoutesNames {
  static const String signInPage = "signInPageRoute";
  static const String splash = "splashRoute";
  static const String todoPage = "todoPageRoute";
}

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: SplashRoute.page,
      initial: true,
    ),
    AutoRoute(
      page: SignInPageRoute.page,
    ),
    AutoRoute(
      page: TodoPageRoute.page,
    ),
  ];
}

