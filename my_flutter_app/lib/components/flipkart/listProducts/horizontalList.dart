import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:my_flutter_app/components/flipkart/layout/card/simpleCard.dart';
import 'package:my_flutter_app/components/flipkart/image/networkImage.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';

class SimpleHorizontalList extends StatefulWidget {
  final NullableIndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final EdgeInsetsGeometry? padding;
  const SimpleHorizontalList({
    super.key,
    required this.itemBuilder,
    required this.itemCount,
    this.padding,
  });

  @override
  State<SimpleHorizontalList> createState() => _SimpleHorizontalListState();
}

class _SimpleHorizontalListState extends State<SimpleHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      margin: const EdgeInsets.only(bottom: 10),
      child: ListView.builder(
        dragStartBehavior: DragStartBehavior.start,
        clipBehavior: Clip.hardEdge,
        scrollDirection: Axis.horizontal,
        itemCount: widget.itemCount,
        padding: widget.padding,
        itemBuilder: widget.itemBuilder,
      ),
    );
  }
}
