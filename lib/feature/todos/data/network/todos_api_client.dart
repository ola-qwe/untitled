import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:untitled/core/ui/end_point.dart';
import 'package:untitled/feature/authorization/data/responce/sign_in_responce.dart';
import 'package:untitled/feature/todos/data/responce/todos_responce.dart';

part 'todos_api_client.g.dart';

@RestApi()
abstract class TodosApiClient {
  factory TodosApiClient(Dio dio) = _TodosApiClient;

  @POST(EndPoint.todos)
  Future<TodoList> getTodos({
    @Query("skip") int? skip,
    @Query("limit") int? limit,
  });
}
