import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';

class CustomBalance extends StatelessWidget {

  final String USD;
  final String TL;

  const CustomBalance({super.key, required this.USD , required this.TL});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        columnCard(
          title: USD,
          colorTitle: ColorManager.greenLight,
          des: "السعر دولار",
        ),
        Container(
          height: AppSize.s98,
          width: 2,
          color: ColorManager.gray,
        ),
        columnCard(
          title: TL,
          colorTitle: ColorManager.orangeLight,
          des: "السعر ليرة",
        ),
      ],
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
