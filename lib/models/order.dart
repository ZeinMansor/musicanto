import 'package:musicanto/models/invoice.dart';
import 'package:musicanto/models/song.dart';

class Order {
  // int id;
  final Song song;
  final Invoice invoice;

  Order(this.song, this.invoice);
}
