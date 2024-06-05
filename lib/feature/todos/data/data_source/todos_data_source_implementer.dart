
import 'package:untitled/feature/todos/data/data_source/todos_data_source.dart';
import 'package:untitled/feature/todos/data/network/todos_api_client.dart';
import 'package:untitled/feature/todos/data/responce/todos_responce.dart';

class TodosRemoteDataSourceImplementer implements TodosRemoteDataSource {
  final TodosApiClient api;

  TodosRemoteDataSourceImplementer({required this.api});

  @override
  Future<TodoList> getTodos({
    int? skip,
    int? limit,
  }) {
    return api.getTodos(limit: limit, skip: skip);
  }
}
