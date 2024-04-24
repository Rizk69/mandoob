import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/features/custody/presentation/el_eahduh/el_eahduh_view.dart';
import 'package:mandoob/features/home/presentation/cubit/bottomNavBar_cubit/bottom_nav_bar_cubit.dart';
import 'package:mandoob/features/home/presentation/home_View.dart';
import 'package:mandoob/features/invoices/presentation/fawater/presentaion/Fawater_view.dart';
import 'package:mandoob/features/orders/presentation/talabat/presentation/talabat_view.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeController extends StatelessWidget {
  const HomeController({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<BottomNavBarCubit, BottomNavBarItem>(
        builder: (context, selectedItem) {
          switch (selectedItem) {
            case BottomNavBarItem.home:
              return HomeView();
            case BottomNavBarItem.talabat:
              return const TalabatView();
            case BottomNavBarItem.bugs:
              return  ElEahduh();
            case BottomNavBarItem.fawater:
              return FawaterView();
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
          isExtended: true,
          backgroundColor: Theme.of(context).hoverColor,
          onPressed: () {
            Navigator.pushNamed(context, Routes.elSalah);
            // Navigator.pushNamed(context, Routes.elHodaa);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s50),
          ),
          child: SvgPicture.asset(
            IconAssets.bagIcon,
            color: Colors.white,
            fit: BoxFit.contain,
            height: AppSize.s30,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        height: AppPadding.p14.h,
        color: Theme.of(context).primaryColorDark,
        surfaceTintColor: Theme.of(context).primaryColorDark,
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
              img: IconAssets.shopfloatIcon,
              title: LocaleKeys.elaohda.tr(),
              function: () {
                // Navigator.pushNamed(context, Routes.elHodaa);

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
          SvgPicture.asset(
            img,
            color: Theme.of(context).hoverColor,
          ),
          SizedBox(
            height: AppSize.s1.h,
          ),
          Text(
            title,
            style: getSemiBoldInterStyle(color: Theme.of(context).hoverColor),
          ), // Label for the icon
        ],
      ),
    );
  }
}
