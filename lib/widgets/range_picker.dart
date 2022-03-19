import 'package:flutter/material.dart';

class RangePicker extends StatefulWidget {
  RangePicker({Key key}) : super(key: key);

  @override
  _RangePickerState createState() => _RangePickerState();
}

class _RangePickerState extends State<RangePicker> {
  String dropdownValue = 'Ahora';

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 6,
        right: 20,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        
      ),
      
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_downward,
          color: Colors.black,
        ),
        iconSize: 24,
        elevation: 16,
        style: TextStyle(
          color: Colors.black,
          fontFamily: 'Sens',
          fontWeight: FontWeight.bold,
        ),
        underline: Container(
          height: 0,
          color: Colors.redAccent,
        ),
        
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['Ahora', 'Ayer', 'Semana', 'Mes']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(

            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
