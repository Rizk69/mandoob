import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import 'package:mandoob/features/custody/presentation/cubit/el_salah/el_salah_cubit.dart';
import 'package:mandoob/features/custody/presentation/el_salah/widget/card.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'cutom_alert.dart';

class ElSalahViewBody extends StatelessWidget {
  final List<ProductModel> cartItems;

  ElSalahViewBody({Key? key, required this.cartItems}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: buildDrawer(context),
      body: SingleChildScrollView(
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
                      ElSalahCubit.get(context).openDrawer(context);
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  Center(
                    child: Text(
                      'السلة',
                      style: getBoldSegoeStyle(
                          fontSize: 25,
                          color: Theme.of(context).primaryColorLight),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.homeRoute);
                    },
                    icon: Icon(
                      Icons.arrow_forward,
                      color: Theme.of(context).primaryColorLight,
                    ),
                  )
                ],
              ),
              SizedBox(height: AppSize.s4.h),
              GestureDetector(
                onTap: () {
                  ElSalahCubit.get(context).deleteCart();
                },
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Text(
                      LocaleKeys.deleteAll.tr(),
                      style: TextStyle(
                        color: ColorManager.babyBlue,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  return CardExpandedItem(product: cartItems[index],index: index,);
                },
              ),
              SizedBox(height: AppSize.s10.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      EdgeInsets.all(10.0),
                    ),
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Theme.of(context).hoverColor),
                    shape: MaterialStatePropertyAll<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(AppSize.s40),
                      ),
                    ),
                  ),
                  onPressed: () {
                    // Navigator.pushNamed(context, Routes.elmulakhas);
                    showContainerDialog(context);
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
          ),
        ),
      ),
    );
  }
}
