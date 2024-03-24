import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'cubit/eahduh_cubit.dart';

class ElEahduh extends StatelessWidget {
  ElEahduh({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: buildDrawer(context),
      key: scaffoldKey,
      body: BlocProvider(
        create: (_) => instance<EahduhCubit>()..getEahduhOrder(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: SingleChildScrollView(
            child: BlocBuilder<EahduhCubit, EahduhState>(
              builder: (context, state) {
                if (state is GetEahduhLoadedState ||
                    state is AddEahduhSuccessState ||
                    state is AddEahduhSuccessState) {
                  var cubit = EahduhCubit.get(context);
                  var data = cubit.orderModel;
                  return Column(
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
                              'العهدة',
                              style: getBoldSegoeStyle(
                                  fontSize: 25, color: Theme.of(context).primaryColorLight),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.homeRoute);
                              },
                              icon: Icon(Icons.arrow_forward,color: Theme.of(context).primaryColorLight,))
                        ],
                      ),
                      SizedBox(height: AppSize.s4.h),
                      TextFormField(
                        scribbleEnabled: true,
                        cursorHeight: 30,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ),
                        decoration:  InputDecoration(
                          prefixIcon: Icon(Icons.search),
                          hintText: 'ابحث هنا',
                          filled: true,
                          hintStyle: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                          fillColor:Theme.of(context).primaryColorDark,
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
                              blurRadius: 4,
                              spreadRadius: 2,
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            columnCard(
                              title: data?.balance.totalDoler.toString() ?? '',
                              colorTitle: ColorManager.greenLight,
                              des: "دولار",
                            ),
                            Container(
                              height: AppSize.s98,
                              width: 2,
                              color: ColorManager.gray,
                            ),
                            columnCard(
                              title: data?.balance.totalLera.toString() ?? '',
                              colorTitle: ColorManager.orangeLight,
                              des: "لير",
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSize.s6.h),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                        child: GridView.builder(
                          gridDelegate:
                              new SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 2.0,
                            crossAxisSpacing: 1.0,
                          ),
                          itemCount:
                              data?.data.length ?? 0, // Ensure data is not null
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              padding: EdgeInsets.only(top: 15),
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColorDark,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Image.asset(
                                      'assets/images/product.png',
                                      height: AppSize.s13.h,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      border: Border.all(
                                          color: Colors.grey[200]!, width: 1),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Column(
                                          children: [
                                            Text(
                                              data?.data[index].nameAr ?? '',
                                              style: TextStyle(
                                                fontSize: 27,
                                                color: Theme.of(context).primaryColor,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '${data?.data[index].count} عبوة ',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Theme.of(context).primaryColor,
                                              ),
                                            ),
                                            Text(
                                              '${data?.data[index].priceLera} ليررة',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.green,
                                              ),
                                            )
                                          ],
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            data.data[index].favoriteProduct
                                                ? cubit.deleteEahduhOrder(
                                                    id: data.data[index].id)
                                                : cubit.addEahduhOrder(
                                                    id: data.data[index].id);
                                          },
                                          icon: Icon(
                                            Icons.star,
                                            color: data!
                                                    .data[index].favoriteProduct
                                                ? Colors.orange
                                                : Colors.grey,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Spacer(),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).hoverColor,
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.shopping_cart,
                                          color: Colors.white,
                                          size: 30,
                                        ),
                                        SizedBox(width: 8),
                                        Text(
                                          'السلة',
                                          style: TextStyle(
                                            fontSize: 27,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  );
                } else if (state is GetEahduhLoadingState ||
                    state is AddEahduhLoadingState ||
                    state is DeleteEahduhLoadingState) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 2,
                      ),
                      Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    ],
                  );
                } else if (state is GetEahduhErrorState) {
                  return Text(state.message);
                } else {
                  return Container();
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
