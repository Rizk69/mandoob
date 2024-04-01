import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/newTalabatCubit.dart';
import 'package:mandoob/features/orders/presentation/talabat/widget/cardNewTalabat.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewTalabat extends StatelessWidget {
  const NewTalabat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewTalabatViewBody();
  }
}

class NewTalabatViewBody extends StatelessWidget {
  const NewTalabatViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: buildDrawer(context),
      body: BlocProvider(
        create: (context) => instance<NewTalabatCubit>()..getCompanyProducts(),
        child: BlocBuilder<NewTalabatCubit, NewTalabatState>(
          builder: (context, state) {
            if (state is NewTalabatSuccess) {
              return SingleChildScrollView(
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
                            icon: Icon(
                              Icons.menu,
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          Center(
                            child: Text(
                              'طلبية جديدة',
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
                              color: Theme.of(context).primaryColorLight,
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: AppSize.s4.h),
                      Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              scribbleEnabled: true,
                              cursorHeight: 30,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
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
                          ),
                          SizedBox(
                            width: AppSize.s20,
                          ),
                          InkWell(
                            onTap: () {
                              showMenu(
                                color: Theme.of(context).primaryColorDark,
                                context: context,
                                position:
                                    RelativeRect.fromLTRB(0, 200, 100, 100),
                                items: [
                                  PopupMenuItem(
                                    child: Text(
                                      'شامبو',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Text(
                                      'شاور',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                  PopupMenuItem(
                                    child: Text(
                                      'صابون',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Column(
                                  children: [
                                    SvgPicture.asset(
                                      IconAssets.filterIcons,
                                      height: 23,
                                    ),
                                    Text(
                                      'تخصيص',
                                      style: getBoldSegoeStyle(
                                        color: ColorManager.babyBlue,
                                        fontSize: AppSize.s15.sp,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: AppSize.s8.h),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return CardNewTalabat();
                        },
                        shrinkWrap: true,
                        itemCount: NewTalabatCubit.get(context)
                                .companyProductsModel
                                ?.products
                                .length ??
                            0,
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is NewTalabatLoading) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: CircularProgressIndicator.adaptive())],
              );
            }
            if (state is NewTalabatFailure) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: Text(state.massage))],
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: Text('ERROR'))],
              );
            }
          },
        ),
      ),
    );
  }
}
