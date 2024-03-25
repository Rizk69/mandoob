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
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/trafiic_lines/domain/model/traffic_line_model.dart';
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
                BlocConsumer<TrafficLinesCubit, TrafficLinesState>(
                  listener: (context, state) {
                    if (state is DeleteTrafficLinesLoaded) {
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

                    if (state is DeleteTrafficLinesError) {
                      final snackBar = defaultSnakeBar(
                        title: LocaleKeys.ERROR.tr(),
                        message: state.message,
                        state: ContentType.failure,
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    }
                  },
                  builder: (context, state) {
                    var cubit = TrafficLinesCubit.get(context);

                    TrafficModel? currentData;

                    if (state is GetTrafficLinesLoaded) {
                      currentData = state.model;
                    }
                    if (state is SearchTrafficSuccessState) {
                      currentData = state.model;
                    }

                    bool hasData =
                        currentData != null && currentData.data.isNotEmpty;

                    final data = cubit.trafficModel?.data;
                    return Column(
                      children: [
                        TextFormField(
                          scribbleEnabled: true,
                          cursorHeight: 30,
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          onChanged: (value) {
                            cubit.searchTraffic(value);
                          },
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search),
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.date_range,
                                color: ColorManager.grey2,
                              ),
                              onPressed: () async {
                                final selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                  builder:
                                      (BuildContext context, Widget? child) {
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

                                if (selectedDate != null) {
                                  // هنا نستدعي دالة التصفية بالتاريخ
                                  cubit.filterTrafficByDate(selectedDate);
                                }
                              },
                            ),
                            hintText: LocaleKeys.searchHere.tr(),
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
                                vertical: 30, horizontal: 15),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorDark,
                                borderRadius: BorderRadius.circular(20)),
                            child: EasyDateTimeLine(
                              activeColor: Theme.of(context).primaryColor,
                              initialDate: DateTime.now(),
                              locale:
                                  isCurrentLanguageEn(context) ? "en" : 'ar',
                              onDateChange: (selectedDate) {
                                cubit.selectTime(selectedDate);
                                cubit.getTrafficLinesForDate(selectedDate);
                              },
                              headerProps: EasyHeaderProps(
                                  monthPickerType: MonthPickerType.switcher,
                                  dateFormatter: DateFormatter.fullDateDMY(),
                                  monthStyle: TextStyle(
                                      color: Theme.of(context).primaryColor)),
                              dayProps: EasyDayProps(
                                  dayStructure: DayStructure.dayStrDayNum,
                                  activeDayStyle: DayStyle(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color(0xffD9D9D9),
                                          Color(0xff05138B),
                                        ],
                                      ),
                                    ),
                                    // Set the text color here
                                  ),
                                  borderColor: Theme.of(context).primaryColor,
                                  todayStyle: DayStyle(
                                      dayStrStyle: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor))),
                            )),
                        SizedBox(height: AppSize.s1.h),
                        ConditionalBuilder(
                          condition: (state is GetTrafficLinesLoaded ||
                                  state is SelectTimeSuccessState ||
                                  state is SearchTrafficSuccessState) &&
                              hasData,
                          builder: (context) {
                            return cubit.trafficModel?.data==0
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: AppSize.s1.h,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "اضافة خط سير ",
                                              style: getBoldInterStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  fontSize: AppSize.s20.sp),
                                            ),
                                            const Spacer(),
                                            IconButton(
                                                padding: EdgeInsets.zero,
                                                onPressed: () {
                                                  Navigator.pushNamed(context,
                                                      Routes.addtrafficLines);
                                                },
                                                icon: Icon(
                                                  Icons.add,
                                                  size: AppSize.s25.sp,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ))
                                          ],
                                        ),
                                        ListView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const BouncingScrollPhysics(),
                                          itemCount: data?.length,
                                          itemBuilder: (context, index) {
                                            final activeItem =
                                                data?[index].active;
                                            final isFirst = activeItem == 0;
                                            final isLast = activeItem == 0;
                                            final isPast = activeItem == 1;
                                            return Column(
                                              children: [
                                                MyTimeLineTitle(
                                                  isFirst: isFirst,
                                                  isLast: isLast,
                                                  isPast: isPast,
                                                  traderName:
                                                      data![index].customerName,
                                                  address: data[index].address,
                                                  traderId: data[index].id,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  )
                                : Center(
                                    child: Text(
                                      LocaleKeys.NO_CONTENT.tr(),
                                      style: TextStyle(
                                          color:
                                              Theme.of(context).primaryColor),
                                    ),
                                  );
                          },
                          fallback: (context) => (state
                                      is GetTrafficLinesError ||
                                  state is SearchTrafficErrorState)
                              ? Center(
                                  child: Text(
                                    LocaleKeys.NO_CONTENT.tr(),
                                    style: TextStyle(
                                        color: Theme.of(context).primaryColor),
                                  ),
                                )
                              : const CircularProgressIndicator(),
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
