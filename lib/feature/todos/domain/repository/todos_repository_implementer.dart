
import 'package:untitled/feature/todos/data/data_source/todos_data_source.dart';
import 'package:untitled/feature/todos/data/repository/todos_repository.dart';
import 'package:untitled/feature/todos/data/responce/todos_responce.dart';

class TodosRepositoryImplementer implements TodosRepository {
  final TodosRemoteDataSource todosRemoteDataSource;

  TodosRepositoryImplementer({
    required this.todosRemoteDataSource,
  });

  @override
  Future<TodoList> getTodos({
    int? skip,
    int? limit,
  }) {
    return todosRemoteDataSource.getTodos(skip: skip, limit: limit);
  }
}
