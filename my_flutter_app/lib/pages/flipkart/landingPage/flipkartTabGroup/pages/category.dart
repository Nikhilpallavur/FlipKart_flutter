import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/flipkart/image/networkImage.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_flutter_app/utils/flipkart/variables/imageVariables.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  List<Product> products = [];
  @override
  void initState() {
    for (var i = 0; i < 200; i++) {
      products.add(Product(i, "Product $i",
          DUMMY_IMAGES[i % DUMMY_IMAGES.length], "100$i", 'DUMMY_IMAGES'));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: MediaQuery.of(context).size.height- 200,
      height: MediaQuery.of(context).size.height - 173,
      child: Expanded(
        child: GridView.custom(
            shrinkWrap: true,
            gridDelegate: SliverQuiltedGridDelegate(
              crossAxisCount: 4,
              repeatPattern: QuiltedGridRepeatPattern.inverted,
              pattern: [
                QuiltedGridTile(2, 2),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 1),
                QuiltedGridTile(1, 2),
              ],
            ),
            childrenDelegate:
                SliverChildBuilderDelegate((context, index) => Card(
                        child: Container(
                            child:
                                // Text(products[index].productName),
                                NetWorkImage(
                      url: products[index].productURL,
                    ))))),
      ),
    );
  }
}
