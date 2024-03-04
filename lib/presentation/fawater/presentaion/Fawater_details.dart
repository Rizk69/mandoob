import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/presentation/resources/styles_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utiles_app/custom_buttoms.dart';
import '../../resources/assets_manager.dart';
import '../../resources/values_manager.dart';

class FawaterTagerDetailsView extends StatelessWidget {
  const FawaterTagerDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.backGround,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    IconAssets.filterIcons,
                    height: 23,
                    color: Colors.transparent,
                  ),
                  Center(
                    child: Text(
                      'فاتورة التاجر محمد',
                      style: getBoldSegoeStyle(
                        fontSize: 25,
                        color: ColorManager.black,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(0, 100, 100, 100),
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
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'المواد\t\t\t\t',
                              ),
                              TextSpan(
                                text: 'شامبو',
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'الكمية\t\t\t\t',
                              ),
                              TextSpan(
                                text: '20 طن',
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'السعر\t\t\t\t',
                              ),
                              TextSpan(
                                text: '200000',
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'التاريخ\t\t\t',
                              ),
                              TextSpan(
                                text: '2-2-2022',
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey, // Border color
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'المواد\t\t\t\t',
                              ),
                              TextSpan(
                                text: 'شامبو',
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'الكمية\t\t\t\t',
                              ),
                              TextSpan(
                                text: '20 طن',
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'السعر\t\t\t\t',
                              ),
                              TextSpan(
                                text: '200000',
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: 'التاريخ\t\t\t',
                              ),
                              TextSpan(
                                text: '2-2-2022',
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 12),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey, // Border color
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
                width: double.infinity,
                height: 1,
                color: Colors.grey, // Border color
              ),
              RichText(
                text: TextSpan(
                  style: getBoldSegoeStyle(
                    fontSize: 28,
                    color: ColorManager.black,
                  ),
                  children: [
                    TextSpan(
                      text: 'الأجمالي\t\t\t',
                    ),
                    TextSpan(
                      text: '3125432',
                      style: getBoldSegoeStyle(
                        fontSize: 25,
                        color: ColorManager.black,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: AppSize.s4.h,
              ),
              SizedBox(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: CustomButton(onPressed: () {

                  }, buttonText: 'صرف'))


            ],
          ),
        ),
      ),
    );
  }
}
