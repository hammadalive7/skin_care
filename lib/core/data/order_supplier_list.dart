

import 'package:latlong2/latlong.dart';

import 'package:skin_care/core/models/order_location_model.dart';
import 'package:skin_care/core/models/order_supplier_model.dart';

List<OrderSupplier> orderSupplierList = [
  OrderSupplier(
    id: 1,
    name: "Dr. Ishfaq",
    logo: "assets/images/doctor.jpg",
    location: OrderLocation(
      address: "Islamabad, Pakistan",
      latLng: const LatLng(51.5016195, -0.1550089),
    ),
  ),
  OrderSupplier(
    id: 2,
    name: "Dr. Hassan",
    logo: "assets/images/nurse.jpg",
    location: OrderLocation(
      address: "Lahore, Pakistan",
      latLng: const LatLng(51.5016195, -0.1550089),
    ),
  ),

];
