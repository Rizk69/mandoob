import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/presentation/home/presentation/home_View.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
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
              return const Center(
                child: Text('الطلبيات'),
              );
            case BottomNavBarItem.bugs:
              return const Center(
                child: Text('السلة'),
              );
            case BottomNavBarItem.fawater:
              return const Center(
                child: Text('الفواتير'),
              );
            default:
              return Container();
          }
        },
      ),
      floatingActionButton: Container(
        width: AppSize.s80,
        height: AppSize.s80,
        margin: const EdgeInsets.all(7),
        child: FloatingActionButton(
          backgroundColor: Color(0XFF969FEE),
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          child: SvgPicture.asset(
            'assets/images/botomnavg/shopfloat.svg',
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
              img: 'assets/images/botomnavg/daftar.svg',
              title: 'الفواتير',
              function: () {
                context
                    .read<BottomNavBarCubit>()
                    .selectItem(BottomNavBarItem.fawater);
              },
            ),
            buttomNavBar(
              context: context,
              img: 'assets/images/botomnavg/bag.svg',
              title: "السلة",
              function: () {
                context
                    .read<BottomNavBarCubit>()
                    .selectItem(BottomNavBarItem.bugs);
              },
            ),
            SizedBox(
              width: AppSize.s15,
            ),
            buttomNavBar(
              context: context,
              img: 'assets/images/botomnavg/bencel.svg',
              title: 'الطلبيات',
              function: () {
                context
                    .read<BottomNavBarCubit>()
                    .selectItem(BottomNavBarItem.talabat);
              },
            ),
            buttomNavBar(
              context: context,
              img: 'assets/images/botomnavg/shop.svg',
              title: 'العهد',
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
            height: AppSize.s5,
          ),
          Text(title,), // Label for the icon
        ],
      ),
    );
  }
}
