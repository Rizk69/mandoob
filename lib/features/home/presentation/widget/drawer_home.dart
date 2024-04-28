import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/app_prefs.dart';
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
  AppPreferences _appPreferences = instance<AppPreferences>();

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
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Routes.trader);
                    },
                    child: rowDrawer(
                        title: LocaleKeys.clients.tr(),
                        icon: 'assets/images/drower/person.png',
                        context: context)),
                const SizedBox(
                  height: AppSize.s7,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routes.trafficLines);
                  },
                  child: rowDrawer(
                      title: LocaleKeys.trafficLines.tr(),
                      icon: 'assets/images/drower/trafficlines.png',
                      context: context),
                ),
                const SizedBox(
                  height: AppSize.s7,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routes.expenses);
                  },
                  child: rowDrawer(
                      title: LocaleKeys.expenses.tr(),
                      icon: 'assets/images/drower/expenses.png',
                      context: context),
                ),
                const SizedBox(
                  height: AppSize.s7,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routes.profileView);
                  },
                  child: rowDrawer(
                      title: LocaleKeys.account.tr(),
                      icon: 'assets/images/drower/account .png',
                      context: context),
                ),
                const SizedBox(
                  height: AppSize.s7,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routes.debts);
                  },
                  child: rowDrawer(
                      title: LocaleKeys.debts.tr(),
                      icon: 'assets/images/drower/deyon.png',
                      context: context),
                ),
                const SizedBox(
                  height: AppSize.s7,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routes.purchase);
                  },
                  child: rowDrawer(
                      title: LocaleKeys.addPurchases.tr(),
                      icon: 'assets/images/drower/addcashproduct.png',
                      context: context),
                ),
                const SizedBox(
                  height: AppSize.s7,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routes.notification);
                  },
                  child: rowDrawer(
                      title: LocaleKeys.notification.tr(),
                      icon: 'assets/images/drower/notification.png',
                      context: context),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 8,
                ),
              FutureBuilder<String>(

                future: _appPreferences.getPrimaryColor(),
                builder: (BuildContext context, AsyncSnapshot<String> snapshot) {

                  Color buttonColor = Theme.of(context).hoverColor; // Default color
                  if (snapshot.hasData) {
                    String colorValue = snapshot.data!;
                    if (colorValue.startsWith('#')) {
                      colorValue = '0xff' + colorValue.substring(1);
                    }
                    try {
                      buttonColor = Color(int.parse(colorValue));
                    } catch (e) {
                      print('Error parsing color: $e');
                    }
                  }
                  return  Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          buttonColor),
                      shape: MaterialStatePropertyAll<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              AppSize.s40), // Adjust the radius as needed
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
                );},
              )
              ],
            ),
          );
        },
      ));
}

Widget rowDrawer(
    {required String title,
    required String icon,
    required BuildContext context}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        const SizedBox(
          width: AppSize.s12,
        ),
        Image.asset(
          icon,
          color: Theme.of(context).primaryColor,
        ),
        const SizedBox(
          width: AppSize.s8,
        ),
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            style: getBoldSegoeStyle(
              color: Theme.of(context).primaryColor,
              fontSize: AppSize.s20.sp,
            ),
          ),
        )
      ],
    ),
  );
}
