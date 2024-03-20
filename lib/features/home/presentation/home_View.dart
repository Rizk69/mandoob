import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/home/presentation/cubit/home_cubit/home_cubit.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/home/presentation/widget/stepper_view.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  // FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (_) => instance<HomeCubit>()..getHome(),
      child: Scaffold(
        key: scaffoldKey,
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
                        scaffoldKey.currentState?.openDrawer();
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
                SizedBox(
                  height: AppSize.s5.h,
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    var cubit = HomeCubit.get(context);
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p20, vertical: AppPadding.p18),
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
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(IconAssets.shopIcon,
                                  color: Colors.black54, height: 30),
                              const SizedBox(
                                width: 12,
                              ),
                              Text(
                                'العهده الحاليه',
                                style: getBold(
                                  color: ColorManager.black,
                                  fontSize: 25,
                                ),
                              ),
                              const Spacer(),
                              PopupMenuButton<int>(
                                onSelected: (value) {
                                  cubit.editPrice(
                                      value); // تعديل القيمة بناءً على الاختيار
                                },
                                itemBuilder: (BuildContext context) => [
                                  PopupMenuItem<int>(
                                    value: 0,
                                    child: Text(LocaleKeys.retail.tr()),
                                  ),
                                  PopupMenuItem<int>(
                                    value: 1,
                                    child: Text(LocaleKeys.wholesale.tr()),
                                  ),
                                  PopupMenuItem<int>(
                                    value: 2,
                                    child: Text(LocaleKeys.factoryPrice.tr()),
                                  ),
                                ],
                                child: Column(
                                  children: [
                                    Icon(
                                      Icons.filter_alt_outlined,
                                      color: ColorManager.baseColorLight,
                                    ),
                                    Text(
                                      "تخصيص",
                                      style: getSemiBoldInterStyle(
                                        color: ColorManager.baseColorLight,
                                        fontSize: AppSize.s13,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: AppSize.s15,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              columnCard(
                                  title: cubit.dolarPrice.toString(),
                                  colorTitle: ColorManager.greenLight,
                                  des: "كميه"),
                              Container(
                                height: AppSize.s98,
                                width: 2,
                                color: ColorManager.gray,
                              ),
                              columnCard(
                                  title: cubit.tlPrice.toString(),
                                  colorTitle: ColorManager.orangeLight,
                                  des: "سعر"),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                BlocBuilder<HomeCubit, HomeState>(
                  builder: (context, state) {
                    var cubit = HomeCubit.get(context);
                    if (state is GetHomeLoadingState) {
                      return const Center(
                          child: CircularProgressIndicator.adaptive());
                    } else if (state is GetHomeLoadedState) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p20,
                            vertical: AppPadding.p18),
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
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(IconAssets.location,
                                    color: Colors.black54, height: 30),
                                const SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  'خط سير اليوم',
                                  style: getBold(
                                    color: ColorManager.black,
                                    fontSize: 25,
                                  ),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.search,
                                      size: 28,
                                    )),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      size: 28,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              height: AppSize.s34,
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: StepProgressView(
                                width: MediaQuery.of(context).size.width / 1.3,
                                curStep: 1,
                                color: Colors.black87,
                                titles: cubit.homeModel!.deliveryLine
                                    ?.map((e) => e.number.toString())
                                    .toList(),
                                titlesName: cubit.homeModel!.deliveryLine
                                    ?.map((e) => e.customerName)
                                    .toList(),
                              ),
                            ),
                            const SizedBox(
                              height: AppSize.s34,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.trafficLines);
                                },
                                child: const Text(
                                  'عرض التفاصيل',
                                  style: TextStyle(
                                    color: Color(0Xff020736),
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
                const SizedBox(
                  height: AppSize.s70,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget columnCard(
      {required String title, required Color colorTitle, required String des}) {
    return Column(
      children: [
        Text(title, style: getBoldInterStyle(color: colorTitle, fontSize: 27)),
        Text(des,
            style: getBoldInterStyle(color: ColorManager.gray, fontSize: 20))
      ],
    );
  }
}
