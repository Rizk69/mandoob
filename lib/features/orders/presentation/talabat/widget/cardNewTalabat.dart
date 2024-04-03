import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/orders/domain/model/company_products_model.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/add_order_cubit/new_talabat_state.dart';
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
                    color: Colors.blue,
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
                        icon: const Icon(
                          Icons.add,
                          color: Colors.blue,
                        ),
                      ),
                      Text(
                        context
                                .watch<NewTalabatCubit>()
                                .productCounts[product.id]
                                ?.toString() ??
                            '0',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                        onPressed: () => context
                            .read<NewTalabatCubit>()
                            .decrement(product.id),
                        icon: const Icon(
                          Icons.remove,
                          color: Colors.blue,
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
              Icon(
                Icons.check,
                color: Colors.green,
              ),
            ],
          ),
        );
      },
    );
  }
}
