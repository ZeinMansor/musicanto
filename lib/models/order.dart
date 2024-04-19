import 'package:musicanto/models/customer.dart';

class Order {
  final int id;
  final DateTime date;
  final int total;
  final String creditCard;
  final Customer customer;

  Order(
    this.id,
    this.date,
    this.customer,
    this.total,
    this.creditCard,
  );

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        json['id'] as int,
        json['title'] as DateTime,
        Customer.fromJson(json['customer'] as Map<String, dynamic>),
        json['total']?.toDouble() ?? 0.0,
        json['creditCard'] as String,
      );
}
