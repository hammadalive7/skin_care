
import 'package:flutter/material.dart';
import 'package:skin_care/core/utils/base/base_statefull.dart';
import 'package:skin_care/ui/views/search/components/search_app_bar.dart';
import 'package:skin_care/ui/views/search/components/search_body.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends BaseState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: SearchAppBar(),
      body: SearchBody(),
    );
  }
}
