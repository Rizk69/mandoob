import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mandoob/core/resources/assets_manager.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';
import 'package:mandoob/core/resources/values_manager.dart';

class CustomAppBar extends StatelessWidget {


  String? title;
  final VoidCallback onTap;

  CustomAppBar({super.key, this.title,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p16, top: AppPadding.p20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: onTap,
            child: SizedBox(
                height: AppSize.s36,
                width: AppSize.s36,
                child: SvgPicture.asset(ImageAssets.arrow)),
          ),
          const SizedBox(
            width: AppSize.s18,
          ),
          Text(
            title??"",
            style: getRegularOpenSansStyle(
                color: ColorManager.blueAccent, fontSize: AppSize.s20),
          ),
        ],
      ),
    );
  }
}
