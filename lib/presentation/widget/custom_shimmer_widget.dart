import 'package:flutter/material.dart';
import 'package:mandoob/presentation/resources/values_manager.dart';


class Skelton extends StatelessWidget{
  double? height, width;
  Skelton({super.key, this.height, this.width});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.2),
          borderRadius: BorderRadius.circular(AppSize.s5)
      ),
    );
  }

}