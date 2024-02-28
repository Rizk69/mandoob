import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';
import '../../resources/color_manager.dart';
import '../../resources/styles_manager.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    width: MediaQuery.of(context).size.width / 2.2,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        SizedBox(
          height: AppSize.s12.h,
        ),
        InkWell(
            onTap: (){},
            child: rowDrawer(title: LocaleKeys.clients.tr(), icon: '')),
        SizedBox(
          height: AppSize.s7,
        ),
    InkWell(
      onTap: (){},
       child: rowDrawer(title: LocaleKeys.trafficLines.tr(), icon: ''),),
        SizedBox(
          height: AppSize.s7,
        ),
    InkWell(
      onTap: (){},
      child:rowDrawer(title: LocaleKeys.account.tr(), icon: ''),),
        SizedBox(
          height: MediaQuery.of(context).size.height / 3,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(ColorManager.baseColorLight),
              shape: MaterialStatePropertyAll<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                      AppSize.s40), // Adjust the radius as needed
                ),
              ),
            ),
            onPressed: () {},
            child: Text(
              LocaleKeys.logout.tr(),
              style: getBoldSegoeStyle(
                color: ColorManager.black,
                fontSize: AppSize.s20.sp,
              ),
            ),
          ),
        )
      ],
    ),
  );
}

Widget rowDrawer({required String title, required String icon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        SizedBox(
          width: AppSize.s12,
        ),
        Icon(Icons.person_outline_sharp),
        SizedBox(
          width: AppSize.s8,
        ),
        Text(
          title,
          style: getBoldSegoeStyle(
            color: ColorManager.black,
            fontSize: AppSize.s20.sp,
          ),
        )
      ],
    ),
  );
}
