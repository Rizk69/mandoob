import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../el_salah_cubit.dart';
import '../widget/card.dart';

class ElSalahView extends StatelessWidget {
  ElSalahView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ElSalahCubit(),
      child: const ElSalahViewBody(),
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
          child: BlocBuilder<ElSalahCubit, ElSalahState>(
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
                          context.read<ElSalahCubit>().openDrawer(context);
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
                          EdgeInsets.all(10.0),
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
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.elmulakhas);
                      },
                      child: Text(
                        LocaleKeys.next.trim(),
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
