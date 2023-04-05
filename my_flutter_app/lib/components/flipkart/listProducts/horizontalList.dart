import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SimpleHorizontalList extends StatefulWidget {
  final listItems;
  final onClickItem;
  const SimpleHorizontalList(
      {super.key, required this.listItems, this.onClickItem});

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
        itemCount: widget.listItems.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                widget.onClickItem(widget.listItems[index]);
                // context.read<CartProvider>().add(products[index]);
              },
              child: Card(
                color: Colors.white,
                child: SizedBox(
                    height: 160,
                    width: 110,
                    child: CachedNetworkImage(
                      imageUrl: 'https://via.placeholder.com/200x150',
                    )
                    // Image.network(
                    //   widget.listItems[index].productURL,
                    //   fit: BoxFit.contain,
                    // ),
                    ),
              ));
        },
      ),
    );
  }
}
