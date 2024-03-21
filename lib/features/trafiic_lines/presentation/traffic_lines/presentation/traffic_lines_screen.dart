import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/trafiic_lines/presentation/traffic_lines/widget/time_line_tite.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../cubit/trafficlines_cubit.dart';
import '../widget/event_card.dart';

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
                    title: 'خطوط السير',
                    functionIcon: () {
                      Navigator.pop(context);
                    }),
                SizedBox(height: AppSize.s4.h),
                TextFormField(
                  scribbleEnabled: true,
                  cursorHeight: 30,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
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
                    hintText: 'ابحث هنا',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(height: AppSize.s4.h),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 30, horizontal: 15),
                  decoration: BoxDecoration(
                      color: ColorManager.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: EasyInfiniteDateTimeLine(
                    controller: _controller,
                    firstDate: DateTime(2023),
                    focusDate: DateTime.now(),
                    lastDate: DateTime(2023, 12, 31),
                    onDateChange: (selectedDate) {},
                  ),
                ),
                SizedBox(height: AppSize.s4.h),
                BlocBuilder<TrafficLinesCubit, TrafficLinesState>(
                  builder: (context, state) {
                    if (state is GetTrafficLinesLoaded) {
                      var cubit = TrafficLinesCubit.get(context);

                      final data = cubit.trafficModel?.data;
                      return Padding(
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
                    } else {
                      return const CircularProgressIndicator(); // Placeholder for loading state
                    }
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
