import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/talabat_cubit.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TalabatView extends StatelessWidget {
  const TalabatView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TalabatViewBody();
  }
}

class TalabatViewBody extends StatelessWidget {
  TalabatViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => instance<TalabatViewCubit>()
        ..getOldTalabat()
        ..getPresentTalabat(),
      child: Scaffold(
        key: scaffoldKey,
        drawer: buildDrawer(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BlocBuilder<TalabatViewCubit, TalabatViewState>(
              builder: (context, state) {
                if (state == TalabatViewState.loaded){
                  var talabatOld= TalabatViewCubit.get(context).talabatOldModel;
                  var talabatPresent= TalabatViewCubit.get(context).talabatPresentModel;
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
                              'الطلبيات',
                              style: getBoldSegoeStyle(
                                fontSize: 25,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, Routes.newTalab);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, Routes.newTalab);
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    size: 30,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                ),
                                Text(
                                  'طلبية جديدة',
                                  style: getBoldSegoeStyle(
                                    fontSize: 18,
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                )
                              ],
                            ),
                          )
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
                      SizedBox(height: AppSize.s4.h),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: AppPadding.p20,
                          vertical: AppPadding.p18,
                        ),
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            columnCard(
                              title: talabatPresent?.balance.totalDoler.toString() ??'',
                              colorTitle: ColorManager.greenLight,
                              des: "السعر دولار",
                            ),
                            Container(
                              height: AppSize.s98,
                              width: 2,
                              color: ColorManager.gray,
                            ),
                            columnCard(
                              title: talabatPresent?.balance.totalLera.toString() ??'',
                              colorTitle: ColorManager.orangeLight,
                              des: "السعر ليرة",
                            ),
                          ],
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
                                    crossAxisAlignment:
                                    CrossAxisAlignment.stretch,
                                    children: [
                                      TabBar(
                                        indicatorColor: Colors.black,
                                        tabs: [
                                          Tab(
                                            child: Text(
                                              'الطلبيات الحالية',
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
                                              'الطلبيات السابقة',
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
                                            ListView.builder(itemBuilder: (context, index) => Column(
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
                                                      Text(
                                                        'المواد : شامبو 1 - شامبو 2',
                                                        style: getBoldSegoeStyle(
                                                          fontSize: 18,
                                                          color: Theme.of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      Text(
                                                        'المبلغ  : 4545',
                                                        style: getBoldSegoeStyle(
                                                          fontSize: 18,
                                                          color: Theme.of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      Text.rich(
                                                        TextSpan(
                                                          text: 'الحالة : ',
                                                          style:
                                                          getBoldSegoeStyle(
                                                            fontSize: 18,
                                                            color:
                                                            Theme.of(context)
                                                                .primaryColor,
                                                          ),
                                                          children: [
                                                            TextSpan(
                                                              text: 'جاهزة للصرف',
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                FontWeight
                                                                    .bold,
                                                                color: ColorManager
                                                                    .greenLight, // Change this to your desired color
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      Text(
                                                        'التاريخ :  24-11-2022 ',
                                                        style: getBoldSegoeStyle(
                                                          fontSize: 18,
                                                          color: Theme.of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                        Alignment.centerLeft,
                                                        child: Text(
                                                          'تعديل',
                                                          style: TextStyle(
                                                            color: ColorManager
                                                                .babyBlue,
                                                            fontSize: 18,
                                                            fontWeight:
                                                            FontWeight.w500,
                                                            decoration:
                                                            TextDecoration
                                                                .underline,
                                                          ),
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
                                                                color:
                                                                Colors.grey,
                                                                width: 1)),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),itemCount: talabatPresent?.orders.length)
                                            ,
                                            ListView.builder(itemBuilder: (context, index) =>  Column(
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
                                                            'المواد : شامبو 1 - شامبو 2',
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
                                                        'التاريخ :  24-11-2022 ',
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
                                                                color:
                                                                Colors.grey,
                                                                width: 1)),
                                                      )
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),itemCount: talabatOld?.orders.length)


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
                }else if(state == TalabatViewState.loading ){
                  return const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ],
                  );
                }else {
                  return Text('Somting Error');
                }

              },
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
