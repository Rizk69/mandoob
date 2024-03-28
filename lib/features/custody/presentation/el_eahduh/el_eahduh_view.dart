import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/trader/presentation/cubit/get_trade/trade_cubit.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../cubit/el_eahduh/eahduh_cubit.dart';

class ElEahduh extends StatelessWidget {
  ElEahduh({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: buildDrawer(context),
        key: scaffoldKey,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => instance<TradeCubit>()..getTrade()),
            BlocProvider(
              create: (_) => instance<EahduhCubit>()..getEahduhOrder(),
            ),
          ],
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: SingleChildScrollView(
              child: BlocConsumer<EahduhCubit, EahduhState>(
                listener: (context, state) {
                  if (state is AddProductToCartSuccessState) {
                    final snackBar = defaultSnakeBar(
                      title: LocaleKeys.SUCCESS.tr(),
                      message: "تم اضافه المنتج بنجاح",
                      state: ContentType.success,
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                    EahduhCubit.get(context)..getEahduhOrder();
                  }


                  if (state is AddProductToCartErrorState) {
                    final snackBar = defaultSnakeBar(
                      title: LocaleKeys.ERROR.tr(),
                      message: "يجب اضافة تاجر اولا",
                      state: ContentType.failure,
                    );
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(snackBar);
                  }
                },
                builder: (context, state) {
                  if (state is GetEahduhLoadedState || state is AddEahduhSuccessState || state is AddProductToCartSuccessState|| state is ActiveTradeErrorState|| state is AddProductToCartErrorState) {
                    var cubit = EahduhCubit.get(context);
                    var data = cubit.orderModel;
                    return Column(
                      children: [
                        SizedBox(height: AppSize.s8.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                            Center(
                              child: Text(
                                'العهدة',
                                style: getBoldSegoeStyle(
                                    fontSize: 25,
                                    color: Theme.of(context).primaryColorLight),
                              ),
                            ),
                            IconButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, Routes.homeRoute);
                                },
                                icon: Icon(
                                  Icons.arrow_forward,
                                  color: Theme.of(context).primaryColorLight,
                                ))
                          ],
                        ),
                        SizedBox(height: AppSize.s4.h),
                        TextFormField(
                          scribbleEnabled: true,
                          cursorHeight: 30,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            hintText: 'ابحث هنا',
                            filled: true,
                            hintStyle: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                            fillColor: Theme.of(context).primaryColorDark,
                          ),
                        ),
                        SizedBox(height: AppSize.s4.h),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p20,
                            vertical: AppPadding.p18,
                          ),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColorDark,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: ColorManager.shadowColor,
                                blurRadius: 4,
                                spreadRadius: 2,
                              )
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              columnCard(
                                title:
                                    data?.balance.totalDoler.toString() ?? '',
                                colorTitle: ColorManager.greenLight,
                                des: "دولار",
                              ),
                              Container(
                                height: AppSize.s98,
                                width: 2,
                                color: ColorManager.gray,
                              ),
                              columnCard(
                                title: data?.balance.totalLera.toString() ?? '',
                                colorTitle: ColorManager.orangeLight,
                                des: "لير",
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: AppSize.s2.h),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                LocaleKeys.Trader.tr(),
                                style: TextStyle(
                                  fontSize: AppSize.s20.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 3,
                                child: BlocConsumer<TradeCubit, TradeState>(
                                  listener: (context, state) {
                                    if (state is ActiveTradeErrorState) {
                                      final snackBar = defaultSnakeBar(
                                        title: LocaleKeys.ERROR.tr(),
                                        message: LocaleKeys.ERROR.tr(),
                                        state: ContentType.failure,
                                      );
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);

                                    }

                                    if (state is ActiveTradeLoadedState) {
                                      final snackBar = defaultSnakeBar(
                                        title: LocaleKeys.SUCCESS.tr(),
                                        message: LocaleKeys.SUCCESS.tr(),
                                        state: ContentType.success,
                                      );
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(snackBar);

                                      TradeCubit.get(context).getTrade();

                                    }
                                  },
                                  builder: (context, state) {
                                    List<DropdownMenuItem<String>> tradeItems =
                                        [
                                      DropdownMenuItem(

                                        value: '-1',
                                        child: Row(
                                          children: [
                                            Icon(
                                              Icons.add,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            const SizedBox(width: 8),
                                            Text(
                                              LocaleKeys.addNewTrade.tr(),
                                              style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ];

                                    // Variable to hold the current selected value for the dropdown
                                    String? currentDropdownValue;

                                    // Check if the state has loaded and there are trades to display
                                    if (state is GetTradeLoadedState &&
                                        state.model?.trades != null) {
                                      // Extend the tradeItems list with items from the trades list
                                      tradeItems.addAll(
                                        state.model!.trades!.map((trade) {
                                          return DropdownMenuItem(
                                            value: trade.id.toString(),
                                            // Ensure each trade has a unique id value
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(50),
                                                  child: Image.network(
                                                    trade.img,
                                                    height: 50,
                                                    width: 50,
                                                    fit: BoxFit.fitHeight,
                                                  ),
                                                ),
                                                const SizedBox(width: 8),
                                                Text(
                                                  trade.customerName,
                                                  style: TextStyle(
                                                    color: Theme.of(context)
                                                        .primaryColor,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      );
                                      currentDropdownValue =
                                          currentDropdownValue ??
                                              tradeItems.first.value;
                                    }

                                    // DropdownButtonFormField with updated logic
                                    return DropdownButtonFormField<String>(
                                      decoration: InputDecoration(
                                        filled: true,
                                          fillColor:Theme.of(context).primaryColorDark,
                                      ),
                                      value: currentDropdownValue,
                                      items: tradeItems,
                                      onChanged: (value) {
                                        if (value == '-1') {
                                          Navigator.pushNamed(
                                              context, Routes.newTrader);
                                        } else {
                                          currentDropdownValue = value;
                                          TradeCubit.get(context)
                                              .activeTrade(int.parse(value!));
                                        }
                                      },
                                      hint: Text(LocaleKeys.addNewTrade.tr()),
                                    );
                                  },
                                ))
                          ],
                        ),
                        SizedBox(height: AppSize.s6.h),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                          child: GridView.builder(
                            gridDelegate:
                                 SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 0.75,
                              mainAxisSpacing: 2.0,
                              crossAxisSpacing: AppSize.s2.w,
                            ),
                            itemCount: data?.data.length ??
                                0, // Ensure data is not null
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                padding: const EdgeInsets.only(top: 15),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColorDark,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: data?.data[index].image != null &&
                                              data?.data[index].image != ''
                                          ? Image.network(
                                              data?.data[index].image,
                                              height: AppSize.s13.h,
                                            )
                                          : Image.asset(
                                              'assets/images/product.png',
                                              height: AppSize.s13.h,
                                            ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        border: Border.all(
                                            color: Colors.grey[200]!, width: 1),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Column(
                                            children: [
                                              Text(

                                                translateString(context: context,
                                                enString: data?.data[index].nameEn,
                                                  arString:data?.data[index].nameAr ,
                                                ),
                                                style: TextStyle(
                                                  fontSize: AppSize.s20.sp,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                maxLines: 1,
                                              ),
                                              Text(
                                                '${data?.data[index].count} عبوة ',
                                                style: TextStyle(
                                                  fontSize: 18,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                              Text(
                                                '${data?.data[index].priceLera} ليررة',
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.green,
                                                ),
                                              )
                                            ],
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              data.data[index].favoriteProduct
                                                  ? cubit.deleteFavorite(
                                                      id: data.data[index].id)
                                                  : cubit.addFavorite(
                                                      id: data.data[index].id);
                                            },
                                            icon: Icon(
                                              Icons.star,
                                              color: data!.data[index]
                                                      .favoriteProduct
                                                  ? Colors.orange
                                                  : Colors.grey,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    GestureDetector(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).hoverColor,
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(15),
                                            bottomRight: Radius.circular(15),
                                          ),
                                        ),
                                        child: const Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.shopping_cart,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                            SizedBox(width: 8),
                                            Text(
                                              'السلة',
                                              style: TextStyle(
                                                fontSize: 27,
                                                color: Colors.white,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      onTap: (){
                                        EahduhCubit.get(context).addProductToCart( data.data[index].id);
                                      },
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else if (state is GetEahduhLoadingState ||
                      state is AddEahduhLoadingState ||
                      state is DeleteEahduhLoadingState) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 2,
                        ),
                        const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      ],
                    );
                  } else if (state is GetEahduhErrorState) {
                    return Text(state.message);
                  } else {
                    return Container();
                  }
                },
              ),
            ),
          ),
        ));
  }

  Widget columnCard(
      {required String title, required Color colorTitle, required String des}) {
    return Column(
      children: [
        Text(title, style: getBoldInterStyle(color: colorTitle, fontSize: 27)),
        Text(des,
            style: getBoldInterStyle(color: ColorManager.gray, fontSize: 20))
      ],
    );
  }
}
