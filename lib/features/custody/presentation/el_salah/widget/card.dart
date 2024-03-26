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

class YourExpandedItem extends StatefulWidget {
  final ProductModel product;

  const YourExpandedItem({Key? key, required this.product}) : super(key: key);

  @override
  _YourExpandedItemState createState() => _YourExpandedItemState();
}

class _YourExpandedItemState extends State<YourExpandedItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<ElSalahCubit>(),
      child: BlocConsumer<ElSalahCubit, ElSalahState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Stack(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
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
                            widget.product.img!,
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
                                  enString: widget.product.nameEn,
                                  arString: widget.product.nameAr,
                                ),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Text(
                                "${widget.product.count} ${translateString(
                                  context: context,
                                  enString: widget.product.realCountEn,
                                  arString: widget.product.realCountAr,
                                )}",
                                // Using Arabic count
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$${widget.product.priceUnitDoler ?? ''}',
                                    // Using dollar price
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  SizedBox(width: AppSize.s7.w,),
                                  Text(
                                    'TL ${widget.product.priceUnitLera ?? ''}',
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
                                  setState(() {
                                    if (isExpanded == false) {
                                      isExpanded = true;
                                    }
                                  });
                                  ElSalahCubit.get(context).addItem();
                                },
                                icon: Icon(
                                  Icons.add,
                                  color: ColorManager.greenLight,
                                ),
                              ),
                              Text(
                                '${ElSalahCubit.get(context).countItems}',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  ElSalahCubit.get(context).removeItem();
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
                                          borderRadius: BorderRadius.circular(25.0,),
                                          borderSide: BorderSide(
                                              color: ColorManager.babyBlue
                                          ),
                                        ),
                                        hintText: translateString(
                                          context: context,
                                          enString: widget.product.realCountEn,
                                          arString: widget.product.realCountAr,
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
                                          borderRadius: BorderRadius.circular(25.0,),
                                          borderSide: BorderSide(
                                              color: ColorManager.babyBlue
                                          ),
                                        ),
                                        hintText:
                                            '${(widget.product.priceUnitDoler) !* (widget.product.quantity!)}',
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: AppSize.s1.h,),
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
                                          borderRadius: BorderRadius.circular(25.0,),
                                          borderSide: BorderSide(
                                              color: ColorManager.babyBlue
                                          ),
                                        ),
                                        hintText:
                                            '${widget.product.priceUnitLera !* (widget.product.quantity!)}',
                                      ),
                                    ),
                                  ),
                                ),

                              ],
                            ),
                            SizedBox(height: AppSize.s7.w),
                            SizedBox(
                              width: MediaQuery.of(context).size.width/2,
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
                                  Navigator.pushNamed(context, Routes.elmulakhas);
                                },
                                child: Text(
                                  LocaleKeys.confirm.trim(),
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
                    ElSalahCubit.get(context).deleteOneProductInCart(widget.product.id!);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
