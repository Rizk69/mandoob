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
import 'package:mandoob/features/home/widget/drawer_home.dart';
import 'package:mandoob/features/trader/presentation/cubit/get_trade/trade_cubit.dart';
import 'package:mandoob/features/trader/presentation/widget/trade_item.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../generated/locale_keys.g.dart';

class TraderView extends StatelessWidget {
  const TraderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (_) => instance<TradeCubit>()..getTrade(),
      child: SafeArea(
          top: false,
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                imageBackground(context),
                Scaffold(
                  key: scaffoldKey,
                  backgroundColor: ColorManager.backGround.withOpacity(0.5),
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
                          TextFormField(
                            scribbleEnabled: true,
                            cursorHeight: 30,
                            decoration:  InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: LocaleKeys.searchHere.tr(),
                              filled: true,
                              fillColor: Colors.white,
                            ),
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

                              return Column(
                                children: [
                                  ConditionalBuilder(
                                      condition: state is GetTradeLoadedState,
                                      builder: (context) => ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const BouncingScrollPhysics(),
                                            itemCount:
                                                cubit.model!.trades!.length,
                                            // separatorBuilder: (context,index)=> SizedBox(height: AppSize.s1.h,),
                                            itemBuilder: (context, index) {
                                              final trade =
                                                  cubit.model!.trades![index];
                                              return TradeItem(
                                                imageUrl: trade.img,
                                                customerName:
                                                    trade.customerName,
                                                phone: trade.phone,
                                              );
                                            },
                                          ),
                                      fallback: (context) =>
                                          state is GetTradeErrorState
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
              ],
            ),
          )),
    );
  }
}
