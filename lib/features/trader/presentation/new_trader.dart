import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/trader/presentation/cubit/add_trade/add_trade_cubit.dart';
import 'package:mandoob/features/trader/presentation/widget/new_trade_info.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../home/widget/drawer_home.dart';

class NewTraderView extends StatelessWidget {
  const NewTraderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (_) => instance<AddTradeCubit>(),
      child: BlocConsumer<AddTradeCubit, AddTradeState>(
        listener: (context, state) {
          if (state is AddTradeLoadedState) {
            Navigator.pushReplacementNamed(context, Routes.sucssufflyAddTrader,
                arguments: SuccessMessageArguments(
                  state.message,
                  LocaleKeys.back.tr(),
                ));
          }
        },
        builder: (context, state) {
          var cubit = AddTradeCubit.get(context);
          return SafeArea(
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
                                  title: LocaleKeys.addNewTrade.tr(),
                                  functionIcon: () {
                                    Navigator.pop(context);
                                  }),
                              SizedBox(height: AppSize.s5.h),
                              customRow(
                                text: LocaleKeys.TradeName.tr(),
                                onChanged: (name) {
                                  cubit.setName(name);
                                },
                              ),
                              SizedBox(height: AppSize.s5.h),
                              customRow(
                                text: LocaleKeys.TradeAddress.tr(),
                                onChanged: (address) {
                                  cubit.setAddress(address);
                                },
                              ),
                              SizedBox(height: AppSize.s5.h),
                              customRow(
                                text: LocaleKeys.TradePhone.tr(),
                                onChanged: (phone) {
                                  cubit.setPhone(phone);
                                },
                              ),
                              SizedBox(height: AppSize.s5.h),
                              Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      LocaleKeys.TradePrice.tr(),
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 16),
                                  // يمكن تعديل القيمة بناءً على تفضيلات التصميم
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.rectangle,
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0),
                                        ),
                                      ),
                                      child: DropdownButton<int>(
                                        value: cubit.tradeObject.price,
                                        elevation: 16,
                                        style: const TextStyle(
                                          color: Colors.black, // لون النص
                                          fontSize: 18, // حجم النص
                                        ),
                                        dropdownColor: Colors.white,
                                        onChanged: (value) {
                                          cubit.setPrice(value!);
                                        },
                                        items: [
                                          DropdownMenuItem(
                                            value: 0,
                                            child: Text(LocaleKeys.retail.tr()),
                                          ),
                                          DropdownMenuItem(
                                            value: 1,
                                            child: Text(
                                              LocaleKeys.wholesale.tr(),
                                            ),
                                          ),
                                          DropdownMenuItem(
                                            value: 2,
                                            child: Text(
                                              LocaleKeys.factoryPrice.tr(),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: AppSize.s12.h),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.9,
                                  child: CustomButton(
                                      onPressed: () {
                                        cubit.addTrade();
                                      },
                                      buttonText: LocaleKeys.add.tr(),))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
