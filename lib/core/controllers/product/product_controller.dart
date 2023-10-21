import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';
import '../../models/products_model.dart';

class ProductController extends GetxController {

  Future<void> storeProduct(AdminProduct product) async {
    try {
      final CollectionReference productCollection =
          FirebaseFirestore.instance.collection('products');
      await productCollection.add({
        'name': product.pName,
        'image': product.pImage,
        'price': product.pPrice,
        'description': product.pDescription,
        'category': product.pCategory,
        'use': product.pUse,
        'tags': product.pTag,
      }).whenComplete(() => Get.snackbar(
          'Success', 'Product added successfully',
          backgroundColor: Colors.green, colorText: Colors.white));
    } catch (e) {
      Get.snackbar('Error', e.toString(),
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }


  Future<List<Product>> fetchProductData() async {
    // Get a reference to the product collection.
    final collection = FirebaseFirestore.instance.collection('products');

    // Get all of the documents in the collection.
    final snapshots = await collection.get();

    // Iterate over the documents and convert each document to a product model object.
    final productModels = snapshots.docs.map((snapshot) {
      return Product.fromMap(snapshot.data());
    }).toList();

    // Return the list of product model objects.
    return productModels;
  }

}
