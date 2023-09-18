

import 'package:skin_care/core/enums/order_status_enum.dart';
import 'package:skin_care/core/models/order_location_model.dart';
import 'package:skin_care/core/models/order_supplier_model.dart';
import 'package:skin_care/core/models/product_model.dart';
import 'package:skin_care/core/models/product_model.dart';

class Order {
  int id;
  String code;
  Product product;
  OrderStatus status;
  DateTime orderDate;
  DateTime deliveryDate;
  OrderLocation location;
  OrderSupplier supplier;

  Order({
    required this.id,
    required this.code,
    required this.status,
    required this.orderDate,
    required this.deliveryDate,
    required this.product,
    required this.location,
    required this.supplier,
  });
}
