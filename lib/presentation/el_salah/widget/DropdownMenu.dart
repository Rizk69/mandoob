import 'package:flutter/material.dart';

class DropdownMenuCustom extends StatefulWidget {
  final List<dynamic> dropdownMenuEntries;
  final String initText;
  final Color color;
  const DropdownMenuCustom({
    Key? key,
    required this.dropdownMenuEntries,
    required this.initText,
    required this.color,
  }) : super(key: key);

  @override
  _DropdownMenuCustomState createState() => _DropdownMenuCustomState();
}

class _DropdownMenuCustomState extends State<DropdownMenuCustom> {
  dynamic _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.color,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
      ),
      child: DropdownButton<dynamic>(
        value: _selectedItem,
        underline: Container(),
        hint: Text(widget.initText),
        style: const TextStyle(
          fontSize: 23,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        borderRadius: BorderRadius.circular(18),
        onChanged: (dynamic newValue) {
          setState(() {
            _selectedItem = newValue;
          });
        },
        items: widget.dropdownMenuEntries.map<DropdownMenuItem<dynamic>>((dynamic value) {
          return DropdownMenuItem<dynamic>(
            value: value,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(value.toString()),
            ),
          );
        }).toList(),
      ),
    );
  }
}




class DropdownMenuItemModel {
  final String? text;
  final Widget? widget;

  DropdownMenuItemModel({this.text, this.widget});
}

class DropdownMenu1Custom extends StatefulWidget {
  final List<DropdownMenuItemModel> dropdownMenuEntries;
  final String initText;
  final Color color;
  const DropdownMenu1Custom({
    Key? key,
    required this.dropdownMenuEntries,
    required this.initText,
    required this.color,
  }) : super(key: key);

  @override
  _DropdownMenu1CustomState createState() => _DropdownMenu1CustomState();
}

class _DropdownMenu1CustomState extends State<DropdownMenu1Custom> {
  DropdownMenuItemModel? _selectedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: widget.color,
        border: Border.all(
          color: Colors.grey,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(20), // Adjust the radius as needed
      ),
      child: Expanded(
        child: DropdownButton<DropdownMenuItemModel>(
          value: _selectedItem,
          underline: Container(),
          hint: Text(widget.initText),
          style: const TextStyle(
            fontSize: 23,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 15),
          borderRadius: BorderRadius.circular(18),
          onChanged: (DropdownMenuItemModel? newValue) {
            setState(() {
              _selectedItem = newValue;
            });
          },
          items: widget.dropdownMenuEntries.map<DropdownMenuItem<DropdownMenuItemModel>>((DropdownMenuItemModel value) {
            return DropdownMenuItem<DropdownMenuItemModel>(
              value: value,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: value.widget ?? Text(value.text!),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
