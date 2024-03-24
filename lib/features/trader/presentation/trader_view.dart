import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/trader/domain/model/trades_model.dart';
import 'package:mandoob/features/trader/presentation/cubit/get_trade/trade_cubit.dart';
import 'package:mandoob/features/trader/presentation/widget/trade_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';

class TraderView extends StatelessWidget {
  TraderView({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => instance<TradeCubit>()..getTrade(),
      child: SafeArea(
          top: false,
          child: Container(
            color: Theme.of(context).primaryColorDark,
            child: Stack(
              children: [
                Scaffold(
                  key: scaffoldKey,
                  backgroundColor:Theme.of(context).scaffoldBackgroundColor ,
                  drawer: buildDrawer(context),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Column(
                        children: [
                          SizedBox(
                            height: AppSize.s6.h,
                          ),
                          HeaderScreen(
                              functionDrawer: () {
                                scaffoldKey.currentState?.openDrawer();
                              },
                              title: LocaleKeys.clients.tr(),
                              functionIcon: () {
                                Navigator.pop(context);
                              }),
                          SizedBox(height: AppSize.s5.h),
                          BlocBuilder<TradeCubit, TradeState>(
                            builder: (context, state) {
                              return TextFormField(
                                scribbleEnabled: true,
                                cursorHeight: 30,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                                onChanged: (value) {
                                  TradeCubit.get(context).searchTrade(value);
                                },
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.search),
                                  hintText: LocaleKeys.searchHere.tr(),
                                  hintStyle: TextStyle(
                                    color: Theme.of(context).primaryColor,
                                  ),
                                  filled: true,
                                  fillColor: Theme.of(context).primaryColorDark,
                                ),
                              );
                            },
                          ),
                          SizedBox(height: AppSize.s4.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.newTrader);
                            },
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.add,
                                  size: 23,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  LocaleKeys.newTrade.tr(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: ColorManager.black,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                          BlocBuilder<TradeCubit, TradeState>(
                            builder: (context, state) {
                              var cubit = TradeCubit.get(context);

                              TradeModel? currentData;

                              if (state is GetTradeLoadedState) {
                                currentData = state.model;
                              }
                              if (state is SearchTradesSuccessState) {
                                currentData = state.model;
                              }

                              bool hasData = currentData != null &&
                                  currentData.trades != null &&
                                  currentData.trades!.isNotEmpty;

                              return Column(
                                children: [
                                  ConditionalBuilder(
                                      condition: (state
                                                  is GetTradeLoadedState ||
                                              state
                                                  is SearchTradesSuccessState) &&
                                          hasData,
                                      builder: (context) => ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount:
                                            currentData!.trades!.length,
                                            // separatorBuilder: (context,index)=> SizedBox(height: AppSize.s1.h,),
                                            itemBuilder: (context, index) {
                                              final trade =
                                              currentData!.trades![index];
                                              return TradeItem(
                                                imageUrl: trade.img,
                                                customerName:
                                                    trade.customerName,
                                                phone: trade.phone,
                                              );
                                            },
                                          ),
                                      fallback: (context) => state
                                              is GetTradeErrorState
                                          ? Center(
                                              child: Text(state.message),
                                            )
                                          : state is SearchTradesErrorState
                                              ? Center(
                                                  child: Text(state.message),
                                                )
                                              : const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                )),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                imageBackground(context),

              ],
            ),
          )),
    );
  }
}
