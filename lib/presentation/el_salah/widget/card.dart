import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mandoob/presentation/resources/color_manager.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../resources/values_manager.dart';
import '../cubit.dart';

class YourExpandedItem extends StatefulWidget {
  const YourExpandedItem({super.key});

  @override
  _YourExpandedItemState createState() => _YourExpandedItemState();
}

class _YourExpandedItemState extends State<YourExpandedItem> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 25),
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            decoration: BoxDecoration(
              color: ColorManager.white,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.grey3,
                  offset: const Offset(1, 2),
                  spreadRadius: 0.1,
                  blurRadius: 8,
                ),
              ],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/product.png',
                        height: AppSize.s13.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('شامبو حجم كبير'),
                        Text('1 طن'),
                        Text('\$681'),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                if (isExpanded == false) {
                                  isExpanded = true;
                                }
                              });
                              context.read<YourCubit>().addItem();
                            },
                            icon: Icon(
                              Icons.add,
                              color: ColorManager.greenLight,
                            )),
                        Text('${context.read<YourCubit>().countItems}'),
                        IconButton(
                            onPressed: () {
                              context.read<YourCubit>().removeItem();
                            },
                            icon: Icon(
                              Icons.remove,
                              color: ColorManager.greenLight,
                            )),
                      ],
                    ),
                  ],
                ),
                if (isExpanded)
                  const Column(
                    children: [
                      SizedBox(
                        height: 100,
                      )
                    ],
                  ),
              ],
            ),
          ),
        ),
        Positioned(
          top: 0,
          right: 20,
          child: IconButton(
            icon: const Icon(
              Icons.dangerous,
              color: Colors.red,
              size: 36,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
