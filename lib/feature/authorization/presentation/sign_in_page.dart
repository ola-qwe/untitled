import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/core/routes/app_router.dart';
import 'package:untitled/core/routes/app_router.gr.dart';
import 'package:untitled/core/ui/app_assets.dart';
import 'package:untitled/feature/authorization/presentation/states/loading_notifier.dart';
import 'package:untitled/feature/authorization/presentation/states/sign_in_notifier.dart';
import 'package:untitled/feature/authorization/presentation/widgets/button.dart';
import 'package:fluttertoast/fluttertoast.dart';

@RoutePage(name: RoutesNames.signInPage)
class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();
    final userNameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final load = ref.watch(loadingNotifierProvider);
    return Scaffold(
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        child: Stack(
          children: [
            SizedBox(
                height: 800.h,
                width: double.infinity,
                child: Image.asset(
                  AppAssets.imageSignIn,
                  fit: BoxFit.fill,
                )),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 350.h),
                    TextField(
                      controller: userNameController,
                      decoration: const InputDecoration(
                        labelText: 'Username',
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        filled: true,
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    if (load)
                      const Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                          strokeWidth: 2.0,
                        ),
                      ),
                    if (!load)
                      Row(
                        children: [
                          button(
                              title: "Sign In",
                              tab: () {
                                if (userNameController.value.text.isNotEmpty &&
                                    passwordController.value.text.isNotEmpty) {
                                  ref
                                      .read(signInNotifierNotifierProvider.notifier)
                                      .signIn(userNameController.value.text,
                                          passwordController.value.text);
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "enter name and password please");
                                }
                              }),
                        ],
                      ),
                    Row(
                      children: [
                        button(
                            title: "just browsing",
                            tab: () {
                              AutoRouter.of(context).replace(const TodoPageRoute());
                            }),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
