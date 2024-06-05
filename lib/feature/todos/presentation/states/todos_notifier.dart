import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:untitled/dependency_injection/service_locator.dart';
import 'package:untitled/feature/authorization/presentation/states/loading_notifier.dart';
import 'package:untitled/feature/todos/data/repository/todos_repository.dart';
import 'package:untitled/feature/todos/data/responce/todos_list_state.dart';

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
        // this condition means that this is the first time the user enters the page and reviews is empty so we have a loading for the whole page
        loadingNotifier.startLoading();
      }
      final todosResponse =
          await todosRepository.getTodos(skip: state.currentPage, limit: 10);
/*
      // Create a set of all current product IDs for fast lookup.
      final currentReviewIds = state.todos.map((todo) => todo.id).toSet();

      // Filter the new reviews to only include those with IDs not already present.
      final newUniqueReviews = todosResponse.todos
          .where((todo) => !currentReviewIds.contains(todo.id))
          .toList();

      // Add the filtered list of new, unique reviews to the updated reviews list.
      final updatedReviews = List<Todo>.from(state.todos)
        ..addAll(newUniqueReviews);
*/

      state = state.copyWith(
        todos: todosResponse.todos,
        currentPage: todosResponse.skip + 1,
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
