import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/widget/sucss_screen.dart';
import 'package:mandoob/features/auth/presentation/login/view/login_view.dart';
import 'package:mandoob/features/auth/presentation/profile/presentation/profile_view.dart';
import 'package:mandoob/features/custody/presentation/el_eahduh/el_eahduh_view.dart';
import 'package:mandoob/features/custody/presentation/el_salah/prsentation/el_mulakhas_view.dart';
import 'package:mandoob/features/custody/presentation/el_salah/prsentation/el_salah_view.dart';
import 'package:mandoob/features/debts/domain/model/debt_trader_model.dart';
import 'package:mandoob/features/debts/presentation/debts/presentation/debt_repayment.dart';
import 'package:mandoob/features/debts/presentation/debts/presentation/debts_paying.dart';
import 'package:mandoob/features/debts/presentation/debts/presentation/debts_view.dart';
import 'package:mandoob/features/expenses/presentaton/add_expenses_view.dart';
import 'package:mandoob/features/home/presentation/home_Controller.dart';
import 'package:mandoob/features/home/presentation/home_View.dart';
import 'package:mandoob/features/invoices/presentation/fawater/presentaion/Fawater_details.dart';
import 'package:mandoob/features/notification/presentation/notification.dart';
import 'package:mandoob/features/orders/presentation/talabat/presentation/new_talab_view.dart';
import 'package:mandoob/features/orders/presentation/talabat/presentation/talabat_old_details.dart';
import 'package:mandoob/features/splash_screen/Splash_View.dart';
import 'package:mandoob/features/trader/presentation/new_trader.dart';
import 'package:mandoob/features/trader/presentation/trader_view.dart';
import 'package:mandoob/features/trafiic_lines/presentation/traffic_lines/presentation/add_traffic_lines_screen.dart';
import 'package:mandoob/features/trafiic_lines/presentation/traffic_lines/presentation/traffic_lines_screen.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

import '../../features/debts/presentation/debts/presentation/add_debts_paying.dart';
import '../../features/expenses/presentaton/expenses_view.dart';
import '../../features/orders/presentation/talabat/presentation/talabat_peresent_edit.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String splashRoute = "/splashRoute";
  static const String homeRoute = "/home";
  static const String homeViewRoute = "/homeView";
  static const String elSalah = "/elsalah";
  static const String elHodaa = "/elHodaa";
  static const String elmulakhas = "/elmulakhas";
  static const String newTalab = "/newTalab";
  static const String sucssufflySceen = "/sucssufflySceen";
  static const String fawaterTagerDetails = "/fawaterTagerDetails";
  static const String fawaterMandobDetailsView = "/fawaterMandobDetailsView";
  static const String trafficLines = "/trafficLines";
  static const String expenses = "/expenses";
  static const String debts = "/debts";
  static const String payingDebts = "/payingDebts";
  static const String addPayingDebts = "/addPayingDebts";
  static const String debtRepayment = "/debtRepayment";
  static const String notification = "/notification";
  static const String addtrafficLines = "/addtrafficLines";
  static const String profileView = "/profileView";
  static const String talabatOldDetails = "/talabatOldDetails";
  static const String talabatPresentEdit = "/talabatPresentEdit";

  static const String trader = "/trader";
  static const String newTrader = "/newtrader";
  static const String addExpenses = "/addExpenses";
  static const String sucssufflyAddTrader = "/sucssufflyAddTrader";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.homeRoute:
        initHomeModule();
        initTalabatModule();
        initFawaterModule();
        initExpensesModule();
        return MaterialPageRoute(builder: (_) => const HomeController());
      case Routes.homeViewRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.elSalah:
        return MaterialPageRoute(builder: (_) => ElSalahView());

      case Routes.talabatOldDetails:
        final args = settings.arguments as OrderArguments;

        return MaterialPageRoute(
            builder: (_) => TalabatOldDetails(
                  orderId: args.orderId,
                ));

      case Routes.talabatPresentEdit:
        final args = settings.arguments as OrderArguments;

        return MaterialPageRoute(
            builder: (_) => TalabatPresentEdit(
                  orderId: args.orderId,
                ));
      case Routes.elmulakhas:
        return MaterialPageRoute(builder: (_) => ElMulakhas());
      case Routes.elHodaa:
        initEahduhModule();
        initTradeModule();
        return MaterialPageRoute(builder: (_) => ElEahduh());
      case Routes.newTalab:
        return MaterialPageRoute(builder: (_) => const NewTalabat());
      case Routes.sucssufflySceen:
        return MaterialPageRoute(
            builder: (_) => SucssufflySceen(
                  id: -1,
                  title: 'تم الصرف بنجاح ',
                  textbutton: 'الفاتورة',
                ));
      case Routes.fawaterTagerDetails:
        final args = settings.arguments as int;
        return MaterialPageRoute(
            builder: (_) => FawaterTagerDetailsView(
                  id: args,
                ));
      case Routes.fawaterMandobDetailsView:
        return MaterialPageRoute(builder: (_) => FawaterMandobDetailsView());
      case Routes.trafficLines:
        initDelivaryLineModule();
        return MaterialPageRoute(builder: (_) => TrafficLines());
      case Routes.expenses:
        initExpensesModule();
        return MaterialPageRoute(builder: (_) => ExpensesScreen());
      case Routes.debts:
        initDebtModule();
        return MaterialPageRoute(builder: (_) => DebtsView());
      case Routes.payingDebts:
        initDebtModule();
        return MaterialPageRoute(builder: (_) => PayingDebts());
      case Routes.addPayingDebts:
        return MaterialPageRoute(builder: (_) => AddPayingDebts());
      case Routes.debtRepayment:
        final args = settings.arguments as DebtDetail;

        return MaterialPageRoute(
            builder: (_) => DebtRepayment(
                  debtDetail: args,
                ));
      case Routes.notification:
        initNotificationModule();
        return MaterialPageRoute(builder: (_) => NotificationScreen());

      case Routes.addtrafficLines:
        initDelivaryLineModule();
        initTradeModule();
        return MaterialPageRoute(builder: (_) => AddTrafficLines());
      case Routes.profileView:
        initProfileModule();
        return MaterialPageRoute(builder: (_) => const ProfileView());

      case Routes.sucssufflyAddTrader:
        final args = settings.arguments as SuccessMessageArguments;

        return MaterialPageRoute(
            builder: (_) => SucssufflySceen(
                  id: args.idInvoice,
                  title: args.message,
                  textbutton: args.actionMessage,
                ));

      case Routes.trader:
        initTradeModule();
        return MaterialPageRoute(builder: (_) => TraderView());

      case Routes.newTrader:
        return MaterialPageRoute(builder: (_) => const NewTraderView());
      case Routes.addExpenses:
        initExpensesModule();
        return MaterialPageRoute(builder: (_) => AddExpensesView());

      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(LocaleKeys.noRouteFound.tr()),
              ),
              body: Center(child: Text(LocaleKeys.noRouteFound.tr())),
            ));
  }
}

class SuccessMessageArguments {
  final String message;
  final String actionMessage;
  final int idInvoice;

  SuccessMessageArguments(this.message, this.actionMessage, this.idInvoice);
}

class OrderArguments {
  final int orderId;

  OrderArguments(this.orderId);
}
