import 'package:flutter/material.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TalabatOldDetails extends StatelessWidget {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  TalabatOldDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final String idOrder = ModalRoute.of(context)?.settings.arguments as String;

    return SafeArea(
        top: false,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.5),
          child: Stack(
            children: [
              imageBackground(context),
              Scaffold(
                key: scaffoldKey,
                drawer: buildDrawer(context),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppSize.s6.h,
                        ),
                        HeaderScreen(
                            functionDrawer: () {
                              scaffoldKey.currentState?.openDrawer();
                            },
                            title: 'تفاصيل طلبية 1',
                            functionIcon: () {
                              Navigator.pop(context);
                            }),
                        SizedBox(height: AppSize.s5.h),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'رقم الطلبية :  ',
                                style: getBoldSegoeStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text.rich(
                                TextSpan(
                                  text: 'الحالة : ',
                                  style: getBoldSegoeStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: translateString(
                                          context: context,
                                          arString: '',
                                          enString: ''),
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: ColorManager
                                            .greenLight, // Change this to your desired color
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'التاريخ :  ',
                                style: getBoldSegoeStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s6.h,
                        ),
                        Text(
                          'المواد',
                          style: getBoldSegoeStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColorLight),
                        ),
                        ListView.builder(
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColorDark,
                              boxShadow: [
                                BoxShadow(
                                  color: ColorManager.grey3,
                                  offset: const Offset(1, 2),
                                  spreadRadius: 0.1,
                                  blurRadius: 8,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      '',
                                      height: AppSize.s13.h,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/images/product.png',
                                          height: AppSize.s13.h,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 12,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          translateString(
                                            context: context,
                                            enString: 'شامبو حجم كبير',
                                            arString: 'شامبو حجم كبير',
                                          ),
                                          style: TextStyle(
                                            fontSize: 18,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                        Text(
                                          ' 1 طن',
                                          // Using dollar price
                                          style: TextStyle(
                                            fontSize: 16,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          shrinkWrap: true,
                          itemCount: 2,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
