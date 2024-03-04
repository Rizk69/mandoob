import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/presentation/el_salah/prsentation/el_mulakhas_view.dart';
import 'package:mandoob/presentation/el_salah/prsentation/el_salah_view.dart';
import 'package:mandoob/presentation/home/presentation/home_Controller.dart';
import 'package:mandoob/presentation/home/presentation/home_View.dart';
import 'package:mandoob/presentation/login/view/login_view.dart';
import 'package:mandoob/presentation/traffic_lines/presentation/traffic_lines_screen.dart';

import '../../utiles_app/sucss_screen.dart';
import '../el_eahduh/presentation/el_eahduh_view.dart';
import '../fawater/presentaion/Fawater_details.dart';
import '../talabat/presentation/new_talab_view.dart';

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
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => LoginView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => HomeController());
      case Routes.homeViewRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case Routes.elSalah:
        return MaterialPageRoute(builder: (_) => ElSalahView());
        case Routes.elmulakhas:
        return MaterialPageRoute(builder: (_) => ElMulakhas());
      case Routes.elHodaa:
        return MaterialPageRoute(builder: (_) => ElEahduh());
      case Routes.newTalab:
        return MaterialPageRoute(builder: (_) => NewTalabat());
        case Routes.sucssufflySceen:
        return MaterialPageRoute(builder: (_) => SucssufflySceen());
        case Routes.fawaterTagerDetails:
        return MaterialPageRoute(builder: (_) => FawaterTagerDetailsView());
        case Routes.trafficLines:
        return MaterialPageRoute(builder: (_) => TrafficLines());
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
