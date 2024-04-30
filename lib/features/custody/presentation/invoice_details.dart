import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/custody/presentation/cubit/el_salah/el_salah_cubit.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class InvoiceDetailsView extends StatelessWidget {
  int id;

  InvoiceDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            instance<ElSalahCubit>()..getInvoice(invoiceId: id),
        child: Scaffold(
          backgroundColor: ColorManager.backGround,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              child: BlocBuilder<ElSalahCubit, ElSalahState>(
                builder: (context, state) {
                  if (state is GetInvoiceLoadedState) {
                    var invoiceModel = ElSalahCubit.get(context).invoicesModel!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppSize.s6.h,
                        ),
                        HeaderScreen(
                            title:
                                '${LocaleKeys.invoiceTrader.tr()}${invoiceModel.invoice?.customerName.split(" ")[0]}',
                            functionIcon: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.homeRoute);
                            }),
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(IconAssets.whatsIcons),
                              SizedBox(width: AppSize.s1.w),
                              Text(
                                invoiceModel.invoice!.customerPhone.toString(),
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.gray,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s2.h,
                        ),
                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: ColorManager.black,
                            ),
                            children: [
                               TextSpan(
                                text: '${LocaleKeys.invoiceNumber.tr()}\t\t\t\t',
                              ),
                              TextSpan(
                                text: invoiceModel.invoice?.invoiceNo,
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.s2.h,),
                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 28,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: '${LocaleKeys.totalPriceTL.tr()}\t\t\t',
                              ),
                              TextSpan(
                                text:
                                "${invoiceModel.invoice?.priceDoler.toString()} \$    ",
                                style: getBoldSegoeStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                ),
                              ),
                              TextSpan(
                                text:
                                "${invoiceModel.invoice?.priceLera.toString()} Tl",
                                style: getBoldSegoeStyle(
                                  fontSize: 20,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.s2.h,),

                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 28,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: '${LocaleKeys.amountPaid.tr()} \t\t\t',
                              ),
                              TextSpan(
                                text:
                                "${invoiceModel.invoice?.payPriceDoler.toString()} \$    ",
                                style: getBoldSegoeStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                ),
                              ),
                              TextSpan(
                                text:
                                "${invoiceModel.invoice?.payPriceLera.toString()} Tl",
                                style: getBoldSegoeStyle(
                                  fontSize: 20,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.s2.h,),

                        RichText(
                          text: TextSpan(
                            style: getBoldSegoeStyle(
                              fontSize: 28,
                              color: ColorManager.black,
                            ),
                            children: [
                              TextSpan(
                                text: '${LocaleKeys.RemainingAmount.tr()} \t\t\t',
                              ),
                              TextSpan(
                                text:
                                "${invoiceModel.invoice?.restPriceDoler.toString()} \$    ",
                                style: getBoldSegoeStyle(
                                  fontSize: 20,
                                  color: Colors.green,
                                ),
                              ),
                              TextSpan(
                                text:
                                "${invoiceModel.invoice?.restPriceLera.toString()} Tl",
                                style: getBoldSegoeStyle(
                                  fontSize: 20,
                                  color: Colors.redAccent,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: AppSize.s4.h,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal, // For horizontal scrolling
                          child: DataTable(
                            columns: [
                              DataColumn(
                                label: Text(
                                  LocaleKeys.ProductName.tr(), // Column for date
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  LocaleKeys.count.tr(), // Column for date
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  LocaleKeys.priceInLera.tr(), // Column for date
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  LocaleKeys.PriceInUsd.tr(), // Column for date
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                 LocaleKeys.date.tr(), // Column for date
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ),
                            ],
                            rows: invoiceModel.invoice?.products.map((product) {
                              return DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      product.nameAr, // Product name in Arabic
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorManager.black,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      "${product.count} ${product.unitAr}", // Product count and unit
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorManager.black,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      product.priceLera.toString(), // Price in Lera
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorManager.black,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      product.priceDoler.toString(), // Price in USD
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorManager.black,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      product.date, // Date of product
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: ColorManager.black,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            }).toList() ?? [], // Convert product list to rows
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, bottom: 10),
                          width: double.infinity,
                          height: 1,
                          color: Colors.grey, // Border color
                        ),
                        SizedBox(
                          height: AppSize.s4.h,
                        ),
                        SizedBox(
                            width: MediaQuery.of(context).size.width * 0.9,
                            child: CustomButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.homeRoute);
                                },
                                buttonText: LocaleKeys.Cashing.tr()))
                      ],
                    );
                  } else if (state is GetInvoiceLoadingState) {
                    return const Scaffold(
                      body: Column(
                        children: [
                          Center(
                            child: CircularProgressIndicator.adaptive(),
                          )
                        ],
                      ),
                    );
                  }
                  return Container();
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
