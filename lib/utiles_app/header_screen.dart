import 'package:flutter/material.dart';
import '../presentation/resources/color_manager.dart';
import '../presentation/resources/styles_manager.dart';

class HeaderScreen extends StatelessWidget {
  final VoidCallback functionDrawer;
  final VoidCallback functionIcon;
  final String title;

  const HeaderScreen({
    Key? key,
    required this.functionDrawer,
    required this.title,
    required this.functionIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: functionDrawer,
          icon: const Icon(Icons.menu),
        ),
        Center(
          child: Text(
            title,
            style: getBoldSegoeStyle(fontSize: 25, color: ColorManager.black),
          ),
        ),
        IconButton(
          onPressed: functionIcon,
          icon: const Icon(Icons.arrow_forward),
        ),
      ],
    );
  }
}
