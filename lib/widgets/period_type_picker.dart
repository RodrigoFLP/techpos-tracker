import 'package:flutter/material.dart';

class PeriodTypePicker extends StatefulWidget {
  PeriodTypePicker({Key key}) : super(key: key);

  @override
  _PeriodTypePickerState createState() => _PeriodTypePickerState();
}

class _PeriodTypePickerState extends State<PeriodTypePicker> {
  String dropdownValue = 'Días';

  @override
  Widget build(BuildContext context) {
    print('$dropdownValue');
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(top: 5, right: 20,),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_downward,
          color: Color.fromRGBO(255, 43, 83, 1),
        ),
        iconSize: 24,
        elevation: 1,
        style: TextStyle(
          color: Color.fromRGBO(255, 43, 83, 1),
          fontFamily: 'Sens',
          fontWeight: FontWeight.bold,
        ),
        underline: Container(
          height: 0,
          color: Colors.white,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          'Días',
          'Meses',
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
