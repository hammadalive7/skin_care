import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

import '../../../core/controllers/product/product_controller.dart';
import '../../../core/models/products_model.dart';


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
  late TextEditingController _tagsController;

  ProductController productController = ProductController();

  final _picker = ImagePicker();
  XFile? _pickedImage;
  String? _imageURL;

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
          .child('product_images/${DateTime.now().toString()}.jpg');

      final uploadTask = storageReference.putFile(imageFile);
      await uploadTask.whenComplete(() async {
        _imageURL = await storageReference.getDownloadURL();
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
    _tagsController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    _categoryController.dispose();
    _useController.dispose();
    _tagsController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final product = AdminProduct(
        pName: _nameController.text,
        pImage: _imageURL!,
        pPrice: double.parse(_priceController.text),
        pDescription: _descriptionController.text,
        pCategory: _categoryController.text,
        pUse: _useController.text,
        pTag: _tagsController.text,
      );

      // Call a function to store the product in Firestore
      productController.storeProduct(product);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Product')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
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
                child: Text('Pick Image'),
              ),
                // Display the selected image

              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
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
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _useController,
                decoration: InputDecoration(labelText: 'Use'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a use';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tagsController,
                decoration: InputDecoration(labelText: 'Tags'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a tag';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),


              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}