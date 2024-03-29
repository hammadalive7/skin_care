

import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/categories/components/categories_app_bar.dart';
import 'package:skin_care/ui/views/categories/components/categories_body.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CategoriesAppBar(),
      body: CategoriesBody(),
    );
  }
}
