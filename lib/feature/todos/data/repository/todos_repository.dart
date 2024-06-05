import 'package:untitled/feature/todos/data/responce/todos_responce.dart';

abstract class TodosRepository {
  Future<TodoList> getTodos({
    int? skip,
    int? limit,
  });
}
