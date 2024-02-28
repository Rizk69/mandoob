import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/presentation/home/presentation/home_Controller.dart';
import 'package:mandoob/presentation/login/view/login_view.dart';

class Routes {
  static const String loginRoute = "/login";
  static const String homeRoute = "/home";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) =>  LoginView());

        case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) =>  HomeController());
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
