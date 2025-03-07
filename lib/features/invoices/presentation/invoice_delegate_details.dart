import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/invoices/presentation/cubit/fawater_cubit.dart';
import 'package:mandoob/features/invoices/presentation/cubit/invoice_state.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class DelegateInvoiceDetailsView extends StatelessWidget {
  const DelegateInvoiceDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) =>
            instance<FawaterViewCubit>()..getFawaterSupplierInvoiceDetails(),
        child: Scaffold(
          body: Stack(
            children: [
              imageBackground(context),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.s4.h),
                child: BlocBuilder<FawaterViewCubit, FawaterViewState>(
                  builder: (context, state) {
                    final cubit = FawaterViewCubit.get(context);
                    if (state is LoadedSupplierInvoiceDetailsState ||
                        state is InvoiceSelectedState) {
                      final invoices =
                          cubit.supplierDetailsInvoiceModel?.invoices ?? [];
                      final selectedInvoice = cubit.selectedInvoice;

                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: AppSize.s6.h),
                            HeaderScreen(
                              title: LocaleKeys.invoiceDelegate.tr(),
                              functionIcon: () => Navigator.pop(context),
                            ),
                            SizedBox(height: AppSize.s6.h),

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: DataTable(
                                columnSpacing: AppSize.s8.w,
                                showCheckboxColumn: false,
                                columns: [
                                  DataColumn(
                                    label: Text(
                                      LocaleKeys.invoiceNumber.tr(),
                                      style: getBoldSegoeStyle(
                                        fontSize: AppSize.s18.sp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      LocaleKeys.totalPriceUSD.tr(),
                                      style: getBoldSegoeStyle(
                                        fontSize: AppSize.s18.sp,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Text(
                                      LocaleKeys.totalPriceTL.tr(),
                                      style: getBoldSegoeStyle(
                                        fontSize: AppSize.s18.sp,
                                        color:Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                                rows: List<DataRow>.generate(
                                  invoices.length,
                                  (index) => DataRow(
                                    onSelectChanged: (_) =>
                                        cubit.selectInvoice(index),
                                    // Trigger selectInvoice on click
                                    cells: [
                                      DataCell(
                                        Text(
                                          invoices[index].invoiceNo,
                                          style: getMediumInterStyle(
                                            fontSize: AppSize.s16.sp,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          invoices[index].priceDoler,
                                          style: getMediumInterStyle(
                                            fontSize: AppSize.s16.sp,
                                            color: Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Text(
                                          invoices[index].priceLera,
                                          style: getMediumInterStyle(
                                            fontSize: AppSize.s16.sp,
                                            color:Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            if (selectedInvoice != null) ...[
                              SizedBox(height: AppSize.s6.h),
                              Center(
                                child: Text(
                                  '${LocaleKeys.ProductsForInvoice.tr()} ${selectedInvoice.invoiceNo}',
                                  style: getBoldSegoeStyle(
                                    fontSize: AppSize.s20.sp,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: AppSize.s5.w,

                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        LocaleKeys.ProductName.tr(),
                                        style: getBoldSegoeStyle(
                                          fontSize: AppSize.s18.sp,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        LocaleKeys.count.tr(),
                                        style: getBoldSegoeStyle(
                                          fontSize: AppSize.s18.sp,
                                          color:Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        LocaleKeys.priceInLera.tr(),
                                        style: getBoldSegoeStyle(
                                          fontSize: AppSize.s18.sp,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        LocaleKeys.PriceInUsd.tr(),
                                        style: getBoldSegoeStyle(
                                          fontSize: AppSize.s18.sp,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: selectedInvoice.products.map((product) {
                                    return DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            product.nameAr,
                                            style: TextStyle(
                                              fontSize: AppSize.s18.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            "${product.count} ${product.unitAr}",
                                            style: TextStyle(
                                              fontSize: AppSize.s18.sp,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            product.priceLera.toString(),
                                            style: TextStyle(
                                              fontSize: AppSize.s18.sp,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            product.priceDoler.toString(),
                                            style: TextStyle(
                                              fontSize: AppSize.s18.sp,
                                              color: Theme.of(context).primaryColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                ),
                              ),
                              SizedBox(height: AppSize.s6.h),

                            ],
                          ],
                        ),
                      );
                    }

                    if (state is LoadingSupplierInvoiceDetailsState) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return Center(child: Text(LocaleKeys.ERROR.tr()));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
