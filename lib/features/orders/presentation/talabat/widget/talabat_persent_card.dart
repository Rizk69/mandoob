import 'package:flutter/material.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/features/orders/domain/model/talabat_model.dart';

class PresentOrder extends StatelessWidget {
  final OrdersTalabat talabatPresent ;
  const PresentOrder({super.key , required this.talabatPresent});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:
      CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets
              .symmetric(
              horizontal: 8.0,
              vertical: 15),
          child: Column(
            crossAxisAlignment:
            CrossAxisAlignment
                .start,
            children: [
              Text(
                'رقم الطلبية :  ${talabatPresent.orderNo}',
                style:
                getBoldSegoeStyle(
                  fontSize: 18,
                  color: Theme.of(
                      context)
                      .primaryColor,
                ),
              ),
              SizedBox(height: 8),
              Text.rich(
                TextSpan(
                  text: 'الحالة : ',
                  style:
                  getBoldSegoeStyle(
                    fontSize: 18,
                    color: Theme.of(
                        context)
                        .primaryColor,
                  ),
                  children: [
                    TextSpan(
                      text:
                      translateString(context: context,
                          arString:talabatPresent.status_ar ,
                          enString: talabatPresent.status_en
                      ),
                      style:
                      TextStyle(
                        fontSize:
                        18,
                        fontWeight:
                        FontWeight
                            .bold,
                        color: ColorManager
                            .greenLight, // Change this to your desired color
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                'التاريخ : ${talabatPresent.date} ',
                style:
                getBoldSegoeStyle(
                  fontSize: 18,
                  color: Theme.of(
                      context)
                      .primaryColor,
                ),
              ),
              Align(
                alignment: Alignment
                    .centerLeft,
                child: Text(
                  'تعديل',
                  style: TextStyle(
                    color:
                    ColorManager
                        .babyBlue,
                    fontSize: 18,
                    fontWeight:
                    FontWeight
                        .w500,
                    decoration:
                    TextDecoration
                        .underline,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Container(
                width:
                MediaQuery.of(
                    context)
                    .size
                    .width,
                decoration: BoxDecoration(
                    color:
                    Colors.grey,
                    border: Border.all(
                        color: Colors
                            .grey,
                        width: 1)),
              )
            ],
          ),
        ),
      ],
    );
  }
}
