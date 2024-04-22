import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/add_order_cubit/new_talabat_cubit.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/add_order_cubit/new_talabat_state.dart';
import 'package:mandoob/features/orders/presentation/talabat/widget/cardNewTalabat.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NewTalabat extends StatelessWidget {
  const NewTalabat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NewTalabatViewBody();
  }
}

class NewTalabatViewBody extends StatelessWidget {
  NewTalabatViewBody({Key? key}) : super(key: key);
  final TextEditingController _searchController = TextEditingController();

  Set<String> getProductNamesSet(BuildContext context) {
    final products =
        NewTalabatCubit.get(context).companyProductsModel?.products ?? [];
    final namesSet = <String>{};
    for (var product in products) {
      namesSet.add(translateString(
          context: context,
          arString: product.nameAr,
          enString: product.nameEn));
    }
    return namesSet;
  }

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
            if (state is NewTalabatLoading || state is AddTalabatLoading) {
              return const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: CircularProgressIndicator.adaptive())],
              );
            } else if (state is AddTalabatSuccess) {
              Future.microtask(() {
                Navigator.pushReplacementNamed(
                  context,
                  Routes.homeRoute,
                );
              });
              return SizedBox();
            } else if (state is! NewTalabatFailure) {
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
                              controller: _searchController,
                              scribbleEnabled: true,
                              cursorHeight: 30,
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                              ),
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.search),
                                hintText: 'ابحث هنا',
                                filled: true,
                                hintStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                                fillColor: Theme.of(context).primaryColorDark,
                              ),
                              onChanged: (searchText) {},
                            ),
                          ),
                          const SizedBox(
                            width: AppSize.s20,
                          ),
                          InkWell(
                            onTap: () {
                              final productNamesSet =
                                  getProductNamesSet(context);
                              showMenu(
                                context: context,
                                position: const RelativeRect.fromLTRB(
                                    0, 200, 100, 100),
                                items: <PopupMenuItem<String>>[
                                  ...productNamesSet.map((name) {
                                    return PopupMenuItem(
                                      value: name,
                                      child: Text(
                                        name,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ), // قيمة كل عنصر في القائمة
                                    );
                                  }).toList(),
                                  PopupMenuItem(
                                    value: 'remove_filters',
                                    child: Text(
                                      'إزالة جميع الفلاتر',
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ), // قيمة خاصة لتحديد هذا الخيار
                                  ),
                                ],
                              ).then((selectedValue) {
                                if (selectedValue != null) {
                                  if (selectedValue == 'remove_filters') {
                                    context
                                        .read<NewTalabatCubit>()
                                        .setSelectedProductName(null);
                                  } else {
                                    context
                                        .read<NewTalabatCubit>()
                                        .setSelectedProductName(selectedValue);
                                  }
                                }
                              });
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
                      ListView.builder(
                        itemBuilder: (context, index) {
                          final product = NewTalabatCubit.get(context)
                              .companyProductsModel!
                              .products[index];
                          if (context
                                      .watch<NewTalabatCubit>()
                                      .selectedProductName ==
                                  null ||
                              context
                                      .watch<NewTalabatCubit>()
                                      .selectedProductName ==
                                  translateString(
                                      context: context,
                                      enString: product.nameEn,
                                      arString: product.nameAr)) {
                            return CardNewOrder(product: product);
                          } else {
                            return Container();
                          }
                        },
                        shrinkWrap: true,
                        itemCount: NewTalabatCubit.get(context)
                                .companyProductsModel
                                ?.products
                                .length ??
                            0,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      SizedBox(
                        height: AppSize.s8.h,
                      ),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 1.5,
                          child: CustomButton(
                            onPressed: () {
                              NewTalabatCubit.get(context).sendProducts(context);
                            },
                            buttonText: LocaleKeys.add.tr(),
                          ))
                    ],
                  ),
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: Text(state.massage))],
              );
            }
          },
        ),
      ),
    );
  }
}
