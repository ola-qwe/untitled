import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/core/routes/app_router.dart';
import 'package:untitled/core/ui/app_assets.dart';
import 'package:untitled/feature/authorization/presentation/states/loading_notifier.dart';
import 'package:untitled/feature/authorization/presentation/states/sign_in_notifier.dart';
import 'package:untitled/feature/authorization/presentation/widgets/button.dart';

@RoutePage(name: RoutesNames.signInPage)
class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();
    final userNameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final load=ref.watch(loadingNotifierProvider);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                SizedBox(
                    height: 300.h,
                    width: double.infinity,
                    child: Image.asset(AppAssets.imageSignIn)),
                const SizedBox(height: 60),
                TextField(
                  controller: userNameController,
                  decoration: const InputDecoration(
                    labelText: 'Username',
                    prefixIcon: Icon(Icons.person),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 20),
                if(load)
                const Center(
                  child: CircularProgressIndicator(
                    color: Colors.green,
                    strokeWidth: 2.0,
                  ),
                ),
                if(!load)
                button(
                    title: "Sign In",
                    onPress: () {
                      ref.read(signInNotifierNotifierProvider.notifier).signIn(
                          userNameController.value.text,
                          passwordController.value.text);

                    })
              ],
            )),
      ),
    );
  }
}
