import 'package:get/get.dart';

class Product {
  int? id;
  String brand;
  String name;
  String description;
  double retailPrice;
  String use;
  String category;
  List<String> ingredients = [];
  int? stock = 1;
  int? discountRate = 0;
  List<String> images;
  bool isFavorite;
  bool isAddedToCartDone;

  Product({
    this.id,
    required this.brand,
    required this.name,
    required this.stock,
    required this.description,
    required this.retailPrice,
    required this.use,
    required this.category,
    required this.images,
    required this.ingredients,
    required this.isFavorite,
    required this.isAddedToCartDone,
    this.discountRate = 0,
  })  ;
  // {
  //   isFavorite = RxBool(Favorite);
  //   isAddedToCartDone = RxBool(AddedToCartDone);
  // }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'brand': brand,
      'model': name,
      'stock': stock,
      'ingredients': ingredients,
      'description': description,
      'retailPrice': retailPrice,
      'use': use,
      'category': category,
      'image': images,
      'isFavorite': isFavorite ,
      'isAddedToCartDone': isAddedToCartDone,
      'discountRate': discountRate ?? 0,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    // Convert the 'images' list from List<dynamic> to List<String>
    List<String> images = (map['images'] as List).map((item) => item.toString()).toList();

    return Product(
      id: map['id'],
      brand: map['brand'] ?? 'Brand',
      name: map['model'],
      ingredients: map['ingredients'] ?? [],
      stock: map['stock'],
      description: map['description'],
      retailPrice: map['retailPrice'],
      use: map['use'],
      category: map['category'],
      images: images, // Use the converted List<String>
      isFavorite: map['isFavorite'], // Convert to a regular bool
      isAddedToCartDone: map['isAddedToCartDone'], // Convert to a regular bool
      discountRate: map['discountRate'],
    );
  }

  // RxBool get isFavoriteRx => isFavorite;
  // RxBool get isAddedToCartDoneRx => isAddedToCartDone;
  //
  // void dispose() {
  //   isFavorite.close();
  //   isAddedToCartDone.close();
  // }
}
