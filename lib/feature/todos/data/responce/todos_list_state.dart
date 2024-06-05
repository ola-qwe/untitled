import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:untitled/feature/todos/data/responce/todos_responce.dart';

part 'todos_list_state.freezed.dart';

part 'todos_list_state.g.dart';

@freezed
class TodosListState with _$TodosListState {
  const factory TodosListState({
    required List<Todo> todos,
    required bool isLastPage,
    required int currentPage,
  }) = _TodosListState;

  factory TodosListState.fromJson(Map<String, dynamic> json) =>
      _$TodosListStateFromJson(json);

  factory TodosListState.unknown() => const TodosListState(
        todos: [],
        isLastPage: false,
        currentPage: 1,
      );
}
