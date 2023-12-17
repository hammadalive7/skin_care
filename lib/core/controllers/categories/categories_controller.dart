import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class CategoriesController extends GetxController {
  RxInt categoryIndex = 0.obs;
  RxString category = "All".obs;

  void changeCategory(int index) {
    categoryIndex.value = index;
  }

  void reset() {
    categoryIndex.value = 0;
  }

  Future<List<Product>> fetchProductCategoryData(String Category) async {
    // Get a reference to the product collection.
    if (Category == "All") {
      final collection = FirebaseFirestore.instance.collection('products');
      // Get all of the documents in the collection.
      final snapshots = await collection.get().catchError((error) {
        debugPrint('error: $error');
      });

      // Iterate over the documents and convert each document to a product model object.
      final productModels = snapshots.docs.map((snapshot) {
        // debugPrint('-- snapshot data: ${snapshot.data()}');
        return Product.fromMap(snapshot.data());
      }).toList();

      // debugPrint('-- productModels: $productModels');
      return productModels;
    } else {
      final collection = FirebaseFirestore.instance
          .collection('products')
          .where('category', isEqualTo: Category);
      // Get all of the documents in the collection.
      final snapshots = await collection.get().catchError((error) {
        debugPrint('error: $error');
      });

      // Iterate over the documents and convert each document to a product model object.
      final productModels = snapshots.docs.map((snapshot) {
        // debugPrint('-- snapshot data: ${snapshot.data()}');
        return Product.fromMap(snapshot.data());
      }).toList();

      // debugPrint('-- productModels: $productModels');
      return productModels;
    }
  }
}
