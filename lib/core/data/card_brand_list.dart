
import 'package:skin_care/core/models/card_brand_model.dart';
import 'package:skin_care/core/models/colorful_icon_model.dart';

const List<CardBrandModel> cardBrandList = [
  CardBrandModel(
    name: "Apple Pay",
    icon: ColorfulIcon(
      icon: "assets/images/apple_pay_logo.svg",
    ),
  ),
  CardBrandModel(
    name: "Visa",
    icon: ColorfulIcon(
      icon: "assets/images/visa_logo.svg",
    ),
  ),
  CardBrandModel(
    name: "MasterCard",
    icon: ColorfulIcon(
      icon: "assets/images/mastercard_logo.svg",
      hasColor: true,
    ),
  ),
];
