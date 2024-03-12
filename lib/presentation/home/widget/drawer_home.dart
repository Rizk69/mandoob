import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../app/di.dart';
import '../../../generated/locale_keys.g.dart';
import '../../login/manger/login_cubit.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../widget/default_snake_bar.dart';

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
                InkWell(
                    onTap: () {
                      // if (currentPage != "home") {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, Routes.homeRoute);
                      // }
                    },
                    child: rowDrawer(title: LocaleKeys.clients.tr(), icon: '')),
                const SizedBox(
                  height: AppSize.s7,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routes.trafficLines);
                  },
                  child:
                      rowDrawer(title: LocaleKeys.trafficLines.tr(), icon: ''),
                ),
                const SizedBox(
                  height: AppSize.s7,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, Routes.profileView);
                  },
                  child: rowDrawer(title: LocaleKeys.account.tr(), icon: ''),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll<Color>(
                          ColorManager.baseColorLight),
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
                )
              ],
            ),
          );
        },
      ));
}

Widget rowDrawer({required String title, required String icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        const SizedBox(
          width: AppSize.s12,
        ),
        const Icon(Icons.person_outline_sharp),
        const SizedBox(
          width: AppSize.s8,
        ),
        Text(
          title,
          style: getBoldSegoeStyle(
            color: ColorManager.black,
            fontSize: AppSize.s20.sp,
          ),
        )
      ],
    ),
  );
}
