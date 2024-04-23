import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TradeItem extends StatelessWidget {
  final String imageUrl;
  final String traderName;
  final String phone;
  final String address;
  final String priceAr;
  final String priceEn;

  const TradeItem({
    Key? key,
    required this.imageUrl,
    required this.traderName,
    required this.phone,
    required this.address,
    required this.priceAr,
    required this.priceEn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0), // إضافة هامش حول الكارت
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark, // لون الكارت أبيض
        borderRadius: BorderRadius.circular(18), // حواف الكارت دائرية
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5), // لون الظل
            spreadRadius: 2, // نطاق الظل
            blurRadius: 7, // تمويه الظل
            offset: const Offset(0, 3), // الإزاحة العمودية للظل
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p3.pt),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50), // حواف الصورة دائرية
              child: Image.network(
                imageUrl,
                height: 50,
                width: 50,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              // استخدم Expanded لتجنب الأخطاء المتعلقة بالمساحة
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Row(
                      children: [
                        Text(
                          traderName,
                          style: getMediumInterStyle(
                            fontSize: AppSize.s18.sp,
                            color: ColorManager
                                .baseColorLight, // تغيير اللون إلى الأسود لزيادة الوضوح
                          ),
                        ),
                        const Spacer(),
                        Text(
                          priceAr,
                          style: getMediumInterStyle(
                            fontSize: AppSize.s18.sp,
                            color: ColorManager
                                .baseColorLight, // تغيير اللون إلى الأسود لزيادة الوضوح
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      phone,
                      style: getMediumInterStyle(
                        fontSize: AppSize.s16.sp,
                        color:
                            Colors.grey, // تغيير اللون إلى الأسود لزيادة الوضوح
                      ),
                    ),
                  ),

                  SizedBox(
                    height: AppSize.s1.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      address,
                      style: getMediumInterStyle(
                        fontSize: AppSize.s16.sp,
                        color:
                            Colors.grey, // تغيير اللون إلى الأسود لزيادة الوضوح
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
