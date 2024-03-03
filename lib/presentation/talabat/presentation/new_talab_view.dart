import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/presentation/talabat/cubit/newTalabatCubit.dart';
import 'package:mandoob/presentation/talabat/widget/cardNewTalabat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../home/widget/drawer_home.dart';
import '../../resources/assets_manager.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class NewTalabat extends StatelessWidget {
  const NewTalabat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewTalabatCubit(),
      child: NewTalabatViewBody(),
    );
  }
}

class NewTalabatViewBody extends StatelessWidget {
  const NewTalabatViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: ColorManager.backGround,
      drawer: buildDrawer(context),
      body: BlocBuilder<NewTalabatCubit, int>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: AppSize.s8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        icon: const Icon(Icons.menu),
                      ),
                      Center(
                        child: Text(
                          'طلبية جديدة',
                          style: getBoldSegoeStyle(
                            fontSize: 25,
                            color: ColorManager.black,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.homeRoute);
                        },
                        icon: Icon(Icons.arrow_forward),
                      )
                    ],
                  ),
                  SizedBox(height: AppSize.s4.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          scribbleEnabled: true,
                          cursorHeight: 30,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            hintText: 'ابحث هنا',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: AppSize.s20,
                      ),
                      InkWell(
                        onTap: () {
                          showMenu(
                            context: context,
                            position: RelativeRect.fromLTRB(0, 200, 100, 100),
                            items: [
                              PopupMenuItem(
                                child: Text('شامبو'),
                              ),
                              PopupMenuItem(
                                child: Text('شاور'),
                              ),
                              PopupMenuItem(
                                child: Text('صابون'),
                              ),
                            ],
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 18),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                SvgPicture.asset(
                                  IconAssets.filterIcons,
                                  height: 23,
                                ),
                                Text(
                                  'تخصيص',
                                  style: getBoldSegoeStyle(
                                    color: ColorManager.babyBlue,
                                    fontSize: AppSize.s15.sp,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSize.s8.h),
                  CardNewTalabat(),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
