import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/routes_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';
import 'package:mandoob/core/widget/anmation.dart';
import 'package:mandoob/core/widget/backgrond_image.dart';
import 'package:mandoob/core/widget/custom_buttoms.dart';
import 'package:mandoob/features/custody/presentation/pay_prtial_invoice.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ConfirmInvoiceScreen extends StatelessWidget {
  String title;
  num invoiceNumber;
  bool isCash;
  num priceDoler;
  num priceLera;
  ConfirmInvoiceScreen({super.key, required this.title,required this.invoiceNumber,required this.priceDoler,required this.priceLera,required this.isCash});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          imageBackground(context),
          Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,),
              const Center(child: AnimatedCheck(img: 'assets/images/sucssimage.png')),
              SizedBox(height: AppSize.s4.h,),
              Text(title,style: getBoldSegoeStyle(fontSize: 25, color: Theme.of(context).primaryColor),),
              SizedBox(height: AppSize.s18.h,),
              Column(
                children: [
                  SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CustomButton(onPressed: (){
                        Navigator.pushReplacementNamed(context, Routes.invoiceDetails,
                            arguments: invoiceNumber);
                      }, buttonText:"الفاتورة" )),

                  SizedBox(height: AppSize.s2.h,),
                  if (isCash==false)
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.9,
                      child: CustomButton(onPressed: (){

                        Navigator.pushReplacement(context,MaterialPageRoute(
                            builder: (_) => PayPartialInvoice(
                              invoiceNumber: invoiceNumber,
                              priceDoler: priceDoler,
                              priceLera: priceLera,
                            )));

                      }, buttonText:"دفع جزء من الفاتورة" )),
                ],
              )

            ],
          ),
        ],
      ),
    );
  }
}
