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

class FawaterTagerDetailsView extends StatelessWidget {
  int id;

  FawaterTagerDetailsView({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => instance<FawaterViewCubit>()
          ..getFawaterTraderInvoiceDetails(invoiceId: id),
        child: Scaffold(
          backgroundColor: ColorManager.backGround,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSize.s4.h),
            child: SingleChildScrollView(
              child: BlocBuilder<FawaterViewCubit, FawaterViewState>(
                builder: (context, state) {
                  if (state is LoadedTraderInvoiceDetailsState) {
                    var traderDetailsInvoiceModel =
                        FawaterViewCubit.get(context)
                            .traderDetailsInvoiceModel!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppSize.s6.h,
                        ),
                        HeaderScreen(
                            title:
                                LocaleKeys.invoiceTrader.tr(),
                            functionIcon: () {
                              Navigator.pop(context);
                            }),
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
                                text: '${LocaleKeys.TraderName.tr()}\t\t\t\t',
                              ),
                              TextSpan(
                                text:
                                    traderDetailsInvoiceModel.data.customerName,
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
                                    '${LocaleKeys.invoiceNumber.tr()}\t\t\t\t',
                              ),
                              TextSpan(
                                text: traderDetailsInvoiceModel.data.invoiceNo,
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
                                text: '${LocaleKeys.totalPriceTL.tr()}\t\t\t\t',
                              ),
                              TextSpan(
                                text:
                                    "${traderDetailsInvoiceModel.data.priceLera.toString()} Tl",
                                style: getBoldSegoeStyle(
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
                                text: '${LocaleKeys.totalPriceUSD.tr()}\t\t\t\t',
                              ),
                              TextSpan(
                                text:
                                    "${traderDetailsInvoiceModel.data.priceDoler.toString()} \$",
                                style: getBoldSegoeStyle(
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
                                text: '${LocaleKeys.date.tr()}\t\t\t\t',
                              ),
                              TextSpan(
                                text:
                                    "${traderDetailsInvoiceModel.data.date.toString()}",
                                style: getBoldSegoeStyle(
                                  fontSize: AppSize.s20.sp,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.s3.h,),
                        Center(
                          child: Text(LocaleKeys.products.tr(),
                            style: getBoldSegoeStyle(
                              fontSize: AppSize.s20.sp,
                              color: ColorManager.black,
                            ),
                          ),
                        ),
                        SizedBox(height: AppSize.s2.h,),

                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: traderDetailsInvoiceModel.products.length,
                          itemBuilder: (context, index) =>
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columnSpacing: AppSize.s5.w,

                                  columns: [
                                    DataColumn(
                                      label: Text(
                                        LocaleKeys.ProductName.tr(),
                                        style: getBoldSegoeStyle(
                                          fontSize: AppSize.s20.sp,
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        LocaleKeys.count.tr(),
                                        style: getBoldSegoeStyle(
                                          fontSize: AppSize.s20.sp,
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        LocaleKeys.priceInLera.tr(),
                                        style: getBoldSegoeStyle(
                                          fontSize: AppSize.s20.sp,
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ),
                                    DataColumn(
                                      label: Text(
                                        LocaleKeys.PriceInUsd.tr(),
                                        style: getBoldSegoeStyle(
                                          fontSize: AppSize.s20.sp,
                                          color: ColorManager.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                  rows: List<DataRow>.generate(
                                    traderDetailsInvoiceModel.products.length,
                                        (index) => DataRow(
                                      cells: [
                                        DataCell(
                                          Text(
                                            traderDetailsInvoiceModel
                                                .products[index].nameAr,
                                            style: getMediumInterStyle(
                                              fontSize: AppSize.s20.sp,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            "${traderDetailsInvoiceModel.products[index].count} ${traderDetailsInvoiceModel.products[index].unitAr}",
                                            style: getMediumInterStyle(
                                              fontSize: AppSize.s20.sp,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            traderDetailsInvoiceModel
                                                .products[index].priceLera
                                                .toString(),
                                            style: getMediumInterStyle(
                                              fontSize: AppSize.s20.sp,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ),
                                        DataCell(
                                          Text(
                                            traderDetailsInvoiceModel
                                                .products[index].priceDoler
                                                .toString(),
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
                        ),

                      ],
                    );
                  } else if (state is LoadingTraderInvoiceDetailsState) {
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
