import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/sales_stats.dart';

class YearDatePicker extends StatefulWidget {
  YearDatePicker({
    Key key,
  }) : super(key: key);

  @override
  _YearDatePickerState createState() => _YearDatePickerState();
}

class _YearDatePickerState extends State<YearDatePicker> {
  String dropdownValue = DateFormat.y().format(DateTime.now()).toString();
  final DateTime initialDate = DateTime.now().subtract(Duration(days: 1500));

  @override
  Widget build(BuildContext context) {
    print('$dropdownValue');

    int initialYear = int.parse(
        DateFormat.y().format(Provider.of<StatsData>(context).initialDate));
    int actualYear = int.parse(DateFormat.y().format(DateTime.now()));

    print('intial year: $initialYear, final year: $actualYear');
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.black.withOpacity(0.03),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(
          EvaIcons.arrowDown,
          color: Colors.black,
        ),
        iconSize: 16,
        elevation: 1,
        style: TextStyle(
          color: Colors.black,
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
            Provider.of<StatsData>(context, listen: false)
                .setSalesStatsDate(year: newValue);
          });
        },
        items: List<String>.generate(actualYear - initialYear + 1,
                (index) => (initialYear + index).toString())
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
