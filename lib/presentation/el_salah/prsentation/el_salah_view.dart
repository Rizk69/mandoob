import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';
import '../../home/widget/drawer_home.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';
import '../cubit.dart';
import '../widget/card.dart';

class ElSalahView extends StatelessWidget {
  ElSalahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => YourCubit(),
      child: ElSalahViewBody(),
    );
  }
}

class ElSalahViewBody extends StatelessWidget {
  const ElSalahViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: BlocBuilder<YourCubit, YourState>(
            builder: (context, state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: AppSize.s8.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          context.read<YourCubit>().openDrawer(context);
                        },
                        icon: const Icon(Icons.menu),
                      ),
                      Center(
                        child: Text(
                          'السلة',
                          style: getBoldSegoeStyle(
                              fontSize: 25, color: ColorManager.black),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.homeRoute);
                          },
                          icon: Icon(Icons.arrow_forward))
                    ],
                  ),
                  SizedBox(height: AppSize.s4.h),
                   YourExpandedItem(),
                   YourExpandedItem(),
                  SizedBox(height: AppSize.s10.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.all(
                              10.0), // Replace this with your desired padding
                        ),
                        backgroundColor: MaterialStatePropertyAll<Color>(
                            ColorManager.baseColorLight),
                        shape: MaterialStatePropertyAll<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                AppSize.s40), // Adjust the radius as needed
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.next.tr(),
                        style: getBoldSegoeStyle(
                          color: ColorManager.black,
                          fontSize: AppSize.s20.sp,
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}


