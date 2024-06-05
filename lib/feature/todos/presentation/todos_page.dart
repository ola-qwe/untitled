import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/core/routes/app_router.dart';
import 'package:untitled/feature/authorization/presentation/states/sign_in_notifier.dart';
import 'package:untitled/feature/todos/presentation/states/loading_notifier.dart';
import 'package:untitled/feature/todos/presentation/states/todos_notifier.dart';
import 'package:untitled/feature/todos/presentation/widgets/todo_item.dart';

@RoutePage(name: RoutesNames.todoPage)
class SignInPage extends HookConsumerWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ScrollController scrollController = useScrollController();
    final load = ref.watch(loadingNotifierProvider);
    final todosList = ref.watch(todosNotifierProvider).todos;
    final signInNotifierNotifier = ref.watch(signInNotifierNotifierProvider);
    void fetchData() {
      ref.read(todosNotifierProvider.notifier).fetchData();
    }

    void onScroll() {
      final isNearBottom = scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200;
      if (isNearBottom &&
          !load &&
          !ref.watch(todosNotifierProvider).isLastPage) {
        fetchData();
      }
    }

    useEffect(() {
      Future.microtask(() => fetchData());
      scrollController.addListener(onScroll);
      return () => scrollController.removeListener(onScroll);
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Todos"),
          ],
        ),
        elevation: 0.6,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        controller: scrollController,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (signInNotifierNotifier != null) ...[
                  Text("Hello${signInNotifierNotifier?.firstName ?? ""}"),
                  SizedBox(
                    height: 10.h,
                  )
                ],
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todosList.length,
                  itemBuilder: (context, index) {
                    return todoItem(todosList[index]);
                  },
                ),
                if (load)
                  const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                      strokeWidth: 2.0,
                    ),
                  ),
              ],
            )),
      ),
    );
  }
}
