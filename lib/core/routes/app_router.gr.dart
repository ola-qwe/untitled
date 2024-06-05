// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:untitled/feature/authorization/presentation/sign_in_page.dart'
    as _i1;
import 'package:untitled/feature/splash/presentation/splash_view.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SignInPageRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.SignInPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.SplashView(),
      );
    },
  };
}

/// generated route for
/// [_i1.SignInPage]
class SignInPageRoute extends _i3.PageRouteInfo<void> {
  const SignInPageRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SignInPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInPageRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SplashView]
class SplashRoute extends _i3.PageRouteInfo<void> {
  const SplashRoute({List<_i3.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
