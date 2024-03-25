import 'package:flutter/material.dart';

Widget customTextFormFiledInfo({required String text, required void Function(String)? onChanged,required BuildContext context}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          text,
          style:  TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: TextFormField(
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
          scribbleEnabled: true,
          cursorHeight: 30,
          onChanged: onChanged,
          decoration:  InputDecoration(
            filled: true,
            hintStyle: TextStyle(
              color: Theme.of(context).primaryColor,
            ),
            fillColor: Theme.of(context).primaryColorDark,          ),
        ),
      )
    ],
  );
}
