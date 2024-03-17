import 'package:flutter/material.dart';

class DropdownMenuCustom extends StatefulWidget {
  final List<String> dropdownMenuEntries;
  final String initText;
  const DropdownMenuCustom(
      {Key? key, required this.dropdownMenuEntries, required this.initText})
      : super(key: key);

  @override
  _DropdownMenuCustomState createState() => _DropdownMenuCustomState();
}

class _DropdownMenuCustomState extends State<DropdownMenuCustom> {
  String? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
      ),
      child: DropdownButton<String>(
        value: _selectedItem,
        underline: Container(),
        hint: Text(widget.initText),
        style: const TextStyle(
            fontSize: 23, color: Colors.black, fontWeight: FontWeight.bold),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        borderRadius: BorderRadius.circular(18),
        onChanged: (String? newValue) {
          setState(() {
            _selectedItem = newValue;
          });
        },
        items: widget.dropdownMenuEntries.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
