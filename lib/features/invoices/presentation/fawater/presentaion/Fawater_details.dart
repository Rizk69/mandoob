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
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BlocBuilder<FawaterViewCubit, FawaterViewState>(
              builder: (context, state) {
                if (state is LoadedTraderInvoiceDetailsState) {
                  var traderDetailsInvoiceModel =
                      FawaterViewCubit.get(context).traderDetailsInvoiceModel!;
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: AppSize.s6.h,
                        ),
                        HeaderScreen(
                            title:
                                '${LocaleKeys.invoiceTrader.tr()}${traderDetailsInvoiceModel.data.customerName.split(" ")[0]}',
                            functionIcon: () {
                              Navigator.pop(context);
                            }),
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
                                text:
                                    '${LocaleKeys.invoiceNumber.tr()}\t\t\t\t',
                              ),
                              TextSpan(
                                text: traderDetailsInvoiceModel.data.invoiceNo,
                                style: getMediumInterStyle(
                                  fontSize: 20,
                                  color: ColorManager.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: traderDetailsInvoiceModel.products.length,
                          itemBuilder: (context, index) => Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: getBoldSegoeStyle(
                                          fontSize: 25,
                                          color: ColorManager.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${LocaleKeys.ProductName.tr()}\t\t\t\t',
                                          ),
                                          TextSpan(
                                            text: traderDetailsInvoiceModel
                                                .products[index].nameAr,
                                            style: getMediumInterStyle(
                                              fontSize: 20,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    RichText(
                                      text: TextSpan(
                                        style: getBoldSegoeStyle(
                                          fontSize: 25,
                                          color: ColorManager.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${LocaleKeys.count.tr()}\t\t\t\t',
                                          ),
                                          TextSpan(
                                            text:
                                                "${traderDetailsInvoiceModel.products[index].count} ${traderDetailsInvoiceModel.products[index].unitAr} ",
                                            style: getMediumInterStyle(
                                              fontSize: 20,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    RichText(
                                      text: TextSpan(
                                        style: getBoldSegoeStyle(
                                          fontSize: 25,
                                          color: ColorManager.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${LocaleKeys.priceInLera.tr()} \t\t\t\t',
                                          ),
                                          TextSpan(
                                            text: traderDetailsInvoiceModel
                                                .products[index].priceLera
                                                .toString(),
                                            style: getMediumInterStyle(
                                              fontSize: 20,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    RichText(
                                      text: TextSpan(
                                        style: getBoldSegoeStyle(
                                          fontSize: 25,
                                          color: ColorManager.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${LocaleKeys.PriceInUsd.tr()}\t\t\t\t',
                                          ),
                                          TextSpan(
                                            text: traderDetailsInvoiceModel
                                                .products[index].priceDoler
                                                .toString(),
                                            style: getMediumInterStyle(
                                              fontSize: 20,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    RichText(
                                      text: TextSpan(
                                        style: getBoldSegoeStyle(
                                          fontSize: 25,
                                          color: ColorManager.black,
                                        ),
                                        children: [
                                          TextSpan(
                                            text:
                                                '${LocaleKeys.date.tr()}\t\t\t',
                                          ),
                                          TextSpan(
                                            text: traderDetailsInvoiceModel
                                                .products[index].date,
                                            style: getMediumInterStyle(
                                              fontSize: 20,
                                              color: ColorManager.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.grey, // Border color
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    left: 10, right: 10, bottom: 10),
                                width: double.infinity,
                                height: 1,
                                color: Colors.grey, // Border color
                              ),
                              RichText(
                                text: TextSpan(
                                  style: getBoldSegoeStyle(
                                    fontSize: 28,
                                    color: ColorManager.black,
                                  ),
                                  children: [
                                    TextSpan(
                                      text:
                                          '${LocaleKeys.totalPrice.tr()}\t\t\t',
                                    ),
                                    TextSpan(
                                      text:
                                          "${traderDetailsInvoiceModel.products[index].priceDoler.toString()} \$    ",
                                      style: getBoldSegoeStyle(
                                        fontSize: 20,
                                        color: Colors.green,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "${traderDetailsInvoiceModel.products[index].priceLera.toString()} Tl",
                                      style: getBoldSegoeStyle(
                                        fontSize: 20,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
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
    );
  }
}

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
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              child: BlocBuilder<FawaterViewCubit, FawaterViewState>(
                builder: (context, state) {
                  if (state is LoadedSupplierInvoiceDetailsState) {
                    var supplierDetailsInvoiceModel =
                        FawaterViewCubit.get(context)
                            .supplierDetailsInvoiceModel;
                    if (FawaterViewCubit.get(context)
                            .supplierDetailsInvoiceModel
                            ?.invoices
                            .isNotEmpty ??
                        false) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                IconAssets.filterIcons,
                                height: 23,
                                color: Colors.transparent,
                              ),
                              Center(
                                child: Text(
                                  ' فاتورة المندوب ${supplierDetailsInvoiceModel?.invoices.first.customerName}',
                                  style: getBoldSegoeStyle(
                                    fontSize: 25,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  showMenu(
                                    context: context,
                                    position: const RelativeRect.fromLTRB(
                                        0, 100, 100, 100),
                                    items: [
                                      const PopupMenuItem(
                                        child: Text('شامبو'),
                                      ),
                                      const PopupMenuItem(
                                        child: Text('شاور'),
                                      ),
                                      const PopupMenuItem(
                                        child: Text('صابون'),
                                      ),
                                    ],
                                  );
                                },
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 18),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      children: [
                                        SvgPicture.asset(
                                          IconAssets.filterIcons,
                                          height: 23,
                                        ),
                                        Text(
                                          'تخصيص',
                                          style: getBoldSegoeStyle(
                                            color: ColorManager.babyBlue,
                                            fontSize: AppSize.s15.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          RichText(
                            text: TextSpan(
                              style: getBoldSegoeStyle(
                                fontSize: 25,
                                color: ColorManager.black,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'رقم الفاتورة\t\t\t\t',
                                ),
                                TextSpan(
                                  text: supplierDetailsInvoiceModel
                                      ?.invoices.first.invoiceNo,
                                  style: getMediumInterStyle(
                                    fontSize: 20,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            itemCount: supplierDetailsInvoiceModel
                                ?.invoices.first.products.length,
                            itemBuilder: (context, index) => Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0, vertical: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                        text: TextSpan(
                                          style: getBoldSegoeStyle(
                                            fontSize: 25,
                                            color: ColorManager.black,
                                          ),
                                          children: [
                                            const TextSpan(
                                              text: 'المواد\t\t\t\t',
                                            ),
                                            TextSpan(
                                              text: supplierDetailsInvoiceModel
                                                  ?.invoices
                                                  .first
                                                  .products[index]
                                                  .nameAr,
                                              style: getMediumInterStyle(
                                                fontSize: 20,
                                                color: ColorManager.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      RichText(
                                        text: TextSpan(
                                          style: getBoldSegoeStyle(
                                            fontSize: 25,
                                            color: ColorManager.black,
                                          ),
                                          children: [
                                            const TextSpan(
                                              text: 'الكمية\t\t\t\t',
                                            ),
                                            TextSpan(
                                              text:
                                                  "${supplierDetailsInvoiceModel?.invoices.first.products[index].count} ${supplierDetailsInvoiceModel?.invoices.first.products[index].unitAr} ",
                                              style: getMediumInterStyle(
                                                fontSize: 20,
                                                color: ColorManager.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      RichText(
                                        text: TextSpan(
                                          style: getBoldSegoeStyle(
                                            fontSize: 25,
                                            color: ColorManager.black,
                                          ),
                                          children: [
                                            const TextSpan(
                                              text: 'السعر بالليرة \t\t\t\t',
                                            ),
                                            TextSpan(
                                              text: supplierDetailsInvoiceModel
                                                  ?.invoices
                                                  .first
                                                  .products[index]
                                                  .priceLera
                                                  .toString(),
                                              style: getMediumInterStyle(
                                                fontSize: 20,
                                                color: ColorManager.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      RichText(
                                        text: TextSpan(
                                          style: getBoldSegoeStyle(
                                            fontSize: 25,
                                            color: ColorManager.black,
                                          ),
                                          children: [
                                            const TextSpan(
                                              text: 'السعر بالدولار\t\t\t\t',
                                            ),
                                            TextSpan(
                                              text: supplierDetailsInvoiceModel
                                                  ?.invoices
                                                  .first
                                                  .products[index]
                                                  .priceDoler
                                                  .toString(),
                                              style: getMediumInterStyle(
                                                fontSize: 20,
                                                color: ColorManager.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      RichText(
                                        text: TextSpan(
                                          style: getBoldSegoeStyle(
                                            fontSize: 25,
                                            color: ColorManager.black,
                                          ),
                                          children: [
                                            const TextSpan(
                                              text: 'التاريخ\t\t\t',
                                            ),
                                            TextSpan(
                                              text: supplierDetailsInvoiceModel
                                                  ?.invoices
                                                  .first
                                                  .products[index]
                                                  .date,
                                              style: getMediumInterStyle(
                                                fontSize: 20,
                                                color: ColorManager.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        width: double.infinity,
                                        height: 1,
                                        color: Colors.grey, // Border color
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                                left: 10, right: 10, bottom: 10),
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey, // Border color
                          ),
                          RichText(
                            text: TextSpan(
                              style: getBoldSegoeStyle(
                                fontSize: 28,
                                color: ColorManager.black,
                              ),
                              children: [
                                const TextSpan(
                                  text: 'الأجمالي\t\t\t',
                                ),
                                TextSpan(
                                  text: supplierDetailsInvoiceModel
                                      ?.invoices.first.priceLera
                                      .toString(),
                                  style: getBoldSegoeStyle(
                                    fontSize: 25,
                                    color: ColorManager.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: AppSize.s4.h,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child: CustomButton(
                                  onPressed: () {}, buttonText: 'صرف'))
                        ],
                      );
                    } else {
                      return EmptyScreen(
                          title: 'خطأ في البيانات',
                          textbutton: 'العودة',
                          viewButtom: true);
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
      ),
    );
  }
}
