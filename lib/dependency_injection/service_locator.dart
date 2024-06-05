import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled/core/routes/app_router.dart';
import 'package:untitled/core/shared_preferences/shared_preferences_helper.dart';
import 'package:untitled/feature/authorization/data/data_source/authorization_data_source.dart';
import 'package:untitled/feature/authorization/data/network/authorization_api_client.dart';
import 'package:untitled/feature/authorization/data/repository/authorization_repository.dart';

import '../feature/authorization/data/data_source/authorization_data_source_implementer.dart';
import '../feature/authorization/domain/repository/authorization_repository_implementer.dart';

final getIt = GetIt.instance;

Future<void> setupLocator() async {
  GetIt.instance.registerSingleton<Dio>(Dio());
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();

  getIt.registerLazySingleton<SharedPreferencesHelper>(
    () => SharedPreferencesHelper(
      sharedPreferences,
    ),
  );
//api
  getIt.registerLazySingleton<AuthorizationApiClient>(
    () => AuthorizationApiClient(
      getIt<Dio>(),
    ),
  );

  //      data source
  getIt.registerLazySingleton<AuthorizationRemoteDataSource>(
    () => AuthorizationRemoteDataSourceImplementer(
        signInApiClient: getIt<AuthorizationApiClient>()),
  );
//repo
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
