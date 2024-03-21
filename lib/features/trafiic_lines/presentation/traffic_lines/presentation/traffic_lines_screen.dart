import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/trafiic_lines/presentation/cubit/trafficlines_cubit.dart';
import 'package:mandoob/features/trafiic_lines/presentation/traffic_lines/widget/time_line_tite.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TrafficLines extends StatelessWidget {
  TrafficLines({Key? key}) : super(key: key);

  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: buildDrawer(context),
      key: scaffoldKey,
      backgroundColor: ColorManager.backGround,
      body: BlocProvider(
        create: (context) => instance<TrafficLinesCubit>()..getTrafficLines(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: AppSize.s4.h,
                ),
                HeaderScreen(
                    functionDrawer: () {
                      scaffoldKey.currentState?.openDrawer();
                    },
                    title: LocaleKeys.trafficLine.tr(),
                    functionIcon: () {
                      Navigator.pop(context);
                    }),
                SizedBox(height: AppSize.s4.h),
                TextFormField(
                  scribbleEnabled: true,
                  cursorHeight: 30,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.date_range,
                        color: ColorManager.grey2,
                      ),
                      onPressed: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          builder: (BuildContext context, Widget? child) {
                            return Theme(
                              data: ThemeData.light().copyWith(
                                primaryColor: ColorManager.babyBlue,
                                hintColor: ColorManager.babyBlue,
                                colorScheme: ColorScheme.light(
                                    primary: ColorManager.babyBlue),
                              ),
                              child: child!,
                            );
                          },
                        );
                      },
                    ),
                    hintText: LocaleKeys.searchHere.tr(),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: AppSize.s4.h),
                BlocBuilder<TrafficLinesCubit, TrafficLinesState>(
                  builder: (context, state) {
                      var cubit = TrafficLinesCubit.get(context);
                      final data = cubit.trafficModel?.data;
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                            decoration: BoxDecoration(
                                color: ColorManager.white,
                                borderRadius: BorderRadius.circular(20)),
                            child:EasyDateTimeLine(
                              initialDate: DateTime.now(),
                              locale: isCurrentLanguageEn(context) ?"en":'ar',
                              onDateChange: (selectedDate) {
                                cubit.selectTime(selectedDate);
                              },
                              headerProps: const EasyHeaderProps(
                                monthPickerType: MonthPickerType.switcher,
                                dateFormatter: DateFormatter.fullDateDMY(),
                              ),
                              dayProps: const EasyDayProps(
                                dayStructure: DayStructure.dayStrDayNum,
                                activeDayStyle: DayStyle(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color(0xffD9D9D9),
                                        Color(0xff05138B),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ),
                          SizedBox(height: AppSize.s1.h),

                          ConditionalBuilder(
                              condition: state is GetTrafficLinesLoaded || state is SelectTimeSuccessState,
                              builder: (context){
                                return  Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20),
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: data?.length,
                                    itemBuilder: (context, index) {
                                      final activeItem = data?[index].active;
                                      final isFirst = activeItem == 0;
                                      final isLast = activeItem == 0;
                                      final isPast = activeItem == 1;
                                      return Column(
                                        children: [
                                          MyTimeLineTitle(
                                            isFirst: isFirst,
                                            isLast: isLast,
                                            isPast: isPast,
                                            traderName: data![index].customerName,
                                            address: data[index].address,
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              },
                              fallback: (context)=>const CircularProgressIndicator(),
                          ),
                        ],
                      );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
