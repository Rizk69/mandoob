import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/widget/sucss_screen.dart';
import 'package:mandoob/features/auth/presentation/login/view/login_view.dart';
import 'package:mandoob/features/auth/presentation/profile/presentation/profile_view.dart';
import 'package:mandoob/features/custody/presentation/el_eahduh_view.dart';
import 'package:mandoob/features/home/presentation/home_Controller.dart';
import 'package:mandoob/features/home/presentation/home_View.dart';
import 'package:mandoob/features/invoices/presentation/fawater/presentaion/Fawater_details.dart';
import 'package:mandoob/features/orders/presentation/el_salah/prsentation/el_mulakhas_view.dart';
import 'package:mandoob/features/orders/presentation/el_salah/prsentation/el_salah_view.dart';
import 'package:mandoob/features/orders/presentation/talabat/presentation/new_talab_view.dart';
import 'package:mandoob/features/trader/presentation/new_trader.dart';
import 'package:mandoob/features/trader/presentation/trader_view.dart';
import 'package:mandoob/features/trafiic_lines/presentation/traffic_lines/presentation/add_traffic_lines_screen.dart';
import 'package:mandoob/features/trafiic_lines/presentation/traffic_lines/presentation/traffic_lines_screen.dart';
import 'package:mandoob/generated/locale_keys.g.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
  static const String homeViewRoute = "/homeView";
  static const String elSalah = "/elsalah";
  static const String elHodaa = "/elHodaa";
  static const String elmulakhas = "/elmulakhas";
  static const String newTalab = "/newTalab";
  static const String sucssufflySceen = "/sucssufflySceen";
  static const String fawaterTagerDetails = "/fawaterTagerDetails";
  static const String trafficLines = "/trafficLines";
  static const String addtrafficLines = "/addtrafficLines";
  static const String profileView = "/profileView";

  static const String trader = "/trader";
  static const String newTrader = "/newtrader";
  static const String sucssufflyAddTrader = "/sucssufflyAddTrader";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.homeRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => HomeController());
      case Routes.homeViewRoute:
        initHomeModule();
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.elSalah:
        return MaterialPageRoute(builder: (_) => ElSalahView());
      case Routes.elmulakhas:
        return MaterialPageRoute(builder: (_) => ElMulakhas());
      case Routes.elHodaa:
        initEahduhModule();
        initTradeModule();
        return MaterialPageRoute(builder: (_) => ElEahduh());
      case Routes.newTalab:
        return MaterialPageRoute(builder: (_) => NewTalabat());
      case Routes.sucssufflySceen:
        return MaterialPageRoute(
            builder: (_) => SucssufflySceen(
                  title: 'تم الصرف بنجاح ',
                  textbutton: 'الفاتورة',
                ));
      case Routes.fawaterTagerDetails:
        return MaterialPageRoute(builder: (_) => FawaterTagerDetailsView());
      case Routes.trafficLines:
        initDelivaryLineModule();
        return MaterialPageRoute(builder: (_) => TrafficLines());

        case Routes.addtrafficLines:
        initDelivaryLineModule();
        initTradeModule();
        return MaterialPageRoute(builder: (_) => AddTrafficLines());
      case Routes.profileView:
        initProfileModule();
        return MaterialPageRoute(builder: (_) => ProfileView());

      case Routes.sucssufflyAddTrader:
        final args = settings.arguments as SuccessMessageArguments;

        return MaterialPageRoute(
            builder: (_) => SucssufflySceen(
                  title: args.message,
                  textbutton: args.actionMessage,
                ));

      case Routes.trader:
        initTradeModule();
        return MaterialPageRoute(builder: (_) => TraderView());

      case Routes.newTrader:
        return MaterialPageRoute(builder: (_) => NewTraderView());

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

  SuccessMessageArguments(this.message, this.actionMessage);
}
