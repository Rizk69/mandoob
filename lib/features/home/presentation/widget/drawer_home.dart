import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/features/auth/presentation/login/manger/login_cubit.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

BlocProvider<dynamic> buildDrawer(BuildContext context) {
  return BlocProvider<LoginCubit>(
    create: (_) => instance<LoginCubit>(),
    child: BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LogoutSuccessState) {
          final snackBar = defaultSnakeBar(
            title: LocaleKeys.SUCCESS.tr(),
            message: LocaleKeys.SUCCESS.tr(),
            state: ContentType.success,
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);

          Navigator.pushReplacementNamed(context, Routes.loginRoute);
        }
      },
      builder: (BuildContext context, LoginState state) {
        return Drawer(
          width: MediaQuery.of(context).size.width / 2.2,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: AppSize.s12.h,
              ),
              drawerItem(
                context: context,
                title: LocaleKeys.clients.tr(),
                icon: 'assets/images/drower/person.png',
                routeName: Routes.trader,
              ),
              const SizedBox(height: AppSize.s7),
              drawerItem(
                context: context,
                title: LocaleKeys.trafficLines.tr(),
                icon: 'assets/images/drower/trafficlines.png',
                routeName: Routes.trafficLines,
              ),
              const SizedBox(height: AppSize.s7),
              drawerItem(
                context: context,
                title: LocaleKeys.expenses.tr(),
                icon: 'assets/images/drower/expenses.png',
                routeName: Routes.expenses,
              ),
              const SizedBox(height: AppSize.s7),
              drawerItem(
                context: context,
                title: LocaleKeys.account.tr(),
                icon: 'assets/images/drower/account.png',
                routeName: Routes.profileView,
              ),
              const SizedBox(height: AppSize.s7),
              drawerItem(
                context: context,
                title: LocaleKeys.debts.tr(),
                icon: 'assets/images/drower/deyon.png',
                routeName: Routes.debts,
              ),
              const SizedBox(height: AppSize.s7),
              drawerItem(
                context: context,
                title: LocaleKeys.addPurchases.tr(),
                icon: 'assets/images/drower/addcashproduct.png',
                routeName: Routes.payingDebts,
              ),
              const SizedBox(height: AppSize.s7),
              drawerItem(
                context: context,
                title: LocaleKeys.notification.tr(),
                icon: 'assets/images/drower/notification.png',
                routeName: Routes.notification,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(ColorManager.baseColorLight),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s40),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.read<LoginCubit>().logout(context);
                  },
                  child: Text(
                    LocaleKeys.logout.tr(),
                    style: getBoldSegoeStyle(
                      color: ColorManager.black,
                      fontSize: AppSize.s20.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    ),
  );
}

Widget drawerItem({
  required BuildContext context,
  required String title,
  required String icon,
  required String routeName,
}) {
  return InkWell(
    onTap: () {
      Navigator.pushNamedAndRemoveUntil(context, routeName, (Route<dynamic> route) => false);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          const SizedBox(width: AppSize.s12),
          Image.asset(icon, color: Theme.of(context).primaryColor),
          const SizedBox(width: AppSize.s8),
          Text(
            title,
            style: getBoldSegoeStyle(
              color: Theme.of(context).primaryColor,
              fontSize: AppSize.s20.sp,
            ),
          )
        ],
      ),
    ),
  );
}
