

import 'package:latlong2/latlong.dart';

import 'package:skin_care/core/models/order_location_model.dart';
import 'package:skin_care/core/models/order_supplier_model.dart';

List<OrderSupplier> orderSupplierList = [
  OrderSupplier(
    id: 1,
    name: "Nike Store",
    logo: "assets/images/nike_logo.svg",
    location: OrderLocation(
      address: "London, Great Britain",
      latLng: const LatLng(51.5016195, -0.1550089),
    ),
  ),
  OrderSupplier(
    id: 2,
    name: "Adidas Store",
    logo: "assets/images/adidas_logo.svg",
    location: OrderLocation(
      address: "London, Great Britain",
      latLng: const LatLng(51.5016195, -0.1550089),
    ),
  ),
  OrderSupplier(
    id: 3,
    name: "Puma Store",
    logo: "assets/images/puma_logo.svg",
    location: OrderLocation(
      address: "London, Great Britain",
      latLng: const LatLng(51.5016195, -0.1550089),
    ),
  ),
  OrderSupplier(
    id: 4,
    name: "Reebok Store",
    logo: "assets/images/reebok_logo.svg",
    location: OrderLocation(
      address: "London, Great Britain",
      latLng: const LatLng(51.5016195, -0.1550089),
    ),
  ),
  OrderSupplier(
    id: 5,
    name: "New Balance Store",
    logo: "assets/images/new_balance_logo.svg",
    location: OrderLocation(
      address: "London, Great Britain",
      latLng: const LatLng(51.5016195, -0.1550089),
    ),
  ),
];
