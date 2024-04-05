import 'package:musicanto/models/customer.dart';

class Invoice {
  int id = 0;
  final Customer customer;
  final DateTime date;
  final double total;
  final int creditCard;

  Invoice(this.customer, this.date, this.total, this.creditCard);
}
