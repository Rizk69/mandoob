import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/presentation/home/presentation/home_View.dart';
import 'package:mandoob/presentation/resources/assets_manager.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/presentation/resources/styles_manager.dart';
import 'package:mandoob/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../cubit/bottomNavBar_cubit/bottom_nav_bar_cubit.dart';

class HomeController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarItem>(
        builder: (context, selectedItem) {
          switch (selectedItem) {
            case BottomNavBarItem.home:
              return const HomeView();
            case BottomNavBarItem.talabat:
              return Center(
                child: Text(LocaleKeys.orders.tr()),
              );
            case BottomNavBarItem.bugs:
              return Center(
                child: Text(LocaleKeys.cart.tr()),
              );
            case BottomNavBarItem.fawater:
              return Center(
                child: Text(LocaleKeys.invoices.tr()),
              );
            default:
              return Container();
          }
        },
      ),
      floatingActionButton: Container(
        width: AppSize.s80,
        height: AppSize.s80,
        margin: EdgeInsets.all(AppMargin.m3.pt),
        child: FloatingActionButton(
          backgroundColor: ColorManager.baseColorLight,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s50),
          ),
          child: SvgPicture.asset(
            IconAssets.shopfloatIcon,
            color: Colors.white,
            fit: BoxFit.contain,
            height: AppSize.s30,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: AppPadding.p14.h,
        surfaceTintColor: ColorManager.white,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        notchMargin: 3,
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            buttomNavBar(
              context: context,
              img: IconAssets.dafterIcon,
              title: LocaleKeys.invoices.tr(),
              function: () {
                context
                    .read<BottomNavBarCubit>()
                    .selectItem(BottomNavBarItem.fawater);
              },
            ),
            buttomNavBar(
              context: context,
              img: IconAssets.bagIcon,
              title: LocaleKeys.cart.tr(),
              function: () {
                context
                    .read<BottomNavBarCubit>()
                    .selectItem(BottomNavBarItem.bugs);
              },
            ),
            SizedBox(
              width: AppSize.s10.w,
            ),
            buttomNavBar(
              context: context,
              img: IconAssets.bencelIcon,
              title: LocaleKeys.orders.tr(),
              function: () {
                context
                    .read<BottomNavBarCubit>()
                    .selectItem(BottomNavBarItem.talabat);
              },
            ),
            buttomNavBar(
              context: context,
              img: IconAssets.shopIcon,
              title: LocaleKeys.home.tr(),
              function: () {
                context
                    .read<BottomNavBarCubit>()
                    .selectItem(BottomNavBarItem.home);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget buttomNavBar(
      {required BuildContext context,
      required String img,
      required String title,
      required Function function}) {
    return InkWell(
      onTap: () {
        function();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(img),
          SizedBox(
            height: AppSize.s1.h,
          ),
          Text(
            title,
            style: getSemiBoldInterStyle(color: ColorManager.baseColorLight),
          ), // Label for the icon
        ],
      ),
    );
  }
}
