import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/dependency_injection/service_locator.dart';
import 'package:untitled/feature/authorization/presentation/states/loading_notifier.dart';
import 'package:untitled/feature/todos/data/repository/todos_repository.dart';
import 'package:untitled/feature/todos/data/responce/todos_list_state.dart';
import 'package:untitled/feature/todos/data/responce/todos_responce.dart';

class TodosNotifier extends StateNotifier<TodosListState> {
  TodosNotifier({required this.ref, required this.todosRepository})
      : super(TodosListState.unknown());
  final TodosRepository todosRepository;
  final StateNotifierProviderRef<TodosNotifier, TodosListState> ref;

  Future<void> fetchData() async {
    final loadingNotifier = ref.read(loadingNotifierProvider.notifier);

    try {
      loadingNotifier.startLoading();
      if (state.currentPage == 1 && state.todos.isEmpty) {
        loadingNotifier.startLoading();
      }
      final todosResponse =
          await todosRepository.getTodos(skip: state.currentPage, limit: 10);

      final currentReviewIds = state.todos.map((todo) => todo.id).toSet();

      final newUniqueReviews = todosResponse.todos
          .where((todo) => !currentReviewIds.contains(todo.id))
          .toList();

      final updateTodo = List<Todo>.from(state.todos)
        ..addAll(newUniqueReviews);


      state = state.copyWith(
        todos: updateTodo,
        currentPage: todosResponse.skip + 8,
        isLastPage: (todosResponse.total > state.todos.length) ? false : true,
      );
    } catch (error) {
      loadingNotifier.stopLoading();
      rethrow;
    } finally {
      loadingNotifier.stopLoading();
    }
  }
}

final todosNotifierProvider =
    StateNotifierProvider<TodosNotifier, TodosListState>((ref) {
  return TodosNotifier(
    ref: ref,
    todosRepository: getIt<TodosRepository>(),
  );
});
