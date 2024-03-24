import 'package:flutter/material.dart';
import 'package:mandoob/core/resources/color_manager.dart';
import 'package:mandoob/core/resources/styles_manager.dart';


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
          icon:  Icon(Icons.menu,color: Theme.of(context).primaryColorLight),
        ),
        Center(
          child: Text(
            title,
            style: getBoldSegoeStyle(fontSize: 25, color:  Theme.of(context).primaryColorLight),
          ),
        ),
        IconButton(
          onPressed: functionIcon,
          icon:  Icon(Icons.arrow_forward,color: Theme.of(context).primaryColorLight),
        ),
      ],
    );
  }
}
