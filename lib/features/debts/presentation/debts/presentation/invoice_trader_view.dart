import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/resources/values_manager.dart';
import '../../../../../core/widget/backgrond_image.dart';

class InvoiceTrader extends StatelessWidget {
  const InvoiceTrader({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: Stack(
          children: [
            imageBackground(context),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: AppSize.s6.h,
                    ),
                    Text(
                      "فاتورة التاجر محمد",
                      style: getBoldSegoeStyle(
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "01125014633",
                          style: getBoldSegoeStyle(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SvgPicture.asset('assets/images/whatsApp.svg')
                      ],
                    ),
                    rowCard(
                        title: 'التاريخ',
                        colorTitle: ColorManager.black,
                        colordes: ColorManager.black,
                        des: "2-2-2022",
                        context: context),
                    SizedBox(height: AppSize.s12.h),
                    SizedBox(
                        width: MediaQuery.of(context).size.width * 0.9,
                        child: CustomButton(
                          onPressed: () {},
                          buttonText: 'طباعة',
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget rowCard(
      {required String title,
      required Color colorTitle,
      required BuildContext context,
      required Color colordes,
      required String des}) {
    return Row(
      children: [
        Text(
          "$title :  ",
          style: getBoldSegoeStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          des,
          style: getBoldSegoeStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
