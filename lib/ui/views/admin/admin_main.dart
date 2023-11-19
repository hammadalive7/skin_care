import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import 'package:skin_care/core/controllers/product/product_controller.dart';
import 'package:skin_care/core/models/product_model.dart';


class AdminDashBoard extends StatefulWidget {
  const AdminDashBoard({super.key});

  @override
  State<AdminDashBoard> createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late TextEditingController _categoryController;
  late TextEditingController _useController;
  late TextEditingController _ingredientsController;
  late TextEditingController _stockController;
  late TextEditingController _brandController;
  ProductController productController = ProductController();
  bool addToCart = false;
  bool isFavorite = false;

  final _picker = ImagePicker();
  XFile? _pickedImage;
  List<String> _imageURL = [];

  void _selectImage() async {
    final pickedImage = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      _pickedImage = pickedImage;
    });
    _uploadImage();
  }

  void _uploadImage() async {
    if (_pickedImage != null) {
      final imageFile = File(_pickedImage!.path);

      // Upload image to Firebase Storage
      final storageReference = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('product_images/${DateTime.now()}.jpg');

      final uploadTask = storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() async {
        _imageURL.add(await storageReference.getDownloadURL());
        debugPrint('imageURL: $_imageURL');
      });
    }
  }


  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _priceController = TextEditingController();
    _descriptionController = TextEditingController();
    _categoryController = TextEditingController();
    _useController = TextEditingController();
    _ingredientsController = TextEditingController();
    _stockController = TextEditingController();
    _brandController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _useController.dispose();
    _stockController.dispose();
    _ingredientsController.dispose();
    _brandController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final product = Product.fromMap({
        'id': DateTime.now().second,
        'brand': _brandController.text,
        'model': _nameController.text,
        'stock': int.parse(_stockController.text),
        'description': _descriptionController.text,
        'retailPrice': double.parse(_priceController.text),
        'use': _useController.text,
        'category': _categoryController.text,
        'images': _imageURL,
        'ingredients': _ingredientsController.text.split(','),
        'isFavorite': isFavorite,
        'isAddedToCartDone': addToCart,
      });

      // Call a function to store the product in Firestore
      productController.storeProduct(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              // Similar TextFormField widgets for other fields
              ElevatedButton(
                onPressed: _selectImage,  // Call the image picker function
                child: const Text('Pick Image'),
              ),
                // Display the selected image

              TextFormField(
                controller: _priceController,
                decoration: const InputDecoration(labelText: 'Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a price';
                  }else if(
                    double.tryParse(value) == null
                  ){
                    return 'Please enter a valid number';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ingredientsController,
                decoration: const InputDecoration(labelText: 'Ingredients'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration: const InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _useController,
                decoration: const InputDecoration(labelText: 'Use'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a use';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _stockController,
                decoration: const InputDecoration(labelText: 'Stock'),

                validator: (value) {

                  //check for integer number
                  if (value == null || value.isEmpty) {
                    return 'Please enter a tag';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}