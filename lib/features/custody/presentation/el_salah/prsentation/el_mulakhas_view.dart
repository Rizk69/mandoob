import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/custom_text_form_info.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/custody/presentation/cubit/el_salah/el_salah_cubit.dart';
import 'package:mandoob/features/custody/presentation/el_salah/widget/cutom_alert.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ElMulakhas extends StatelessWidget {
  const ElMulakhas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => instance<ElSalahCubit>()..getCartOrder(),
      child: Scaffold(
        drawer: buildDrawer(context),
        key: scaffoldKey,
        body: Stack(
          children: [
            imageBackground(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  SizedBox(height: AppSize.s8.h),
                  HeaderScreen(
                    title: 'الملخص',
                    functionIcon: () {
                      Navigator.pushNamed(context, Routes.elSalah);
                    },
                    functionDrawer: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                  SizedBox(height: AppSize.s4.h),
                  Expanded(
                    child: BlocBuilder<ElSalahCubit, ElSalahState>(
                      builder: (context, state) {
                        if (state is GetCartLoadedState) {
                          final cart = context.read<ElSalahCubit>().cart;
                          if (cart != null && cart.data.isNotEmpty) {
                            return Column(
                              children: [
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: cart.data.length + 1,
                                  itemBuilder: (context, index) {
                                    if (index == 0) {
                                      return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 18.0),
                                        child: customTextFormFiledInfo(
                                          text: LocaleKeys.TradeName.tr(),
                                          onChanged: null,
                                          enable: false,
                                          hint: cart.trader!.name,
                                          context: context,
                                        ),
                                      );
                                    }
                                    final product = cart.data[index - 1];
                                    return Container(
                                      margin:
                                          EdgeInsets.symmetric(vertical: 12),
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: ColorManager.greenBorder),
                                      ),
                                      child: Row(
                                        children: [
                                          Image.network(
                                            product.img,
                                            height: AppSize.s13.h,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                'assets/images/product.png',
                                                height: AppSize.s13.h,
                                              );
                                            },
                                          ),
                                          SizedBox(width: AppSize.s3.w),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                translateString(
                                                    context: context,
                                                    arString: product.nameAr,
                                                    enString: product.nameEn),
                                                style: getRegularSegoeStyle(
                                                    fontSize: 18,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                              Text(
                                                '${product.quantity}  ${translateString(context: context, arString: product.realCountAr, enString: product.realCountEn)}',
                                                style: getRegularSegoeStyle(
                                                    fontSize: 18,
                                                    color: Theme.of(context)
                                                        .primaryColor),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    '\$ ${product.priceUnitDoler}',
                                                    style: getRegularSegoeStyle(
                                                        fontSize: 18,
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  ),
                                                  SizedBox(
                                                    width: AppSize.s10.w,
                                                  ),
                                                  Text(
                                                    'TL ${product.priceUnitLera}',
                                                    style: getRegularSegoeStyle(
                                                        fontSize: 18,
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: AppSize.s5.h),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: AppPadding.p1.pt,
                                      vertical: AppPadding.p4.pt),
                                  child: SizedBox(
                                    width: AppSize.s50.w,
                                    child: CustomButton(
                                      buttonText: LocaleKeys.Cashing.tr(),
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return ConfirmInvoiceAlertDialog(
                                              priceTL: cart.total!.priceLera,
                                              priceUSD: cart.total!.priceDoler,
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                )
                              ],
                            );
                          } else {
                            return Center(
                                child: Text('لا يوجد منتجات في السلة'));
                          }
                        } else if (state is GetCartLoadingState) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return Center(child: Text('حدث خطأ ما'));
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
