import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/utiles_app/header_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../home/widget/drawer_home.dart';
import '../../home/widget/stepper_view.dart';
import '../../resources/values_manager.dart';
import '../widget/time_line_tite.dart';

class TrafficLines extends StatelessWidget {
  TrafficLines({Key? key}) : super(key: key);
  final List<String> titles = ['1', '2', '3'];
  final List<String> titlesName = ['تاجر 1', 'تاجر 2', 'تاجر 3'];
  final EasyInfiniteDateTimelineController _controller =
      EasyInfiniteDateTimelineController();
  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      drawer: buildDrawer(context),
      key: scaffoldKey,
      backgroundColor: ColorManager.backGround,
      body: Padding(
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    MyTimeLineTitle(isFirst: true,isLast: false, isPast: true),
                    MyTimeLineTitle(isFirst: false,isLast: false, isPast:true,),
                    MyTimeLineTitle(isFirst: false,isLast: true, isPast: false),

                  ],
                ),
              )
          
                     ],
          ),
        ),
      ),
    );
  }
}

