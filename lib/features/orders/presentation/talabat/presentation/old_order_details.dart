import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/header_screen.dart';
import 'package:mandoob/features/home/presentation/widget/drawer_home.dart';
import 'package:mandoob/features/orders/domain/model/order_details_model.dart';
import 'package:mandoob/features/orders/presentation/talabat/cubit/order_cubit/order_cubit.dart';
import 'package:mandoob/features/orders/presentation/talabat/widget/build_order_details.dart';
import 'package:mandoob/features/orders/presentation/talabat/widget/build_product_details.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class OldOrderDetails extends StatelessWidget {
  final int orderId;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  OldOrderDetails({Key? key, required this.orderId}) : super(key: key);

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
                    child: BlocBuilder<OrderCubit, OrderState>(
                      builder: (context, state) {
                        if (state is GetOrderSuccess) {
                          final orderDetails =
                              context.read<OrderCubit>().orders;
                          if (orderDetails != null &&
                              orderDetails.order != null) {
                            return _buildOrderDetails(context, orderDetails);
                          } else {
                            return Center(
                              child: Text(LocaleKeys.EMPTY_LIST.tr()),
                            );
                          }
                        } else if (state is GetOrderLoading) {
                          return Center(child: CircularProgressIndicator());
                        } else if (state is GetOrderFailure) {
                          return Center(child: Text(state.massage));
                        } else {
                          return Center(child: Text(LocaleKeys.ERROR.tr()));
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

  Widget _buildOrderDetails(
      BuildContext context, OrderDetailsModel orderDetails) {
    final order = orderDetails.order!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 6.h),
        HeaderScreen(
          functionDrawer: () => scaffoldKey.currentState?.openDrawer(),
          title: LocaleKeys.OrderDetails.tr(),
          functionIcon: () => Navigator.pop(context),
        ),
        SizedBox(height: 5.h),
        BuildOrderDetails(order: order),
        ListView.builder(
          itemBuilder: (context, index) =>
              BuildProductDetails(product: orderDetails.products![index]),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: orderDetails.products?.length ?? 0,
        )
      ],
    );
  }
}
