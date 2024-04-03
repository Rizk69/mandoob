import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/custom_balance.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/talabat_cubit.dart';
import 'package:mandoob/features/orders/presentation/talabat/widget/talabat_old_card.dart';
import 'package:mandoob/features/orders/presentation/talabat/widget/talabat_persent_card.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class TalabatViewBody extends StatelessWidget {
  TalabatViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return BlocProvider(
      create: (context) => instance<TalabatViewCubit>()
        ..getPresentTalabat()
        ..getOldTalabat(),
      child: Scaffold(
        key: scaffoldKey,
        drawer: buildDrawer(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: BlocBuilder<TalabatViewCubit, TalabatViewState>(
              builder: (context, state) {
                if (state == TalabatViewState.loadedOld ||
                    state == TalabatViewState.loadedPresent) {
                  var talabatOld =
                      TalabatViewCubit.get(context).talabatOldModel;
                  var talabatPresent =
                      TalabatViewCubit.get(context).talabatPresentModel;
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
                                    Navigator.pushNamed(
                                        context, Routes.newTalab);
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
                        child: CustomBalance(
                          TL: talabatPresent?.balance.totalLera.toString()??"0",
                          USD: talabatPresent?.balance.totalDoler.toString()??"0",
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
                                    height: MediaQuery.sizeOf(context).height/2,
                                    child: TabBarView(
                                      children: [
                                        // تاب الطلبات الحالية
                                        ListView.builder(
                                          shrinkWrap: true, // تجعل القائمة تأخذ حجم محتواها فقط
                                          physics: const ClampingScrollPhysics(), // يُحسن التمرير ضمن TabBarView
                                          itemBuilder: (context, index) => PresentOrder(talabatPresent: talabatPresent!.orders[index]),
                                          itemCount: talabatPresent?.orders.length,
                                        ),
                                        // تاب الطلبات السابقة
                                        ListView.builder(
                                          shrinkWrap: true, // تجعل القائمة تأخذ حجم محتواها فقط
                                          physics: const ClampingScrollPhysics(), // يُحسن التمرير ضمن TabBarView
                                          itemBuilder: (context, index) {
                                            if (talabatOld == null || talabatOld.orders.isEmpty) {
                                              return const SizedBox.shrink();
                                            }
                                            if (index >= talabatOld.orders.length) {
                                              return const SizedBox.shrink();
                                            }
                                            return OldOrder(talabatOld: talabatOld.orders[index]);
                                          },
                                          itemCount: talabatOld?.orders.length ?? 0,
                                        ),
                                      ],
                                    )

                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state == TalabatViewState.loadingOld &&
                    state == TalabatViewState.loadingPresent) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2.1,
                      ),
                      const Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ],
                  );
                } else {
                  return const Text('Somting Error');
                }
              },
            ),
          ),
        ),
      ),
    );
  }


}
