import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mandoob/app/app_prefs.dart';
import 'package:mandoob/core/netowork_core/network_info.dart';
import 'package:mandoob/features/auth/data/data_source/local_auth_data_source.dart';
import 'package:mandoob/features/custody/data/data_source/eahduh_data_source.dart';
import 'package:mandoob/features/custody/data/network/eahduh_api.dart';
import 'package:mandoob/features/custody/data/repository/repository_eahduh_impl.dart';
import 'package:mandoob/features/custody/domain/repository/eahduh_repository.dart';
import 'package:mandoob/features/custody/domain/usecase/add_currency_and_count_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/add_to_cart_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/confirm_invoice_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/delete_all_product_in_cart_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/delete_product_in_cart_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/eahduh_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/get_cart_usecases.dart';
import 'package:mandoob/features/custody/domain/usecase/pay_partial_dept_usecases.dart';
import 'package:mandoob/features/custody/presentation/cubit/el_eahduh/eahduh_cubit.dart';
import 'package:mandoob/features/custody/presentation/cubit/el_salah/el_salah_cubit.dart';
import 'package:mandoob/features/expenses/data/data_source/remote_expenses_data_source.dart';
import 'package:mandoob/features/expenses/data/network/expenses_api.dart';
import 'package:mandoob/features/expenses/data/repository/expenses_repository_impl.dart';
import 'package:mandoob/features/expenses/domain/repository/expenses_repository.dart';
import 'package:mandoob/features/expenses/domain/usecase/get_reason_expenses_usecases.dart';
import 'package:mandoob/features/expenses/presentaton/cubit/expenses_cubit.dart';
import 'package:mandoob/features/home/data/data_source/remote_home_data_source.dart';
import 'package:mandoob/features/home/data/network/home_api.dart';
import 'package:mandoob/features/home/data/repository/home_repository_impl.dart';
import 'package:mandoob/features/home/domain/repository/home_repository.dart';
import 'package:mandoob/features/home/domain/usecase/edit_price_usecases.dart';
import 'package:mandoob/features/home/domain/usecase/get_home_usecases.dart';
import 'package:mandoob/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:mandoob/features/invoices/data/data_source/remote_invoices_data_source.dart';
import 'package:mandoob/features/invoices/data/network/fawater_api.dart';
import 'package:mandoob/features/invoices/data/repository/invoice_repository_impl.dart';
import 'package:mandoob/features/invoices/domain/repository/invoices_repository.dart';
import 'package:mandoob/features/invoices/domain/usecase/invoices_usecases.dart';
import 'package:mandoob/features/invoices/presentation/fawater/cubit/fawater_cubit.dart';
import 'package:mandoob/features/orders/data/data_source/remote_talabat_data_source.dart';
import 'package:mandoob/features/orders/domain/usecase/order_usecases.dart';
import 'package:mandoob/features/orders/domain/usecase/talabat_usecases.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/order_cubit/order_cubit.dart';
import 'package:mandoob/features/trader/data/data_source/remote_trade_data_source.dart';
import 'package:mandoob/features/trader/data/network/trade_api.dart';
import 'package:mandoob/features/trader/domain/repository/trade_repository.dart';
import 'package:mandoob/features/trader/data/repository/trade_repository_impl.dart';
import 'package:mandoob/features/trader/domain/usecase/active_trade_usecase.dart';
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
import 'package:mandoob/features/trafiic_lines/domain/usecase/add_dlivary_usecase.dart';
import 'package:mandoob/features/trafiic_lines/domain/usecase/delete_dlivary_usecase.dart';
import 'package:mandoob/features/trafiic_lines/domain/usecase/search_dlivary_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../features/orders/data/network/talabat_api.dart';
import '../features/orders/data/repository/talabat_repository_impl.dart';
import '../features/orders/domain/repository/talabat_repository.dart';
import '../features/orders/presentation/talabat/cubit/add_order_cubit/new_talabat_cubit.dart';
import '../features/orders/presentation/talabat/cubit/talabat_cubit/talabat_cubit.dart';
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
  instance.registerLazySingleton<FawaterServiceClient>(
      () => FawaterServiceClient(dio));

  instance
      .registerLazySingleton<HomeServiceClient>(() => HomeServiceClient(dio));
  instance.registerLazySingleton<TalabatServiceClient>(
      () => TalabatServiceClient(dio));

  instance.registerLazySingleton<ExpensesServiceClient>(
      () => ExpensesServiceClient(dio));

  // Local data source
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  // remote data source
  instance.registerLazySingleton<RemoteTrafficLineDataSource>(
      () => RemoteTrafficLinesDataSourceImpl(instance()));
  instance.registerLazySingleton<RemoteEahduhDataSource>(
      () => RemoteEahduhDataSourceImpl(instance()));

  instance.registerLazySingleton<RemoteAuthDataSource>(
      () => RemoteAuthDataSourceImpl(instance()));
  instance.registerLazySingleton<RemoteTalabatSource>(
      () => TalabatSourceImpl(instance()));
  instance.registerLazySingleton<RemoteInvoicesSource>(
      () => InvoicesSourceImpl(instance()));

  instance.registerLazySingleton<RemoteTradeDataSource>(
      () => RemoteTradeDataSourceImpl(instance()));

  instance.registerLazySingleton<RemoteHomeDataSource>(
      () => RemoteHomeDataSourceImpl(instance()));

  instance.registerLazySingleton<RemoteExpensesDataSource>(
      () => RemoteExpensesDataSourceImpl(instance()));

  // repository
  instance.registerLazySingleton<Repository>(
      () => RepositoryTrafficLineImpl(instance(), instance()));

  instance.registerLazySingleton<TradeRepository>(
      () => TradeRepositoryImpl(instance(), instance()));

  instance.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(instance(), instance(), instance()));

  instance.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<TalabatRepository>(
      () => TalabatRepositoryImpl(instance(), instance()));
  instance.registerLazySingleton<InvoicesRepository>(
      () => InvoicesRepositoryImpl(instance(), instance()));

  instance.registerLazySingleton<EahduhRepository>(
      () => RepositoryEahduhImpl(instance(), instance()));

  instance.registerLazySingleton<ExpensesRepository>(
      () => ExpensesRepositoryImpl(instance(), instance()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginCubit>(() => LoginCubit(instance()));
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
  }
}

void initProfileModule() {
  if (!GetIt.I.isRegistered<ProfileCubit>()) {
    instance.registerLazySingleton<ProfileUseCase>(
        () => ProfileUseCase(instance()));

    instance.registerLazySingleton<ProfileEditColorUseCase>(
        () => ProfileEditColorUseCase(instance()));

    instance.registerFactory<ProfileCubit>(
        () => ProfileCubit(instance(), instance()));
  }
}

initTradeModule() {
  if (!GetIt.I.isRegistered<GetTradesUseCase>()) {
    instance
        .registerFactory<TradeCubit>(() => TradeCubit(instance(), instance()));
    instance
        .registerFactory<GetTradesUseCase>(() => GetTradesUseCase(instance()));
    instance.registerFactory<ActiveTradesUseCase>(
        () => ActiveTradesUseCase(instance()));
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

initTalabatModule() {
  if (!instance.isRegistered<GetPresentTalabatUseCase>()) {
    instance.registerFactory<TalabatViewCubit>(
        () => TalabatViewCubit(instance(), instance()));
    instance.registerFactory<GetPresentTalabatUseCase>(
        () => GetPresentTalabatUseCase(instance()));
    instance.registerFactory<GetOldTalabatUseCase>(
        () => GetOldTalabatUseCase(instance()));
    instance.registerFactory<AddTalabatUseCase>(
        () => AddTalabatUseCase(instance()));
  }

  if (!instance.isRegistered<GetCompanyProductsUseCase>()) {
    instance.registerFactory<NewTalabatCubit>(
        () => NewTalabatCubit(instance(), instance()));
    instance.registerFactory<GetCompanyProductsUseCase>(
        () => GetCompanyProductsUseCase(instance()));
  }

  if (!instance.isRegistered<GetOrderDetailsUseCase>()) {
    instance.registerFactory<GetOrderDetailsUseCase>(
        () => GetOrderDetailsUseCase(instance()));
    instance.registerFactory<DecreaseOrderUseCase>(
        () => DecreaseOrderUseCase(instance()));
    instance.registerFactory<IncreaseOrderUseCase>(
        () => IncreaseOrderUseCase(instance()));
    instance.registerFactory<DeleteOrderUseCase>(
        () => DeleteOrderUseCase(instance()));

    instance.registerFactory<OrderCubit>(
        () => OrderCubit(instance(), instance(), instance(), instance()));
  }
}

initFawaterModule() {
  if (!instance.isRegistered<GetInvoicesTraderInvoiceUseCase>()) {
    instance.registerFactory<FawaterViewCubit>(
        () => FawaterViewCubit(instance(), instance(), instance(), instance()));
    instance.registerFactory<GetInvoicesTraderInvoiceUseCase>(
        () => GetInvoicesTraderInvoiceUseCase(instance()));
    instance.registerFactory<GetInvoicesSupplierInvoiceUseCase>(
        () => GetInvoicesSupplierInvoiceUseCase(instance()));
    instance.registerFactory<GetTraderInvoiceDetailsUseCase>(
        () => GetTraderInvoiceDetailsUseCase(instance()));
    instance.registerFactory<GetSupplierInvoiceDetailsUseCase>(
        () => GetSupplierInvoiceDetailsUseCase(instance()));
  }
}

initDelivaryLineModule() {
  if (!GetIt.I.isRegistered<DelivaryLineUseCase>()) {
    instance.registerFactory<TrafficLinesCubit>(() =>
        TrafficLinesCubit(instance(), instance(), instance(), instance()));
    instance.registerFactory<DelivaryLineUseCase>(
        () => DelivaryLineUseCase(instance()));

    instance.registerFactory<DeleteDeliveryLineUseCase>(
        () => DeleteDeliveryLineUseCase(instance()));

    instance.registerFactory<AddDeliveryLineUseCase>(
        () => AddDeliveryLineUseCase(instance()));

    instance.registerFactory<SearchDeliveryLineUseCase>(
        () => SearchDeliveryLineUseCase(instance()));
  }
}

initEahduhModule() {
  if (!GetIt.I.isRegistered<EahduhUseCase>()) {
    instance.registerFactory<ElSalahCubit>(() => ElSalahCubit(instance(),
        instance(), instance(), instance(), instance(), instance()));
    instance.registerFactory<GetCartUseCase>(() => GetCartUseCase(instance()));

    instance.registerFactory<PayPartialDeptUseCase>(
        () => PayPartialDeptUseCase(instance()));

    instance.registerFactory<EahduhCubit>(
        () => EahduhCubit(instance(), instance()));
    instance.registerFactory<EahduhUseCase>(() => EahduhUseCase(instance()));

    instance.registerFactory<ConfirmInvoiceUseCase>(
        () => ConfirmInvoiceUseCase(instance()));
    instance.registerFactory<AddCurrencyAndCountUseCase>(
        () => AddCurrencyAndCountUseCase(instance()));

    instance.registerFactory<AddProductToCartUseCase>(
        () => AddProductToCartUseCase(instance()));
    instance.registerFactory<DeleteCartUseCase>(
        () => DeleteCartUseCase(instance()));
    instance.registerFactory<DeleteProductInCartUseCase>(
        () => DeleteProductInCartUseCase(instance()));
  }
}

void initExpensesModule() {
  if (!GetIt.I.isRegistered<GetExpensesReasonsUseCase>()) {
    instance.registerLazySingleton<GetExpensesReasonsUseCase>(
        () => GetExpensesReasonsUseCase(instance()));
    instance.registerLazySingleton<AddGetExpensesReasonsUseCase>(
        () => AddGetExpensesReasonsUseCase(instance()));

    instance.registerLazySingleton<ExpensesCubit>(
        () => ExpensesCubit(instance(), instance()));
  }
}

resetModules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initTalabatModule();
  initFawaterModule();
  initProfileModule();
  initTradeModule();
  initHomeModule();
  initDelivaryLineModule();
  initEahduhModule();
  initExpensesModule();
}
