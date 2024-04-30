import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/app/functions.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/order_cubit/order_cubit.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PresentOrderEdit extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final int orderId;

  PresentOrderEdit({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<OrderCubit>()..getOrder(orderId),
      child: SafeArea(
        top: false,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.9),
          child: Stack(
            children: [
              imageBackground(context),
              Scaffold(
                backgroundColor: Colors.transparent,
                key: scaffoldKey,
                drawer: buildDrawer(context),
                body: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: BlocConsumer<OrderCubit, OrderState>(
                      listener: (context, state) {
                        if(state is DeleteOrderSuccess){
                            final snackBar = defaultSnakeBar(
                              title: LocaleKeys.SUCCESS.tr(),
                              message: state.massage.tr(),
                              state: ContentType.success,
                            );
                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);

                            OrderCubit.get(context).getOrder(orderId);

                        }

                        if(state is IncreaseCountSuccess){
                          OrderCubit.get(context).getOrder(orderId);
                        }

                        if(state is DecreaseCountSuccess){
                          OrderCubit.get(context).getOrder(orderId);
                        }
                      },
                      builder: (context, state) {
                        if (state is GetOrderSuccess ) {
                          final order = OrderCubit.get(context).orders!.order;
                          final products = OrderCubit.get(context).orders!.products;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 6.h),
                              HeaderScreen(
                                  functionDrawer: () => scaffoldKey.currentState?.openDrawer(),
                                  title: '${LocaleKeys.OrderEdit.tr()} ${order!.orderNo}',
                                  functionIcon: () => Navigator.pop(context)),
                              SizedBox(height: 5.h),
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 15),
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColorDark,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('${LocaleKeys.OrderNumber.tr()} : ${order.orderNo}',
                                        style: getBoldSegoeStyle(fontSize: 18, color: Theme.of(context).primaryColor)),
                                    const SizedBox(height: 8),
                                    Text('${LocaleKeys.status.tr()} : ${translateString(context: context , arString: order.status_ar,enString:order.status_en )}',
                                        style: getBoldSegoeStyle(fontSize: 18, color: Theme.of(context).primaryColor)),
                                    const SizedBox(height: 8),
                                    Text('${LocaleKeys.date.tr()} : ${order.date}',
                                        style: getBoldSegoeStyle(fontSize: 18, color: Theme.of(context).primaryColor)),
                                  ],
                                ),
                              ),
                              SizedBox(height: 6.h),

                              ListView.builder(
                                itemBuilder: (context, index) {
                                  final product = products[index];
                                  return Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(vertical: 10),
                                        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColorDark,
                                          boxShadow: [
                                            BoxShadow(
                                              color: ColorManager.grey3,
                                              offset: Offset(1, 2),
                                              spreadRadius: 0.1,
                                              blurRadius: 8,
                                            ),
                                          ],
                                          borderRadius: BorderRadius.circular(25),
                                        ),
                                        child: Row(
                                          children: [
                                            Image.network(
                                              product.img,
                                              height: 13.h,
                                              errorBuilder: (context, error, stackTrace) => Image.asset(
                                                'assets/images/product.png',
                                                height: 13.h,
                                              ),
                                            ),
                                            const SizedBox(width: 12),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text(translateString(context: context, enString: product.name_en, arString: product.name_ar),
                                                    style: TextStyle(fontSize: 18, color: Theme.of(context).primaryColor)),
                                                Text('${product.count} ${product.unit_ar}',
                                                    style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor)),
                                              ],
                                            ),
                                            Spacer(),
                                            Column(
                                              children: [
                                                IconButton(
                                                  onPressed: () {
                                                    OrderCubit.get(context).increaseOrder(orderId,  product.id);
                                                  },
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: ColorManager.greenLight,
                                                  ),
                                                ),
                                                Text(
                                                  product.count.toString(),
                                                  style: TextStyle(
                                                    color: Theme.of(context).primaryColor,
                                                  ),
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    OrderCubit.get(context).decreaseOrder(orderId,  product.id);

                                                  },
                                                  icon: Icon(
                                                    Icons.remove,
                                                    color: ColorManager.greenLight,
                                                  ),
                                                ),

                                              ],
                                            ),

                                          ],
                                        ),
                                      ),
                                      Positioned(
                                        top: -1,
                                        right: 20,
                                        child: IconButton(
                                          icon: Icon(Icons.dangerous, color: Colors.red, size: 36),
                                          onPressed: () {
                                            OrderCubit.get(context).deleteOrder(orderId, product.id);
                                          },
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                shrinkWrap: true,
                                itemCount: products!.length,
                                physics: const NeverScrollableScrollPhysics(),
                              ),
                            ],
                          );
                        } else if (state is GetOrderLoading || state is IncreaseCountLoading || state is DecreaseCountLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is GetOrderFailure) {
                          return Center(child: Text(state.massage));
                        } else {
                          return  Center(child: Text(LocaleKeys.EMPTY_LIST.tr()));
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
