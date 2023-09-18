
import 'package:flutter/material.dart';

import 'package:skin_care/ui/views/detail/components/detail_color_item.dart';

class DetailColorList extends StatefulWidget {
  final List<Color> colors;

  const DetailColorList({required this.colors, Key? key}) : super(key: key);

  @override
  State<DetailColorList> createState() => _DetailColorListState();
}

class _DetailColorListState extends State<DetailColorList> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: widget.colors
          .map(
            (color) => DetailColorItem(color: color),
          )
          .toList(),
    );
  }
}
