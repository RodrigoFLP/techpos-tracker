import 'package:flutter/cupertino.dart';
import '../providers/ticket_item.dart';

class Ticket {
  String id;
  List<TicketItem> productsTicket;
  double total;
  String salesman;
  DateTime date;

  Ticket({
    this.id,
    this.date,
    this.salesman,
    this.productsTicket,
    this.total,
  });
}

class Tickets with ChangeNotifier {
  List<Ticket> _tickets = [];

  void addTicket(String ticketId, DateTime ticketDate, double ticketTotal, ) {
    _tickets.insert(
      0,
      Ticket(
        id: ticketId,
        date: ticketDate,
        total: ticketTotal,
      ),
    );
  }

  List<Ticket> getLastDaysTickets(int daysQuantity) {
    final List<Ticket> _lastDaysTickets = _tickets.takeWhile((value) {
      return value.date
          .isBefore(DateTime.now().subtract(Duration(days: daysQuantity)));
    });
    return _lastDaysTickets;
  }

  double getLastDaysSalesTotal(int daysQuantity) {
    return getLastDaysTickets(daysQuantity).fold(0.00,
        (previousValue, element) {
      return previousValue + element.total;
    });
  }
}
