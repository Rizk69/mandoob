import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/empty_screen.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/invoices/presentation/fawater/cubit/fawater_cubit.dart';
import 'package:mandoob/features/invoices/presentation/fawater/cubit/invoice_state.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class FawaterMandobDetailsView extends StatelessWidget {
  const FawaterMandobDetailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            instance<FawaterViewCubit>()..getFawaterSupplierInvoiceDetails(),
        child: Scaffold(
          backgroundColor: ColorManager.backGround,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.s4.h),
            child: BlocBuilder<FawaterViewCubit, FawaterViewState>(
              builder: (context, state) {
                if (state is LoadedSupplierInvoiceDetailsState) {
                  var supplierDetailsInvoiceModel =
                      FawaterViewCubit.get(context).supplierDetailsInvoiceModel;
                  if (FawaterViewCubit.get(context)
                          .supplierDetailsInvoiceModel
                          ?.invoices
                          .isNotEmpty ??
                      false) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: AppSize.s6.h,
                          ),
                          HeaderScreen(
                              title: '${LocaleKeys.invoiceDelegate.tr()}',
                              functionIcon: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(
                            height: AppSize.s6.h,
                          ),
                          RichText(
                            text: TextSpan(
                              style: getBoldSegoeStyle(
                                fontSize: AppSize.s22.sp,
                                color: ColorManager.black,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '${LocaleKeys.invoiceNumber.tr()}\t\t\t\t',
                                ),
                                TextSpan(
                                  text: supplierDetailsInvoiceModel!
                                      .invoices.first.invoiceNo,
                                  style: getMediumInterStyle(
                                    fontSize: AppSize.s20.sp,
                                    color: ColorManager.black,
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
                                fontSize: AppSize.s22.sp,
                                color: ColorManager.black,
                              ),
                              children: [
                                TextSpan(
                                  text:
                                      '${LocaleKeys.DelegateName.tr()}\t\t\t\t',
                                ),
                                TextSpan(
                                  text: supplierDetailsInvoiceModel
                                      .invoices.first.customerName,
                                  style: getMediumInterStyle(
                                    fontSize: AppSize.s20.sp,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppSize.s2.h,
                          ),
                          Center(
                            child: Text(
                              LocaleKeys.Invoices.tr(),
                              style: getBoldSegoeStyle(
                                fontSize: AppSize.s20.sp,
                                color: ColorManager.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSize.s2.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: [
                                DataColumn(
                                  label: Text(
                                    LocaleKeys.invoiceNumber.tr(),
                                    style: getBoldSegoeStyle(
                                      fontSize: AppSize.s20.sp,
                                      color: ColorManager.black,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    LocaleKeys.totalPriceUSD.tr(),
                                    style: getBoldSegoeStyle(
                                      fontSize: AppSize.s20.sp,
                                      color: ColorManager.black,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    LocaleKeys.totalPriceTL.tr(),
                                    style: getBoldSegoeStyle(
                                      fontSize: AppSize.s20.sp,
                                      color: ColorManager.black,
                                    ),
                                  ),
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                supplierDetailsInvoiceModel.invoices.length,
                                (index) => DataRow(
                                  cells: [
                                    DataCell(
                                      Text(
                                        supplierDetailsInvoiceModel
                                            .invoices[index].invoiceNo,
                                        style: getMediumInterStyle(
                                          fontSize: AppSize.s20.sp,
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        supplierDetailsInvoiceModel
                                            .invoices[index].priceDoler,
                                        style: getMediumInterStyle(
                                          fontSize: AppSize.s20.sp,
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Text(
                                        supplierDetailsInvoiceModel
                                            .invoices[index].priceLera,
                                        style: getMediumInterStyle(
                                          fontSize: AppSize.s20.sp,
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSize.s2.h,
                          ),
                          Center(
                            child: Text(
                              LocaleKeys.products.tr(),
                              style: getBoldSegoeStyle(
                                fontSize: AppSize.s20.sp,
                                color: ColorManager.black,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: AppSize.s2.h,
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: [
                                DataColumn(
                                  label: Text(
                                    LocaleKeys.ProductName.tr(),
                                    style: TextStyle(
                                      fontSize: AppSize.s20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    LocaleKeys.invoiceNumber.tr(),
                                    style: TextStyle(
                                      fontSize: AppSize.s20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    LocaleKeys.count.tr(),
                                    style: TextStyle(
                                      fontSize: AppSize.s20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    LocaleKeys.priceInLera.tr(),
                                    style: TextStyle(
                                      fontSize: AppSize.s20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    LocaleKeys.PriceInUsd.tr(),
                                    style: TextStyle(
                                      fontSize: AppSize.s20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                DataColumn(
                                  label: Text(
                                    LocaleKeys.date.tr(),
                                    style: TextStyle(
                                      fontSize: AppSize.s20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                              rows: supplierDetailsInvoiceModel.invoices
                                  .expand((invoice) =>
                                      invoice.products.map((product) {
                                        return DataRow(
                                          cells: [
                                            DataCell(
                                              Text(
                                                product.nameAr,
                                                // Product name in Arabic
                                                style: TextStyle(
                                                  fontSize: AppSize.s18.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                invoice.invoiceNo,
                                                // Display invoice number
                                                style: TextStyle(
                                                  fontSize: AppSize.s18.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                "${product.count} ${product.unitAr}",
                                                // Count and unit in Arabic
                                                style: TextStyle(
                                                  fontSize: AppSize.s18.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                product.priceLera.toString(),
                                                // Price in Lera
                                                style: TextStyle(
                                                  fontSize: AppSize.s18.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                product.priceDoler.toString(),
                                                // Price in USD
                                                style: TextStyle(
                                                  fontSize: AppSize.s18.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Text(
                                                product.date, // Product date
                                                style: TextStyle(
                                                  fontSize: AppSize.s18.sp,
                                                  fontWeight: FontWeight.normal,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      }))
                                  .toList(), // Convert all products from all invoices into a flat list of rows
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return EmptyScreen(
                        title: 'خطأ في البيانات', textbutton: 'العودة');
                  }
                } else if (state is LoadingSupplierInvoiceDetailsState) {
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
                return Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                    ),
                    const Center(child: Text('Somting Error')),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
