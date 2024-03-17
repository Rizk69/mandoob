import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/home/widget/drawer_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ElEahduh extends StatelessWidget {
  ElEahduh({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.backGround,
      drawer: buildDrawer(context),
      key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
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
                    'العهدة',
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
            TextFormField(
              scribbleEnabled: true,
              cursorHeight: 30,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'ابحث هنا',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: AppSize.s4.h),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: AppPadding.p20,
                vertical: AppPadding.p18,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: ColorManager.shadowColor,
                    blurRadius: 9,
                    spreadRadius: 8,
                  )
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  columnCard(
                    title: "123",
                    colorTitle: ColorManager.greenLight,
                    des: "كميه",
                  ),
                  Container(
                    height: AppSize.s98,
                    width: 2,
                    color: ColorManager.gray,
                  ),
                  columnCard(
                    title: "457868",
                    colorTitle: ColorManager.orangeLight,
                    des: "سعر",
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSize.s6.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/product.png',
                            height: AppSize.s13.h),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: ColorManager.grey2,
                              border: Border.all(
                                  color: ColorManager.grey2, width: 1)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'شامبو',
                                    style: getBoldSegoeStyle(
                                        fontSize: 27,
                                        color: ColorManager.black),
                                  ),
                                  Text(
                                    '30 عبوة ',
                                    style: getRegularInterStyle(
                                        fontSize: 18,
                                        color: ColorManager.black),
                                  ),
                                  Text(
                                    '30 ليررة',
                                    style: getRegularInterStyle(
                                        fontSize: 18,
                                        color: ColorManager.greenLight),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.star,
                                    color: ColorManager.grey3,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.s3.h),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: ColorManager.baseColorLight,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                IconAssets.bagIcon,
                                color: Colors.white,
                                height: 30,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'السلة',
                                style: getRegularInterStyle(
                                    fontSize: 27, color: ColorManager.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(width: AppSize.s4.h),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      top: 15,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset('assets/images/product.png',
                            height: AppSize.s13.h),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 15),
                          decoration: BoxDecoration(
                              color: ColorManager.grey2,
                              border: Border.all(
                                  color: ColorManager.grey2, width: 1)),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'شامبو',
                                    style: getBoldSegoeStyle(
                                        fontSize: 27,
                                        color: ColorManager.black),
                                  ),
                                  Text(
                                    '30 عبوة ',
                                    style: getRegularInterStyle(
                                        fontSize: 18,
                                        color: ColorManager.black),
                                  ),
                                  Text(
                                    '30 ليررة',
                                    style: getRegularInterStyle(
                                        fontSize: 18,
                                        color: ColorManager.greenLight),
                                  )
                                ],
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.star,
                                    color: ColorManager.orangeLight,
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.s3.h),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                              color: ColorManager.baseColorLight,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(15),
                                  bottomRight: Radius.circular(15))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                IconAssets.bagIcon,
                                color: Colors.white,
                                height: 30,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                'السلة',
                                style: getRegularInterStyle(
                                    fontSize: 27, color: ColorManager.white),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
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
