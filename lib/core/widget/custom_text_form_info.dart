import 'package:flutter/material.dart';

Widget customTextFormFiledInfo({required String text, required void Function(String)? onChanged}) {
  return Row(
    children: [
      Expanded(
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      Expanded(
        flex: 3,
        child: TextFormField(
          scribbleEnabled: true,
          cursorHeight: 30,
          onChanged: onChanged,
          decoration: const InputDecoration(
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      )
    ],
  );
}
