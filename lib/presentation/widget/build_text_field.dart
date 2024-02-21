import 'package:flutter/material.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:mandoob/presentation/resources/styles_manager.dart';
import 'package:mandoob/presentation/resources/values_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuildTextField extends StatelessWidget {
  TextEditingController controller;
  String hintText;
  BuildContext context;
  String? labelText;
  String? title;
  bool? isObscure;
  void Function(String s) onChange;


  BuildTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.context,
      required this.onChange,
      this.labelText,
      this.title,
      this.isObscure});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title!,
          style: getRegularOpenSansStyle(
              color: ColorManager.titleGrey, fontSize: AppSize.s18.sp),
        ),
        SizedBox(
          height: AppSize.s05.h,
        ),
        TextField(
            keyboardType: TextInputType.name,
            controller: controller,
            onChanged:onChange,
            obscureText: isObscure??false,
            textInputAction: TextInputAction.next,
            style: getRegularInterStyle(color: ColorManager.fieldGreyColor,fontSize: AppSize.s16.sp),
            autofillHints: const [AutofillHints.name],
            decoration: InputDecoration(
                hintText: hintText,
                labelText: labelText ?? "",
              filled: true,
              fillColor: ColorManager.paleGrey,

            )),
      ],
    );
  }
}
