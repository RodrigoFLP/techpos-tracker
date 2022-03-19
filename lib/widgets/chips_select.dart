import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/sales_stats.dart';
import '../style/colors.dart';
import '../widgets/period_type_picker.dart';
import '../widgets/year_picker.dart';

class MonthChips extends StatefulWidget {
  int nMaxChips;

  MonthChips({@required this.nMaxChips});
  @override
  _MonthChipsState createState() => _MonthChipsState();
}

class _MonthChipsState extends State<MonthChips> {
  List<int> _values = [];

  List<String> monthsName = [
    'Enero',
    'Febrero',
    'Marzo',
    'Abril',
    'Mayo',
    'Junio',
    'Julio',
    'Agosto',
    'Septiembre',
    'Octubre',
    'Noviembre',
    'Diciembre',
  ];

  @override
  Widget build(BuildContext context) {

    int nMaxChips = widget.nMaxChips;

    print('MESES SELECCIONADOS  $_values');
    final String year = Provider.of<StatsData>(context).salesStatsDate.year;
    final DateTime initialDate = Provider.of<StatsData>(context).initialDate;

    final int initialMonth = int.parse(DateFormat.M().format(initialDate));

    DateTime selectedYear = DateTime(int.parse(year));

    int monthJump = 0;

    if (year == DateFormat.y().format(initialDate)) {
      monthJump = 0;
    } else {
      monthJump = (13 -
          int.parse(DateFormat.M().format(initialDate)) +
          (int.parse(year) -
                  int.parse(DateFormat.y().format(initialDate)) -
                  1) *
              12);
    }

    print('mes inicial: $initialMonth');

    int nMonths = 0;
    int monthsJumper = 0;

    final int currentMonth = int.parse(DateFormat.M().format(
      DateTime.now(),
    ));
    print('IMPORTANTE $currentMonth');
    final String currentYear = DateFormat.y().format(DateTime.now());
    if (year == currentYear) {
      nMonths = currentMonth;
    } else if (year == DateFormat.y().format(initialDate)) {
      nMonths = 13 - int.parse(DateFormat.M().format(initialDate));
      print('nMonths $nMonths');
      monthsJumper = int.parse(DateFormat.M().format(initialDate)) - 1;
    } else {
      nMonths = 12;
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 20),
          YearDatePicker(),
          ...List<Widget>.generate(
            nMonths,
            (int index) {
              return Container(
                padding: EdgeInsets.only(left: 20),
                child: ChoiceChip(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  selectedColor: _values.contains(index + monthJump)
                      ? AppColors
                          .iterativeColors[_values.indexOf(index + monthJump)]
                      : Colors.white,
                  pressElevation: 0,
                  backgroundColor: Colors.white,
                  labelPadding:
                      EdgeInsets.symmetric(horizontal: 18, vertical: 2),
                  labelStyle: TextStyle(
                    fontFamily: 'Sens',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: _values.contains(index + monthJump)
                        ? Colors.white
                        : Colors.black54,
                  ),
                  label: Text('${monthsName[index + monthsJumper]}'),
                  selected: _values.contains(index + monthJump),
                  onSelected: (bool selected) {
                    print(
                        'DIAAAAAAAAAS: ${DateTime(DateTime.now().year, DateTime.now().month, 1).difference(DateTime(DateTime.now().year, DateTime.now().month + 1, 1)).inDays}');

                    setState(() {
                      if (_values != null) {
                        if (_values.contains(index + monthJump)) {
                          Provider.of<StatsData>(context, listen: false)
                              .removeMonth(_values.indexOf(index + monthJump));
                          _values.remove(index + monthJump);
                        } else {
                          if (_values.length < nMaxChips) {
                            _values.add(index + monthJump);
                            Provider.of<StatsData>(context, listen: false)
                                .selectMonth((index + monthJump).toString());
                          } else {
                            Scaffold.of(context).removeCurrentSnackBar();
                            Scaffold.of(context).showSnackBar(SnackBar(
                                duration: Duration(
                                  seconds: 2,
                                ),
                                content: Text(
                                    'Solo puedes seleccionar $nMaxChips meses al mismo tiempo')));
                          }
                        }
                      } else {
                        _values.add(index + monthJump);
                        Provider.of<StatsData>(context, listen: false)
                            .selectMonth((index + monthJump).toString());
                      }
                    });
                    print(
                        'VER SI SIRVE SI NO NO ${Provider.of<StatsData>(context).selectedMonth}');
                  },
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
