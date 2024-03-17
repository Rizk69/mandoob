import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';
import '../../../utiles_app/custom_buttoms.dart';
import '../../../utiles_app/header_screen.dart';
import '../../el_salah/widget/DropdownMenu.dart';
import '../../home/widget/drawer_home.dart';
import '../../resources/color_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/styles_manager.dart';
import '../../resources/values_manager.dart';

class EditTrafficView extends StatelessWidget {
  const EditTrafficView({Key? key}) : super(key: key);

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
                      title: 'تعديل خط السير',
                      functionIcon: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(height: AppSize.s5.h),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'التاجر',
                          style: getBoldSegoeStyle(
                              fontSize: 20, color: ColorManager.black),
                        ),
                      ),
                      SizedBox(
                        width: AppSize.s4.w,
                      ),
                      Expanded(
                        flex: 3,
                        child: DropdownMenu1Custom(
                          initText: 'إضافة تاجر ',
                          dropdownMenuEntries: [
                            DropdownMenuItemModel(text: '+ تاجر جديد'),

                            DropdownMenuItemModel(widget: customCard()),
                            DropdownMenuItemModel(widget: customCard()),
                            // Add the required argument here
                          ],
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.5),
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CustomButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, Routes.newTrader);
                          },
                          buttonText: 'إضافة'))
                ],
              ),
            ),
          ),
        ));
  }

  Widget customCard() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(18)),
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
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'محمد',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
              Text(
                '012804380',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
