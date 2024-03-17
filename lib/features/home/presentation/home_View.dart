import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/home/widget/drawer_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widget/stepper_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);
  final List<String> titles = ['1', '2', '3' ,'4', '5'];
  final List<String> titlesName = ['تاجر 1', 'تاجر 2', 'تاجر 3' , 'تاجر 4' , 'تاجر 5'];
  FocusNode _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
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
              // SizedBox(
              //   height: AppSize.s20,
              // ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: TextFormField(
              //         focusNode: _focusNode,
              //         onTap: () {
              //           _focusNode.requestFocus();
              //         },
              //         cursorHeight: 30,
              //         decoration: const InputDecoration(
              //           prefixIcon: Icon(Icons.search),
              //           hintText: 'ابحث هنا',
              //           filled: true,
              //           fillColor: Colors.white,
              //         ),
              //       ),
              //     ),
              //     SizedBox(
              //       width: AppSize.s20,
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.symmetric(vertical: 18),
              //       child: Align(
              //         alignment: Alignment.centerLeft,
              //         child: Column(
              //           children: [
              //             SvgPicture.asset(IconAssets.iconNext,
              //                 color: ColorManager.black, height: 23),
              //             Text(
              //               'صرف منتجات',
              //               style: getBoldSegoeStyle(
              //                 color: ColorManager.black,
              //                 fontSize: AppSize.s20.sp,
              //               ),
              //             )
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: AppSize.s5.h,
              ),
              Container(
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
                            title: "123",
                            colorTitle: ColorManager.greenLight,
                            des: "كميه"),
                        Container(
                          height: AppSize.s98,
                          width: 2,
                          color: ColorManager.gray,
                        ),
                        columnCard(
                            title: "457868",
                            colorTitle: ColorManager.orangeLight,
                            des: "سعر"),
                      ],
                    ),
                    const SizedBox(
                      height: AppSize.s15,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'عرض التفاصيل',
                        style: TextStyle(
                          color: Color(0Xff020736),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
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
                        width: MediaQuery.of(context).size.width,
                        curStep: 5,
                        color: Colors.black87,
                        titles: titles,
                        titlesName: titlesName,
                      ),
                    ),
                    const SizedBox(
                      height: AppSize.s34,
                    ),
                     Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: (){
                          Navigator.pushNamed(context, Routes.trafficLines);
                        },
                        child: const Text('عرض التفاصيل',
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
              ),
              const SizedBox(
                height: AppSize.s70,
              ),
            ],
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
