import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/core/routes/app_router.dart';
import 'package:untitled/core/routes/app_router.gr.dart';
import 'package:untitled/core/shared_preferences/shared_preferences_helper.dart';
import 'package:untitled/dependency_injection/service_locator.dart';

const int _splashDelay = 6;

@RoutePage(name: RoutesNames.splash)
class SplashView extends HookConsumerWidget {
  const SplashView({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Timer timer = Timer(const Duration(seconds: _splashDelay), () async {
        final SharedPreferencesHelper sharedPreferencesHelper =
            getIt<SharedPreferencesHelper>();
        final String? userToken =
            sharedPreferencesHelper.getUserToken();
        if (userToken != null ) {
          //TODO home page
          //AutoRouter.of(context).replace(const LandingRoute());
        } else {
          AutoRouter.of(context).replace(const SignInPageRoute());
        }
      });
      return () => timer.cancel();
    }, []);

    return Container(
      color: Colors.white,
      child: Center(
      ),
    );
  }
}
