import 'package:flutter/material.dart';
import '../widgets/period_type_picker.dart';

class SelectYearChips extends StatefulWidget {
  @override
  _SelectYearChipsState createState() => _SelectYearChipsState();
}

class _SelectYearChipsState extends State<SelectYearChips> {
  int _value = 1;

  List<String> chipText = [
    '2020',
    '2019',
    '2018',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List<Widget>.generate(
          chipText.length,
          (int index) {
            return Container(
              padding: EdgeInsets.only(left: 20),
              child: ChoiceChip(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                selectedColor: Color.fromRGBO(255, 43, 83, 1),
                pressElevation: 0,
                backgroundColor: Colors.transparent,
                labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                labelStyle: TextStyle(
                  fontFamily: 'Sens',
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: _value == index ? Colors.white : Colors.black54,
                ),
                label: Text('${chipText[index]}'),
                selected: _value == index,
                onSelected: (bool selected) {
                  setState(() {
                    _value = selected ? index : index;
                  });
                },
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
