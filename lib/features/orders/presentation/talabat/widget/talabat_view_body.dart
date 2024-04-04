import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/custom_balance.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/orders/domain/model/talabat_model.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/talabat_cubit/talabat_cubit.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/talabat_cubit/talabat_state.dart';
import 'package:mandoob/features/orders/presentation/talabat/widget/talabat_old_card.dart';
import 'package:mandoob/features/orders/presentation/talabat/widget/talabat_persent_card.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
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
                if (state is LoadedOldState || state is LoadedPresentState) {
                  var talabatOld =
                      TalabatViewCubit.get(context).talabatOldModel ??
                          TalabatModel.empty();

                  var talabatPresent =
                      TalabatViewCubit.get(context).talabatPresentModel ??
                          TalabatModel.empty();

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
                              LocaleKeys.Orders.tr(),
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
                                  LocaleKeys.NewOrder.tr(),
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
                        onChanged: (value) {
                          TalabatViewCubit.get(context).searchTalabat(value);
                        },
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: LocaleKeys.SearchHere.tr(),
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
                          TL: talabatPresent.balance.totalLera.toString(),
                          USD: talabatPresent.balance.totalDoler.toString(),
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
                                          LocaleKeys.CurrentOrders.tr(),
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
                                          LocaleKeys.PreviousOrders.tr(),
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
                                      height:
                                          MediaQuery.sizeOf(context).height / 2,
                                      child: TabBarView(
                                        children: [
                                          talabatPresent.orders.isNotEmpty
                                              ? ListView.builder(
                                                  shrinkWrap: true,
                                                  physics:
                                                      const ClampingScrollPhysics(),
                                                  itemBuilder: (context,
                                                          index) =>
                                                      PresentOrder(
                                                          talabatPresent:
                                                              TalabatViewCubit.get(
                                                                          context)
                                                                      .filteredPresentOrders[
                                                                  index]),
                                                  itemCount:
                                                      TalabatViewCubit.get(
                                                              context)
                                                          .filteredPresentOrders
                                                          .length,
                                                )
                                              : Container(),
                                          ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            itemBuilder: (context, index) =>
                                                OldOrder(
                                                    talabatOld: TalabatViewCubit
                                                                .get(context)
                                                            .filteredOldOrders[
                                                        index]),
                                            itemCount:
                                                TalabatViewCubit.get(context)
                                                    .filteredOldOrders
                                                    .length,
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  );
                } else if (state is LoadingOldState ||
                    state is LoadingPresentState) {
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
                } else if (state is ErrorOldState ||
                    state is ErrorPresentState) {
                  // Handle the error state
                  return Center(
                      child: Text(
                    LocaleKeys.ErrorLoadingData.tr(),
                  ));
                } else {
                  return Text(
                    LocaleKeys.SomethingError.tr(),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
