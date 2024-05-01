import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/features/orders/data/network/order_requests.dart';
import 'package:mandoob/features/orders/domain/model/company_products_model.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/add_order_cubit/new_talabat_state.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../cubit/add_order_cubit/new_talabat_cubit.dart';

class CardNewOrder extends StatelessWidget {
  final ProductsCompanyModel product;

  const CardNewOrder({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewTalabatCubit, NewTalabatState>(
      builder: (context, count) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
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
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  border: Border.all(
                    color: ColorFunctions.loadButtonColor(),
                    width: 2,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    product.img,
                    height: AppSize.s8.h,
                    width: AppSize.s8.h,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/product.png',
                        height: AppSize.s8.h,
                        width: AppSize.s8.h,
                        fit: BoxFit.cover,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Text(
                      translateString(
                          context: context,
                          enString: product.nameEn,
                          arString: product.nameAr),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () => context
                            .read<NewTalabatCubit>()
                            .increment(product.id),
                        icon:  Icon(
                          Icons.add,
                          color: ColorFunctions.loadButtonColor(),
                        ),
                      ),
                      Text(
                        context
                                .watch<NewTalabatCubit>()
                                .productCounts[product.id]
                                ?.toString() ??
                            '0',
                        style:  TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorFunctions.loadButtonColor(),
                        ),
                      ),
                      IconButton(
                        onPressed: () => context
                            .read<NewTalabatCubit>()
                            .decrement(product.id),
                        icon:  Icon(
                          Icons.remove,
                          color: ColorFunctions.loadButtonColor(),
                        ),
                      ),
                      DropdownButton<UnitModel>(
                        value: context
                            .watch<NewTalabatCubit>()
                            .selectedUnits[product.id],
                        icon: Icon(
                          Icons.arrow_drop_down,
                          color: Theme.of(context).primaryColor,
                        ),
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        underline: Container(
                          height: 1,
                          color: Theme.of(context).primaryColor,
                        ),
                        onChanged: (UnitModel? newValue) {
                          if (newValue != null) {
                            context
                                .read<NewTalabatCubit>()
                                .changeUnit(product.id, newValue);
                          }
                        },
                        items: [
                          product.unit,
                          product.unitCategory,
                          product.unitSubCategory
                        ]
                            .where((unit) => unit != null) // Filter out nulls
                            .map<DropdownMenuItem<UnitModel>>(
                                (UnitModel? value) {
                          return DropdownMenuItem<UnitModel>(
                            value: value,
                            child: Text(translateString(
                                context: context,
                                enString: value!.nameEn,
                                arString: value.nameAr)),
                          );
                        }).toList(),
                      ),
                    ],
                  )
                ],
              ),
              Spacer(),
              IconButton(
                onPressed: () {
                  final selectedUnit =
                      NewTalabatCubit.get(context).getCurrentSelectedUnit();
                  final productCount =
                      NewTalabatCubit.get(context).getCurrentProductCount();

                  if (selectedUnit != null && productCount != null) {
                    if (selectedUnit.type == 0 && productCount != 0) {
                      NewTalabatCubit.get(context).addOrderList(AddOrderRequest(
                        count: productCount.toString(),
                        type: '',
                        product_id: product.id.toString(),
                        unit_id: product.unit?.id.toString(),
                      ),context);
                    } else if (selectedUnit.type == 1 && productCount != 0) {
                      NewTalabatCubit.get(context).addOrderList(AddOrderRequest(
                        count: productCount.toString(),
                        product_id: product.id.toString(),
                        unit_category_id: product.unitCategory?.id.toString(),
                      ),context);
                    } else if (selectedUnit.type == 2 && productCount != 0) {
                      NewTalabatCubit.get(context).addOrderList(AddOrderRequest(
                        count: productCount.toString(),
                        product_id: product.id.toString(),
                        unit_sub_categories_id:
                            product.unitSubCategory?.id.toString(),
                      ),context);
                    }
                  }else{
                    final snackBar = defaultSnakeBar(
                      title: LocaleKeys.ERROR.tr(),
                      message: LocaleKeys.ERROR.tr(),
                      state: ContentType.failure,
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }
                },
                icon: Icon(Icons.add),
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        );
      },
    );
  }
}
