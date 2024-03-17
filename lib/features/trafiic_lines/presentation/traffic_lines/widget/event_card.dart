import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';


class EventCard extends StatelessWidget {
  bool isPast;
  String traderName;
  String address;
   EventCard({super.key, required this.isPast,required this.traderName,required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(

      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      padding: const EdgeInsets.symmetric(vertical: 17,horizontal: 20),
      decoration: BoxDecoration(
        color:isPast? const Color(0XFF020736):const Color(0XFFD9D9D9),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
        Column(
          children: [
            Icon(Icons.location_on_rounded,color: ColorManager.baseColorLight,),
            Text(address,style:getBoldSegoeStyle(fontSize: 15, color: ColorManager.baseColorLight) ,)
          ],
        ),
        Text(traderName,style: getBoldSegoeStyle(fontSize: 25, color: ColorManager.white),),
       isPast? Icon(Icons.done_all,color: ColorManager.baseColorLight,) :Icon(Icons.remove_done_sharp,color: ColorManager.grey2)
      ]),
    );
  }
}
