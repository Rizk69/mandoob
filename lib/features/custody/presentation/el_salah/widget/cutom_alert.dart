import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/app/di.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/widget/default_snake_bar.dart';
import 'package:mandoob/features/custody/presentation/cubit/el_salah/el_salah_cubit.dart';
import 'package:mandoob/features/custody/presentation/successful_screen.dart';
import 'package:mandoob/features/home/presentation/home_View.dart';
import 'package:mandoob/generated/locale_keys.g.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../core/resources/color_manager.dart';
import '../../../../../core/resources/styles_manager.dart';
import '../../../../../core/resources/values_manager.dart';

class ConfirmInvoiceAlertDialog extends StatelessWidget {
  final String priceUSD;
  final String priceTL;

  ConfirmInvoiceAlertDialog({
    super.key,
    required this.priceUSD,
    required this.priceTL,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<ElSalahCubit>(),
      child: BlocConsumer<ElSalahCubit, ElSalahState>(
          listener: (context, state) {
            if (state is ConfirmDeptInvoiceLoadedState){
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (_) => PopScope(
                  canPop: false,

                  onPopInvoked : (didPop) async {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomeView()), // تعديل هنا بإضافة اسم الشاشة الرئيسية
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: ConfirmInvoiceScreen(
                    invoiceNumber: state.model.invoiceId,
                    title: state.model.message,
                    priceLera:state.model.priceLera ,
                    priceDoler: state.model.priceDoler,
                    isCash: false,
                  ),
                ),
              ));
            }

            if (state is ConfirmCashInvoiceLoadedState){
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (_) => PopScope(
                  canPop: false,

                  onPopInvoked : (didPop) async {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => HomeView()), // تعديل هنا بإضافة اسم الشاشة الرئيسية
                          (Route<dynamic> route) => false,
                    );
                  },
                  child: ConfirmInvoiceScreen(
                    invoiceNumber: state.model.invoiceId,
                    title: state.model.message,
                    priceLera:state.model.priceLera ,
                    priceDoler: state.model.priceDoler,
                    isCash: true,
                  ),
                ),
              ));
            }


            if (state is ConfirmInvoiceErrorState){
              final snackBar = defaultSnakeBar(
                title: LocaleKeys.ERROR.tr(),
                message: state.message,
                state: ContentType.failure,
              );
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            }
            },
        builder: (context, state) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: contentBox(context),
          );
        },
      ),
    );
  }

  Widget contentBox(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColorDark,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        // Use MainAxisSize.min for the content to wrap its height
        children: [
          Text(
            'طريقة الدفع',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: 2.5.h),
          Text(
            'هي سيتم دفع مبلغ ${priceTL.toString()} ليره أو ما يعادلها ${priceUSD.toString()} دولار بشكل كاش أم أجل',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(height: AppSize.s2.h,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                  context,
                  'كاش',
                  MaterialStatePropertyAll<Color>(Theme.of(context).hoverColor),
                  () => ElSalahCubit.get(context).confirmInvoice(0)),
              _buildActionButton(
                  context,
                  'أجل',
                  MaterialStatePropertyAll<Color>(Theme.of(context).primaryColorDark),
                  () => ElSalahCubit.get(context).confirmInvoice(1)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(BuildContext context, String text,
      MaterialStateProperty<Color?>? backgroundColor, VoidCallback onPressed) {
    return ElevatedButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
          const EdgeInsets.symmetric(horizontal: 40, vertical: 13),
        ),
        backgroundColor: backgroundColor,
        shape: MaterialStatePropertyAll<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.s40),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: getBoldSegoeStyle(
          color: Theme.of(context).primaryColor,
          fontSize: AppSize.s20.sp,
        ),
      ),
    );
  }
}
