import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/data/data_source/remote_data_source.dart';
import 'package:mandoob/data/network/app_api.dart';
import 'package:mandoob/data/network/dio_factory.dart';
import 'package:mandoob/data/network/network_info.dart';
import 'package:mandoob/data/repository/repository_impl.dart';
import 'package:mandoob/domain/repository/repository.dart';
import 'package:mandoob/domain/usecase/login_usecase.dart';
import 'package:mandoob/presentation/login/manger/login_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/usecase/edit_Color_Profile_usecases.dart';
import '../domain/usecase/get_profle_usecase.dart';
import '../presentation/profile/cubit/profile_cubit.dart';

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

  instance.registerLazySingleton<AppServiceClient>(() => AppServiceClient(dio));

  // remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImpl(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  }

}

void initProfileModule() {
  if (!GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.registerFactory<ProfileUseCase>(() => ProfileUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<EditColorProfileUseCase>()) {
    instance.registerFactory<EditColorProfileUseCase>(() => EditColorProfileUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<ProfileCubit>()) {
    instance.registerFactory<ProfileCubit>(() => ProfileCubit(instance(), instance()));
  }
}





resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initProfileModule();
}
