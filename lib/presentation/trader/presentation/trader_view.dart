import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../utiles_app/header_screen.dart';
import '../../home/widget/drawer_home.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class TraderView extends StatelessWidget {
  const TraderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
        top: false,
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: ColorManager.backGround,
          drawer: buildDrawer(context),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SizedBox(
                    height: AppSize.s6.h,
                  ),
                  HeaderScreen(
                      functionDrawer: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      title: LocaleKeys.clients.tr(),
                      functionIcon: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(height: AppSize.s5.h),
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
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, Routes.newTrader);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 23,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'تاجر جديد',
                          style: TextStyle(
                              fontSize: 16,
                              color: ColorManager.black,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: AppSize.s4.h),
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18)),
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/prduct.jpg',
                              height: 50,
                              width: 50,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Text(
                                'محمد',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Text(
                                '012804380',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
