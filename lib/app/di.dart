import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/auth/data/data_source/local_auth_data_source.dart';
import 'package:mandoob/features/custody/el_eahduh/data/data_source/eahduh_data_source.dart';
import 'package:mandoob/features/custody/el_eahduh/data/repository/repository_eahduh_impl.dart';
import 'package:mandoob/features/home/data/data_source/remote_home_data_source.dart';
import 'package:mandoob/features/home/data/network/home_api.dart';
import 'package:mandoob/features/home/data/repository/home_repository_impl.dart';
import 'package:mandoob/features/home/domain/repository/home_repository.dart';
import 'package:mandoob/features/home/domain/usecase/edit_price_usecases.dart';
import 'package:mandoob/features/home/domain/usecase/get_home_usecases.dart';
import 'package:mandoob/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:mandoob/features/trader/data/data_source/remote_trade_data_source.dart';
import 'package:mandoob/features/trader/data/network/trade_api.dart';
import 'package:mandoob/features/trader/domain/repository/trade_repository.dart';
import 'package:mandoob/features/trader/data/repository/trade_repository_impl.dart';
import 'package:mandoob/features/trader/domain/usecase/add_trade_usecase.dart';
import 'package:mandoob/features/trader/domain/usecase/get_trade_usecase.dart';
import 'package:mandoob/features/trader/presentation/cubit/add_trade/add_trade_cubit.dart';
import 'package:mandoob/features/trader/presentation/cubit/get_trade/trade_cubit.dart';
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
import '../features/custody/el_eahduh/data/network/eahduh_api.dart';
import '../features/custody/el_eahduh/domain/repository/eahduh_repository.dart';
import '../features/custody/el_eahduh/domain/usecase/eahduh_usecases.dart';
import '../features/custody/el_eahduh/presentation/cubit/eahduh_cubit.dart';
import '../features/trafiic_lines/domain/usecase/get_dlivary_usecase.dart';
import '../features/trafiic_lines/presentation/cubit/trafficlines_cubit.dart';

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

  instance.registerLazySingleton<TrafficLineServiceClient>(
      () => TrafficLineServiceClient(dio));
  instance.registerLazySingleton<EahduhServiceClient>(
      () => EahduhServiceClient(dio));
  instance
      .registerLazySingleton<TradeServiceClient>(() => TradeServiceClient(dio));
  instance
      .registerLazySingleton<AuthServiceClient>(() => AuthServiceClient(dio));

  instance
      .registerLazySingleton<HomeServiceClient>(() => HomeServiceClient(dio));

  // Local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // remote data source
  instance.registerLazySingleton<RemoteTrafficLineDataSource>(
      () => RemoteTrafficLinesDataSourceImpl(instance()));
  instance.registerLazySingleton<RemoteEahduhDataSource>(
      () => RemoteEahduhDataSourceImpl(instance()));

  instance.registerLazySingleton<RemoteAuthDataSource>(
      () => RemoteAuthDataSourceImpl(instance()));

  instance.registerLazySingleton<RemoteTradeDataSource>(
      () => RemoteTradeDataSourceImpl(instance()));

  instance.registerLazySingleton<RemoteHomeDataSource>(
      () => RemoteHomeDataSourceImpl(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryTrafficLineImpl(instance(), instance()));


  instance.registerLazySingleton<TradeRepository>(
      () => TradeRepositoryImpl(instance(), instance()));

  instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(instance(), instance(), instance()));

  instance.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(instance(), instance()));


  instance.registerLazySingleton<EahduhRepository>(
      () => RepositoryEahduhImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  }
}

initProfileModule() {
  if (!GetIt.I.isRegistered<ProfileUseCase>()) {
    instance.registerFactory<ProfileCubit>(
        () => ProfileCubit(instance(), instance()));
    instance.registerFactory<ProfileUseCase>(() => ProfileUseCase(instance()));
    instance.registerFactory<ProfileEditColorUseCase>(
        () => ProfileEditColorUseCase(instance()));
  }
}

initTradeModule() {
  if (!GetIt.I.isRegistered<TradesUseCase>()) {
    instance.registerFactory<TradeCubit>(() => TradeCubit(instance()));
    instance.registerFactory<TradesUseCase>(() => TradesUseCase(instance()));
    instance
        .registerFactory<AddTradesUseCase>(() => AddTradesUseCase(instance()));
    instance.registerFactory<AddTradeCubit>(() => AddTradeCubit(instance()));
  }
}

initHomeModule() {
  if (!GetIt.I.isRegistered<GetHomeUseCase>()) {
    instance
        .registerFactory<HomeCubit>(() => HomeCubit(instance(), instance()));
    instance.registerFactory<GetHomeUseCase>(() => GetHomeUseCase(instance()));
    instance
        .registerFactory<EditPriceUseCase>(() => EditPriceUseCase(instance()));
  }
}

initDelivaryLineModule() {
  if (!GetIt.I.isRegistered<DelivaryLineUseCase>()) {
    instance.registerFactory<TrafficLinesCubit>(
        () => TrafficLinesCubit(instance()));
    instance.registerFactory<DelivaryLineUseCase>(
        () => DelivaryLineUseCase(instance()));
  }
}

initEahduhModule() {
  if (!GetIt.I.isRegistered<EahduhUseCase>()) {
    instance.registerFactory<EahduhCubit>(() => EahduhCubit(instance()));
    instance.registerFactory<EahduhUseCase>(() => EahduhUseCase(instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initProfileModule();
  initTradeModule();
  initHomeModule();
  initDelivaryLineModule();
  initEahduhModule();
}
