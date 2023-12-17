
import 'package:flutter/material.dart';
import 'package:skin_care/ui/views/search/components/search_last_search_list.dart';
import 'package:skin_care/ui/views/search/components/search_last_seen_list.dart';
import 'package:skin_care/ui/views/search/components/search_text_field.dart';

class SearchBody extends StatelessWidget {
  const SearchBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        SearchTextField(),
        SearchLastSeenList(),
        // SearchLastSearchList(),
      ],
    );
  }
}
