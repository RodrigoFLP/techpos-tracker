import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class StatsDate {
  String year;
  String month;
  int day;

  StatsDate(this.year, this.month, {this.day = 1});
}

class StatsData with ChangeNotifier {
  StatsDate selectedMonth = StatsDate('', '');

  List<StatsDate> selectedMonths = [];

  //DATOS DE VENTAS GENERALES PARA GRÁFICO DE LÍNEAS
  Map<int, dynamic> totalSalesPerDay = {
    2019: {
      1: {
        1: 324.54,
        2: 123.54,
        3: 435.54,
        4: 435.54,
        5: 543.54,
        6: 231.54,
        7: 546.54,
        8: 878.54,
      },
      2: {
        1: 656.54,
        2: 656.54,
        3: 656.54,
        4: 656.54,
        5: 656.54,
        6: 656.54,
        7: 656.54,
        8: 656.54,
        9: 656.54,
        10: 656.54,
        11: 656.54,
        12: 656.54,
      }
    },
    2020: {
      1: {
        1: 546.54,
        2: 435.54,
        3: 564.54,
        4: 432.54,
        5: 654.54,
        6: 231.54,
        7: 546.54,
        8: 878.54,
      },
      2: {
        1: 656.54,
        2: 656.54,
        3: 656.54,
        4: 656.54,
        5: 328.54,
        6: 100.54,
        7: 656.54,
        8: 544.54,
        9: 656.54,
        10: 943.54,
        11: 656.54,
        12: 656.54,
      }
    }
  };

  //DATOS DE CARRUSEL DE ESTADÍSTICAS VENTAS GENERALES
  Map<String, dynamic> generalMonthSalesStats = {
    '2019': {
      '1': {
        'total': 13255.0,
        'max': 943.0,
        'min': 449.0,
        'prom': 654.0,
      },
      '2': {
        'total': 13255.0,
        'max': 943.0,
        'min': 449.0,
        'prom': 654.0,
      },
      '3': {
        'total': 13255.0,
        'max': 943.0,
        'min': 449.0,
        'prom': 654.0,
      },
      '4': {
        'total': 13255.0,
        'max': 943.0,
        'min': 449.0,
        'prom': 654.0,
      },
      '5': {
        'total': 13255.0,
        'max': 943.0,
        'min': 449.0,
        'prom': 654.0,
      },
    },
    '2020': {
      '1': {
        'total': 13255.0,
        'max': 943.0,
        'min': 449.0,
        'prom': 654.0,
      },
      '2': {
        'total': 13255.0,
        'max': 943.0,
        'min': 449.0,
        'prom': 654.0,
      },
      '3': {
        'total': 13255.0,
        'max': 943.0,
        'min': 449.0,
        'prom': 654.0,
      },
      '4': {
        'total': 13255.0,
        'max': 943.0,
        'min': 449.0,
        'prom': 654.0,
      },
      '5': {
        'total': 13255.0,
        'max': 943.0,
        'min': 449.0,
        'prom': 654.0,
      },
    },
  };

  //DATOS DE VENTAS DE PRODUCTOS GENERALES
  Map<int, dynamic> productSales = {
    2019: {
      1: {
        1: {
          'Tacos': 134,
          'Burritos': 320,
          'Sopa de tortilla': 439,
        },
        2: {
          'Tacos': 144,
          'Burritos': 350,
          'Sopa de tortilla': 324,
        },
        3: {
          'Tacos': 345,
          'Burritos': 123,
          'Sopa de tortilla': 546,
        },
      }
    }
  };

  Map<int, dynamic> get filteredSalesPerMonth {
    Map<int, dynamic> filteredMonths = {};

    selectedMonths.forEach((element) {
      filteredMonths[int.parse(element.year)] = {};
    });

    selectedMonths.forEach((element) {
      filteredMonths[int.parse(element.year)][int.parse(element.month)] =
          totalSalesPerDay[int.parse(element.year)][int.parse(element.month)];
    });

    return filteredMonths;
  }

  int get maxDaysSelected {
    int maxX = 0;

    //Encontrando el máximo de días para eje X
    int prevX = 0;
    selectedMonths.forEach((element) {
      (filteredSalesPerMonth[int.parse(element.year)][int.parse(element.month)]
              as Map)
          .forEach((key, value) {
        if (key > prevX) {
          maxX = key;
          prevX = key;
        }
      });
    });
    return maxX;
  }

  double get maxSalesOfSelectedMonths {
    double maxY = 0;
    double prevY = 0;
    selectedMonths.forEach((element) {
      (filteredSalesPerMonth[int.parse(element.year)][int.parse(element.month)]
              as Map)
          .forEach((key, value) {
        if (value > prevY) {
          maxY = value;
          prevY = value;
        }
      });
    });
    return maxY;
  }

  Map<String, int> get filteredProductsStats {
    Map<String, int> filteredMonths = {};

    int day = selectedMonths[0].day;
    int month = int.parse(selectedMonths[0].month);
    int year = int.parse(selectedMonths[0].year);

    filteredMonths = productSales[year][month][day];

    return filteredMonths;
  }

  void clearMonths() {
    selectedMonths.clear();
    notifyListeners();
  }

  void removeMonth(int index) {
    selectedMonths.removeAt(index);
    notifyListeners();
  }

  void selectMonth(String nMonth) {
    int cnMonth = int.parse(nMonth);
    int initialMonths = int.parse(DateFormat.M().format(initialDate));
    if ((cnMonth + initialMonths) > 12) {
      int remainingMonths = cnMonth - (12 - initialMonths);
      if ((remainingMonths % 12) == 0) {
        selectedMonth = StatsDate(
            (int.parse(DateFormat.y().format(initialDate)) +
                    remainingMonths / 12)
                .floor()
                .toString(),
            '12');

        selectedMonths.add(StatsDate(
            (int.parse(DateFormat.y().format(initialDate)) +
                    remainingMonths / 12 +
                    1)
                .toString(),
            '12'));

        print(
            'SELECTED: ${selectedMonth.year}, ${selectedMonth.month} AND SELECTEDALL: ${selectedMonths.length}');
      } else {
        selectedMonth = StatsDate(
            (int.parse(DateFormat.y().format(initialDate)) +
                    1 +
                    (remainingMonths / 12.0).floor())
                .toString(),
            (remainingMonths % 12).toString());

        selectedMonths.add(StatsDate(
            (int.parse(DateFormat.y().format(initialDate)) +
                    1 +
                    (remainingMonths / 12.0).floor())
                .toString(),
            (remainingMonths % 12).toString()));

        print(
            'SELECTED: ${selectedMonth.year}, ${selectedMonth.month} AND SELECTEDALL: ${selectedMonths.length}');
      }
    } else {
      selectedMonth = StatsDate(
          int.parse(DateFormat.y().format(initialDate)).toString(),
          (12 - cnMonth).toString());

      selectedMonths.add(StatsDate(
          int.parse(DateFormat.y().format(initialDate)).toString(),
          (12 - cnMonth).toString()));
    }

    print(
        'SELECTED: ${selectedMonth.year}, ${selectedMonth.month} AND SELECTEDALL: ${selectedMonths.length}');
    notifyListeners();
  }

  DateTime _initialDate = DateTime.now().subtract(Duration(days: 1000));

  DateTime get initialDate {
    return _initialDate;
  }

  //dummySalesStatsDate
  StatsDate _salesStatsDate = StatsDate(
    DateFormat.y().format(DateTime.now()).toString(),
    DateFormat.m().format(DateTime.now()).toString(),
  );

  StatsDate get salesStatsDate {
    return _salesStatsDate;
  }

  void setSalesStatsDate({String year}) {
    _salesStatsDate = StatsDate(year, _salesStatsDate.month);
    notifyListeners();
  }
}
