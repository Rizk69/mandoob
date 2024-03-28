import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/features/custody/domain/model/cart_model.dart';
import 'package:mandoob/features/custody/presentation/cubit/el_salah/el_salah_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../core/resources/routes_manager.dart';
import '../../../../../generated/locale_keys.g.dart';

class CardExpandedItem extends StatelessWidget {
  final ProductModel product;
  final int index;

  const CardExpandedItem({Key? key, required this.product,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isExpanded = ElSalahCubit.get(context).expandedProductId == product.id;

    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            // ElSalahCubit.get(context).expand();
            ElSalahCubit.get(context).toggleExpanded(product.id);

          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
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
                      product.img,
                      height: AppSize.s13.h,
                      errorBuilder: (context, error, stackTrace) {
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          translateString(
                            context: context,
                            enString: product.nameEn,
                            arString: product.nameAr,
                          ),
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Text(
                          "${product.count} ${translateString(
                            context: context,
                            enString: product.realCountEn,
                            arString: product.realCountAr,
                          )}",
                          // Using Arabic count
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              '\$${product.priceUnitDoler ?? ''}',
                              // Using dollar price
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                            SizedBox(
                              width: AppSize.s7.w,
                            ),
                            Text(
                              'TL ${product.priceUnitLera ?? ''}',
                              // Using dollar price
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {
                            ElSalahCubit.get(context).addItem(product.id);
                          },
                          icon: Icon(
                            Icons.add,
                            color: ColorManager.greenLight,
                          ),
                        ),
                        Text(
                          '${ElSalahCubit.get(context).itemsCountPerProduct[product.id] ?? product.quantity}',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            ElSalahCubit.get(context).removeItem(product.id);
                          },
                          icon: Icon(
                            Icons.remove,
                            color: ColorManager.greenLight,
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
                if (isExpanded)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ListTile(
                              title: Text('دولار'),
                              leading: Radio<int>(
                                value: 1,
                                groupValue: ElSalahCubit.get(context).selectedCurrency,
                                onChanged: (value) {
                                  ElSalahCubit.get(context).updateCurrency(value!);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListTile(
                              title: Text('ليرة'),
                              leading: Radio<int>(
                                value: 2,
                                groupValue: ElSalahCubit.get(context).selectedCurrency,
                                onChanged: (value) {
                                  ElSalahCubit.get(context).updateCurrency(value!);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            'الكمية',
                            style: getBoldSegoeStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: AppSize.s7.w),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 50, // Adjust the height as needed
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                    disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        25.0,
                                      ),
                                      borderSide: BorderSide(
                                          color: ColorManager.babyBlue),
                                    ),
                                    hintText: product.quantity.toString()
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s1.h,
                      ),
                      Row(
                        children: [

                          Text(
                            'الوحدة',
                            style: getBoldSegoeStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: AppSize.s7.w),
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              height: 50, // Adjust the height as needed
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      25.0,
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorManager.babyBlue),
                                  ),
                                  hintText: translateString(
                                    context: context,
                                    enString: product.realCountEn,
                                    arString: product.realCountAr,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s1.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'السعر بالدولار',
                            style: getBoldSegoeStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: AppSize.s7.w),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      25.0,
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorManager.babyBlue),
                                  ),
                                  hintText:
                                  '${(product.priceUnitDoler) * (product.quantity)}',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: AppSize.s1.h,
                      ),
                      Row(
                        children: [
                          Text(
                            'السعر بالليرة',
                            style: getBoldSegoeStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          SizedBox(width: AppSize.s7.w),
                          Expanded(
                            child: SizedBox(
                              height: 50,
                              child: TextFormField(
                                enabled: false,
                                decoration: InputDecoration(
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(
                                      25.0,
                                    ),
                                    borderSide: BorderSide(
                                        color: ColorManager.babyBlue),
                                  ),
                                  hintText:
                                  '${product.priceUnitLera * (product.quantity)}',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s7.w),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all<
                                EdgeInsetsGeometry>(
                              EdgeInsets.all(10.0),
                            ),
                            backgroundColor:
                            MaterialStatePropertyAll<Color>(
                                Theme.of(context).hoverColor),
                            shape:
                            MaterialStatePropertyAll<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(AppSize.s40),
                              ),
                            ),
                          ),
                          onPressed: () {
                            ElSalahCubit.get(context).addCurrencyAndCount(
                                product_id: product.id,
                                currency_id:  ElSalahCubit.get(context).selectedCurrency,
                                count: ElSalahCubit.get(context).itemsCountPerProduct[product.id] ?? product.quantity
                            );


                          },
                          child: Text(
                            LocaleKeys.confirm.tr(),
                            style: getBoldSegoeStyle(
                              color: ColorManager.black,
                              fontSize: AppSize.s20.sp,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 20,
          child: IconButton(
            icon: const Icon(
              Icons.dangerous,
              color: Colors.red,
              size: 36,
            ),
            onPressed: () {
              ElSalahCubit.get(context)
                  .deleteOneProductInCart(product.id);
            },
          ),
        ),
      ],
    );
  }
}
