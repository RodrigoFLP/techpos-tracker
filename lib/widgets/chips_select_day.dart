import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:techpos_track/providers/sales_stats.dart';

class SelectDaysChip extends StatefulWidget {
  @override
  _SelectDaysChipState createState() => _SelectDaysChipState();
}

class _SelectDaysChipState extends State<SelectDaysChip> {
  int _value = 1;

  List<int> _selectedItems = [];

  List<Map<String, String>> days = [
    {
      'name': 'LUN',
      'number': '1',
    },
    {
      'name': 'MAR',
      'number': '2',
    },
    {
      'name': 'MIE',
      'number': '3',
    },
    {
      'name': 'JUE',
      'number': '4',
    },
    {
      'name': 'VIE',
      'number': '5',
    },
    {
      'name': 'SÁB',
      'number': '6',
    },
    {
      'name': 'DOM',
      'number': '7',
    },
    {
      'name': 'LUN',
      'number': '8',
    },
    {
      'name': 'MAR',
      'number': '9',
    },
    {
      'name': 'MIE',
      'number': '10',
    },
    {
      'name': 'JUE',
      'number': '11',
    },
  ];

  @override
  Widget build(BuildContext context) {
    print('YEAAAAAAAAAAAAAAAAAAAAAAAR ${Provider.of<StatsData>(context).selectedMonth.year}');
    int year = int.parse(Provider.of<StatsData>(context).selectedMonth.year);
    
    int month = int.parse(Provider.of<StatsData>(context).selectedMonth.month);

    int days = month != 12? (-(1)*(DateTime(year, month, 1)
        .difference(DateTime(year, month + 1, 1))
        .inDays)) : (-(1)*(DateTime(year, month, 1)
        .difference(DateTime(year+1, 1, 1))
        .inDays));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 20,
        ),
        child: Row(
          children: List<Widget>.generate(
            days,
            (int index) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      bottom: 5,
                      top: 5,
                    ),
                    child: Text(
                      '${DateFormat.E().format(DateTime(year, month, index+1))}',
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: ChoiceChip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      selectedColor: Color.fromRGBO(255, 43, 83, 1),
                      pressElevation: 0,
                      backgroundColor: Colors.transparent,
                      labelPadding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      labelStyle: TextStyle(
                        fontFamily: 'Sens',
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: _selectedItems.contains(index)
                            ? Colors.white
                            : Colors.black54,
                      ),
                      label: Text('${index+1}'),
                      selected: _selectedItems.contains(index),
                      onSelected: (bool selected) {
                        setState(() {
                          _selectedItems.contains(index)
                              ? _selectedItems.remove(index)
                              : _selectedItems.add(index);
                        });
                      },
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
