import 'package:flutter/material.dart';
import 'package:mandoob/presentation/home/widget/drawer_home.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/presentation/resources/styles_manager.dart';
import 'package:mandoob/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.transparent,
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: AppSize.s8.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                  Center(
                    child: Text(
                      'الصفحة الرئيسية',
                      style: getBoldSegoeStyle(
                          fontSize: 25, color: ColorManager.black),
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Icon(
                        Icons.next_plan_outlined,
                        size: 35,
                      ),
                      Text(
                        'صرف منتجات',
                        style: getBoldSegoeStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s20.sp,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: AppSize.s15,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: ColorManager.shadowColor,
                          blurRadius: 9,
                          spreadRadius: 8)
                    ]),
                child: Column(
                  children: [],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                          color: ColorManager.shadowColor,
                          blurRadius: 9,
                          spreadRadius: 8)
                    ]),
                child: Column(
                  children: [],
                ),
              ),
              SizedBox(
                height: AppSize.s70,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
