

import 'package:skin_care/core/models/order_location_model.dart';

class OrderSupplier {
  int id;
  String name;
  String logo;
  OrderLocation location;

  OrderSupplier({
    required this.id,
    required this.name,
    required this.logo,
    required this.location,
  });
}
