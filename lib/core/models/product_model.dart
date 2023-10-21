import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Product {
  int id;
  // String sku;
  String brand;
  String model;
  List<Color> colors;
  String description;
  double retailPrice;
  String use;
  String category;
  String tags;
  // String sole;
  int? stock;
  int? discountRate;
  List<String> images;
  RxBool isFavorite = false.obs;
  RxBool isAddedToCartDone = false.obs;

  Product({
    required this.id,
    // required this.sku,
    required this.brand,
    required this.model,
    required this.colors,
    required this.stock,
    required this.description,
    required this.retailPrice,
    required this.use,
    required this.category,
    required this.tags,
    // required this.sole,
    required this.images,
    required this.isFavorite,
    required this.isAddedToCartDone,
    this.discountRate = 0,
  });

  factory Product.fromMap(Map<String, dynamic> map){
    return Product(
      id: map['id'],
      // sku: map['sku'],
      brand: map['brand'],
      model: map['model'],
      colors: map['colors'],
      stock: map['stock'],
      description: map['description'],
      retailPrice: map['retailPrice'],
      use: map['use'],
      category: map['category'],
      tags: map['tags'],
      // sole: map['sole'],
      images: map['images'],
      isFavorite: map['isFavorite'],
      isAddedToCartDone: map['isAddedToCartDone'],
      discountRate: map['discountRate'],
    );
  }
}
