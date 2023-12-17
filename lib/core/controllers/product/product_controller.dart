import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class ProductController extends GetxController {

  Future<void> storeProduct(Product product) async {
    try {
      final CollectionReference productCollection =
          FirebaseFirestore.instance.collection('products');
      await productCollection.add(
        {
          'model': product.name,
          'retailPrice': product.retailPrice,
          'description': product.description,
          'category': product.category,
          'use': product.use,
          'stock': product.stock,
          'brand': product.brand,
          'images': product.images,
          'isAddedToCartDone': product.isAddedToCartDone,
          'isFavorite': product.isFavorite,
        },
      ).whenComplete(() => Get.snackbar(
          'Success', 'Product added successfully',
          backgroundColor: Colors.green, colorText: Colors.white));
    } catch (e) {
      debugPrint(' ---- error: $e');
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }


  Future<List<Product>> fetchProductData() async {
    // Get a reference to the product collection.
    final collection = FirebaseFirestore.instance.collection('products');

    // Get all of the documents in the collection.
    final snapshots = await collection.get().catchError((error) {
      debugPrint('error: $error');
    });

    // Iterate over the documents and convert each document to a product model object.
    List<Product> productModels = snapshots.docs.map((snapshot) {
      // debugPrint('-- snapshot data: ${snapshot.data()}');
      return Product.fromMap(snapshot.data());
    }).toList();

    // debugPrint('-- productModels: $productModels');
    return productModels;
  }

  Stream<Object?> productStream() async* {
    // Fetch the product data.
    final productModels = await fetchProductData();

    // Yield each product model object to the stream.
    for (final productModel in productModels) {
      yield productModel;
    }
  }

}
