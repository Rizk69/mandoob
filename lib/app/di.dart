import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/trafiic_lines/data/data_source/remote_traffic_line_data_source.dart';
import 'package:mandoob/features/trafiic_lines/data/network/traffic_line_api.dart';
import 'package:mandoob/core/netowork_core/dio_factory.dart';
import 'package:mandoob/features/trafiic_lines/data/repository/repository_traffic_line_impl.dart';
import 'package:mandoob/features/trafiic_lines/domain/repository/traffic_line_repository.dart';
import 'package:mandoob/features/auth/data/data_source/remote_auth_data_source.dart';
import 'package:mandoob/features/auth/data/network/auth_api.dart';
import 'package:mandoob/features/auth/data/repository/auth_repository_impl.dart';
import 'package:mandoob/features/auth/domain/repository/auth_repository.dart';
import 'package:mandoob/features/auth/domain/usecase/get_profle_usecase.dart';
import 'package:mandoob/features/auth/domain/usecase/login_usecase.dart';
import 'package:mandoob/features/auth/presentation/login/manger/login_cubit.dart';
import 'package:mandoob/features/auth/presentation/profile/cubit/profile_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  // app module, its a module where we put all generic dependencies

  //shared prefs instance
  var sharedPrefs = await SharedPreferences.getInstance();

  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);

  // app prefs instance
  instance
      .registerLazySingleton<AppPreferences>(() => AppPreferences(instance()));

  // network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(InternetConnectionChecker()));

  // dio factory
  instance.registerLazySingleton(() => DioFactory(instance()));

  Dio dio = await instance<DioFactory>().getDio();

  instance.registerLazySingleton<TrafficLineServiceClient>(() => TrafficLineServiceClient(dio));

  instance
      .registerLazySingleton<AuthServiceClient>(() => AuthServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteTrafficLineDataSource>(
      () => RemoteTrafficLinesDataSourceImpl(instance()));

  instance.registerLazySingleton<RemoteAuthDataSource>(
      () => RemoteAuthDataSourceImpl(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryTrafficLineImpl(instance(), instance()));

  instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  }
}

initProfileModule() {
  if (!GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.registerFactory<ProfileCubit>(() => ProfileCubit(instance()));
    instance.registerFactory<ProfileUseCase>(() => ProfileUseCase(instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initProfileModule();
}
