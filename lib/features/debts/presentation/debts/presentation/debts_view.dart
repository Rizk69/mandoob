import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../generated/locale_keys.g.dart';
import '../cubit/debts_cubit.dart';

class DebtsView extends StatelessWidget {
  const DebtsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DebtsViewBody();
  }
}

class DebtsViewBody extends StatelessWidget {
  DebtsViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider<DebtsViewCubit>(
      create: (context) => DebtsViewCubit(),
      child: Scaffold(
        key: scaffoldKey,
        drawer: buildDrawer(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BlocBuilder<DebtsViewCubit, DebtsViewState>(
              builder: (context, state) {
                return Column(
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
                          icon: Icon(
                            Icons.menu,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                        Center(
                          child: Text(
                            LocaleKeys.debts.tr(),
                            style: getBoldSegoeStyle(
                              fontSize: 25,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.homeRoute);
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: AppSize.s4.h),
                    TextFormField(
                      scribbleEnabled: true,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                      cursorHeight: 30,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        hintText: 'ابحث هنا',
                        filled: true,
                        hintStyle: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        fillColor: Theme.of(context).primaryColorDark,
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
                          DefaultTabController(
                            length: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TabBar(
                                  indicatorColor: Colors.black,
                                  tabs: [
                                    Tab(
                                      child: Text(
                                        'ديون  التجار',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .primaryColor, // Change this to your desired text color
                                        ),
                                      ),
                                    ),
                                    Tab(
                                      child: Text(
                                        'ديون المندوب ',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Theme.of(context)
                                              .primaryColor, // Change this to your desired text color
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: AppSize.s64.h,
                                  child: TabBarView(
                                    children: [
                                      ListView.builder(
                                          itemBuilder: (context, index) =>
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 15),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        rowCard(
                                                            title:
                                                                'رقم الطلبية',
                                                            colorTitle:
                                                                ColorManager
                                                                    .black,
                                                            colordes:
                                                                ColorManager
                                                                    .black,
                                                            des: '11',
                                                            context: context),
                                                        SizedBox(height: 8),
                                                        InkWell(
                                                          onTap: () {},
                                                          child: Align(
                                                            alignment: Alignment
                                                                .centerLeft,
                                                            child: Text(
                                                              'تسديد',
                                                              style: TextStyle(
                                                                color:
                                                                    ColorManager
                                                                        .babyBlue,
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                decoration:
                                                                    TextDecoration
                                                                        .underline,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 12),
                                                        Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.grey,
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .grey,
                                                                  width: 1)),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          itemCount: 1),
                                      ListView.builder(
                                        itemBuilder: (context, index) {
                                          // if (talabatOld == null ||
                                          //     talabatOld.orders.isEmpty) {
                                          //   return SizedBox();
                                          // }
                                          //
                                          // if (index >=
                                          //     talabatOld.orders.length) {
                                          //   return SizedBox();
                                          // }
                                          //
                                          // final order =
                                          //     talabatOld.orders[index];
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 8.0,
                                                        vertical: 15),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'المبلغ : ',
                                                          style:
                                                              getBoldSegoeStyle(
                                                            fontSize: 18,
                                                            color: ColorManager
                                                                .grey3,
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 8),
                                                          child: Text(
                                                            "التفاصيل",
                                                            style: TextStyle(
                                                              color:
                                                                  ColorManager
                                                                      .babyBlue,
                                                              fontSize: 20,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      'المبلغ  : 4545',
                                                      style: getBoldSegoeStyle(
                                                        fontSize: 18,
                                                        color:
                                                            ColorManager.grey3,
                                                      ),
                                                    ),
                                                    SizedBox(height: 8),
                                                    Text(
                                                      'التاريخ :  24-11-2022',
                                                      style: getBoldSegoeStyle(
                                                        fontSize: 18,
                                                        color:
                                                            ColorManager.grey3,
                                                      ),
                                                    ),
                                                    SizedBox(height: 12),
                                                    Container(
                                                      width:
                                                          MediaQuery.of(context)
                                                              .size
                                                              .width,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey,
                                                        border: Border.all(
                                                            color: Colors.grey,
                                                            width: 1),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        itemCount: 1,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
                // } else if (state == TalabatViewState.loading) {
                //   return Column(
                //     crossAxisAlignment: CrossAxisAlignment.center,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       SizedBox(
                //         height: MediaQuery.of(context).size.height / 2.1,
                //       ),
                //       const Center(
                //         child: CircularProgressIndicator.adaptive(),
                //       ),
                //     ],
                //   );
                // } else {
                //   return const Text('Somting Error');
                // }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget rowCard(
      {required String title,
      required Color colorTitle,
      required BuildContext context,
      required Color colordes,
      required String des}) {
    return Row(
      children: [
        Text(
          "$title :  ",
          style: getBoldSegoeStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text(
          des,
          style: getBoldSegoeStyle(
            fontSize: 18,
            color: Theme.of(context).primaryColor,
          ),
        )
      ],
    );
  }
}
