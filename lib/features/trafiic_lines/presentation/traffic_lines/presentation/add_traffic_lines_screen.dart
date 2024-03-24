import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/core/widget/custom_text_form_info.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/trader/presentation/cubit/get_trade/trade_cubit.dart';
import 'package:mandoob/features/trafiic_lines/domain/model/traffic_line_model.dart';
import 'package:mandoob/features/trafiic_lines/presentation/cubit/trafficlines_cubit.dart';
import 'package:mandoob/features/trafiic_lines/presentation/traffic_lines/widget/time_line_tite.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddTrafficLines extends StatelessWidget {
  AddTrafficLines({Key? key}) : super(key: key);

  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  final _dateController = TextEditingController();
  String customerId = '';

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      top: false,
      child: Scaffold(
          drawer: buildDrawer(context),
          key: scaffoldKey,
          backgroundColor: ColorManager.backGround,
          body: MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => instance<TradeCubit>()..getTrade()),
              BlocProvider(create: (context) => instance<TrafficLinesCubit>()),
            ],
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: AppSize.s6.h,
                    ),
                    HeaderScreen(
                        functionDrawer: () {
                          scaffoldKey.currentState?.openDrawer();
                        },
                        title: LocaleKeys.addTrafficLine.tr(),
                        functionIcon: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(height: AppSize.s4.h),
                    BlocConsumer<TrafficLinesCubit, TrafficLinesState>(
                      listener: (context, state) {

                        if(state is AddTrafficLinesLoaded){
                          final snackBar = defaultSnakeBar(
                            title: LocaleKeys.SUCCESS.tr(),
                            message: LocaleKeys.SUCCESS.tr(),
                            state: ContentType.success,
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);

                          Navigator.popAndPushNamed(context, Routes.homeRoute);
                        }

                        if(state is AddTrafficLinesError){
                          final snackBar = defaultSnakeBar(
                            title: LocaleKeys.ERROR.tr(),
                            message: LocaleKeys.ERROR.tr(),
                            state: ContentType.failure,
                          );
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);

                        }

                      },
                      builder: (context, state) {
                        return Column(
                          children: [
                            Row(
                              children: [
                                 Expanded(
                                  child: Text(
                                    LocaleKeys.Trader.tr(), // "تاريخ الذهاب"
                                    style: TextStyle(
                                      fontSize: AppSize.s20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child:   BlocBuilder<TradeCubit, TradeState>(
                                    builder: (context, state) {
                                      List<DropdownMenuItem<String>> tradeItems = [];
                                      tradeItems.add(
                                        DropdownMenuItem(
                                          value: LocaleKeys.addNewTrade.tr(),
                                          child: Row(
                                            children: [
                                              const Icon(Icons.add),
                                              SizedBox(width: AppSize.s3.w,),
                                              Text(LocaleKeys.addNewTrade.tr()),
                                            ],
                                          ),
                                        ),
                                      );
                                      if (state is GetTradeLoadedState && state.model?.trades != null) {
                                        tradeItems.addAll(
                                          state.model!.trades!.map(
                                                (trade) => DropdownMenuItem(
                                              value: trade.id.toString(),
                                              child: Row(
                                                children: [
                                                  ClipRRect(
                                                    borderRadius: BorderRadius.circular(50), // حواف الصورة دائرية
                                                    child: Image.network(
                                                      trade.img,
                                                      height: 50,
                                                      width: 50,
                                                      fit: BoxFit.fitHeight,
                                                    ),
                                                  ),
                                                  SizedBox(width: AppSize.s2.w,),
                                                  Text(trade.customerName),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      return DropdownButtonFormField<String>(
                                        decoration: const InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                        ),
                                        items: tradeItems,
                                        onChanged: (value) {
                                          if (value == LocaleKeys.addNewTrade.tr()) {
                                            Navigator.pushNamed(context, Routes.newTrader);
                                          } else {
                                            customerId = value!;
                                            // هنا يمكن التعامل مع اختيار تاجر معين
                                          }
                                        },
                                        hint: Text(LocaleKeys.selectTrader.tr()),
                                      );
                                    },
                                  )
                                )
                              ],
                            ),
                            SizedBox(height: AppSize.s2.h,),
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    LocaleKeys.departureDate.tr(), // "تاريخ الذهاب"
                                    style:  TextStyle(
                                      fontSize: AppSize.s20.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: TextFormField(
                                    controller: _dateController, // استخدام TextEditingController
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      suffixIcon: IconButton(
                                        icon: Icon(Icons.calendar_today),
                                        onPressed: () async {
                                          // استخدام showDatePicker لإظهار اختيار التاريخ
                                          final DateTime? pickedDate = await showDatePicker(
                                            context: context,
                                            initialDate: DateTime.now(), // تاريخ البداية للتقويم
                                            firstDate: DateTime(2000), // أقدم تاريخ يمكن اختياره
                                            lastDate: DateTime(2025), // أحدث تاريخ يمكن اختياره
                                          );
                                          if (pickedDate != null) {
                                            // تحديث نص TextFormField بالتاريخ المختار
                                            _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: AppSize.s12.h),
                            SizedBox(
                                width:
                                MediaQuery.of(context).size.width * 1.5,
                                child: CustomButton(
                                  onPressed: () {
                                    TrafficLinesCubit.get(context).addTrafficLine(
                                      date: _dateController.text,
                                      customerId: customerId,
                                    );
                                  },
                                  buttonText: LocaleKeys.add.tr(),
                                ))
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
