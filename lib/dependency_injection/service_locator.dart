import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/routes/app_router.dart';
import 'package:untitled/core/shared_preferences/shared_preferences_helper.dart';
import 'package:untitled/core/network/network.dart';
import 'package:untitled/feature/authorization/data/data_source/authorization_data_source.dart';
import 'package:untitled/feature/authorization/data/network/authorization_api_client.dart';
import 'package:untitled/feature/authorization/data/repository/authorization_repository.dart';
import 'package:untitled/feature/todos/data/data_source/todos_data_source.dart';
import 'package:untitled/feature/todos/data/data_source/todos_data_source_implementer.dart';
import 'package:untitled/feature/todos/data/network/todos_api_client.dart';
import 'package:untitled/feature/todos/data/repository/todos_repository.dart';
import 'package:untitled/feature/todos/domain/repository/todos_repository_implementer.dart';

import '../feature/authorization/data/data_source/authorization_data_source_implementer.dart';
import '../feature/authorization/domain/repository/authorization_repository_implementer.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferencesHelper>(
    () => SharedPreferencesHelper(
      sharedPreferences,
    ),
  );
  getIt.registerSingleton<Dio>(NetworkModule.provideDio());
//api
  getIt.registerLazySingleton<AuthorizationApiClient>(
    () => AuthorizationApiClient(
      getIt<Dio>(),
    ),
  );
  getIt.registerLazySingleton<TodosApiClient>(
    () => TodosApiClient(
      getIt<Dio>(),
    ),
  );
  //      data source
  getIt.registerLazySingleton<AuthorizationRemoteDataSource>(
    () => AuthorizationRemoteDataSourceImplementer(
        signInApiClient: getIt<AuthorizationApiClient>()),
  );
  getIt.registerLazySingleton<TodosRemoteDataSource>(
    () => TodosRemoteDataSourceImplementer(api: getIt<TodosApiClient>()),
  );
//repo
  getIt.registerLazySingleton<TodosRepository>(
    () => TodosRepositoryImplementer(
      todosRemoteDataSource: getIt<TodosRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<AuthorizationRepository>(
    () => AuthorizationRepositoryImplementer(
      authorizationRemoteDataSource: getIt<AuthorizationRemoteDataSource>(),
    ),
  );
  // Router
  getIt.registerSingleton<AppRouter>(AppRouter());
}

Future<void> unRegisterLocator() async {
  getIt.unregister<SharedPreferencesHelper>();
}
