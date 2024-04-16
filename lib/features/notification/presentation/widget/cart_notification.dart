import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/notification/domain/model/notification_model.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../app/functions.dart';
import '../../../../../core/resources/color_manager.dart';

class CartNotification extends StatelessWidget {
  final NotificationDataModel model;

  const CartNotification({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 18,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 10,
            spreadRadius: 8,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  translateString(
                      context: context,
                      enString: model.titleEn,
                      arString: model.titleAr),
                  style: TextStyle(
                    fontSize: AppSize.s18.sp,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  translateString(
                      context: context,
                      arString: model.descriptionAr,
                      enString : model.descriptionEn),
                  style: TextStyle(
                    fontSize: AppSize.s16.sp,
                    fontWeight: FontWeight.normal,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  model.date,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorManager.gray,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
