import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../cubit/fawater_cubit.dart';

class FawaterView extends StatelessWidget {
   FawaterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FawaterViewBody();
  }
}

class FawaterViewBody extends StatelessWidget {
  FawaterViewBody({Key? key}) : super(key: key);
  final talabatViewCubit = FawaterViewCubit();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => talabatViewCubit,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: ColorManager.transparent,
        drawer: buildDrawer(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: AppSize.s8.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        scaffoldKey.currentState?.openDrawer();
                      },
                      icon:  Icon(Icons.menu,color: Theme.of(context).primaryColorLight,),
                    ),
                    Center(
                      child: Text(
                        'الفواتير',
                        style: getBoldSegoeStyle(
                          fontSize: 25,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                    SizedBox()
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
                    hintStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                    fillColor:Theme.of(context).primaryColorDark,
                  ),
                ),
                SizedBox(height: AppSize.s6.h),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: ColorManager.shadowColor,
                        blurRadius: 9,
                        spreadRadius: 8,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      BlocBuilder<FawaterViewCubit, FawaterViewState>(
                        builder: (context, state) {
                          return DefaultTabController(
                            length: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                 TabBar(
                                  indicatorColor: Colors.black,
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        'فواتير التجار ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context).primaryColor,  // Change this to your desired text color
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'فواتير الموردين ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color:Theme.of(context).primaryColor,  // Change this to your desired text color
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppSize.s70.h,
                                  child: TabBarView(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'الكمية:  2طن و 5 كيلو و 5 شكارة ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'الأنواع:  شامبو - شاور - صابون ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'السعر :  625436 ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'التاجر:  محمد ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'التاريخ : 24-11-2022 ',
                                                      style: getBoldSegoeStyle(
                                                        fontSize: 18,
                                                        color:
                                                            ColorManager.grey3,
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.pushNamed(context, Routes.fawaterTagerDetails);

                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets.only(
                                                                left: 8),
                                                        child: Text(
                                                          "التفاصيل",
                                                          style: TextStyle(
                                                            color: ColorManager
                                                                .babyBlue,
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 12),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'الكمية:  2طن و 5 كيلو و 5 شكارة ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'الأنواع:  شامبو - شاور - صابون ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'السعر :  625436 ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'التاجر:  محمد ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'التاريخ : 24-11-2022 ',
                                                      style: getBoldSegoeStyle(
                                                        fontSize: 18,
                                                        color:
                                                            ColorManager.grey3,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Text(
                                                        "التفاصيل",
                                                        style: TextStyle(
                                                          color: ColorManager
                                                              .babyBlue,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 12),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'الكمية:  2طن و 5 كيلو و 5 شكارة ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'الأنواع:  شامبو - شاور - صابون ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'السعر :  625436 ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'التاريخ : 24-11-2022 ',
                                                      style: getBoldSegoeStyle(
                                                        fontSize: 18,
                                                        color:
                                                            ColorManager.grey3,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Text(
                                                        "التفاصيل",
                                                        style: TextStyle(
                                                          color: ColorManager
                                                              .babyBlue,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 12),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0, vertical: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'الكمية:  2طن و 5 كيلو و 5 شكارة ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'الأنواع:  شامبو - شاور - صابون ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Text(
                                                  'السعر :  625436 ',
                                                  style: getBoldSegoeStyle(
                                                    fontSize: 18,
                                                    color: ColorManager.grey3,
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'التاريخ : 24-11-2022 ',
                                                      style: getBoldSegoeStyle(
                                                        fontSize: 18,
                                                        color:
                                                            ColorManager.grey3,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 8),
                                                      child: Text(
                                                        "التفاصيل",
                                                        style: TextStyle(
                                                          color: ColorManager
                                                              .babyBlue,
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(height: 12),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  decoration: BoxDecoration(
                                                      color: Colors.grey,
                                                      border: Border.all(
                                                          color: Colors.grey,
                                                          width: 1)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
