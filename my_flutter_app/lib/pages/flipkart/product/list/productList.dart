import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_flutter_app/components/flipkart/layout/card/simpleCard.dart';
import 'package:my_flutter_app/components/flipkart/image/networkImage.dart';
import 'package:my_flutter_app/pages/flipkart/product/productDetails/productDetails.dart';
import 'package:my_flutter_app/style/flipkart/colors.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:my_flutter_app/utils/flipkart/variables/firebase/firebaseVariable.dart';
import 'package:my_flutter_app/utils/flipkart/variables/imageVariables.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';

var url = 'url';

class ProductList extends StatefulWidget {
  final ProductCategory itemData;
  const ProductList({super.key, required this.itemData});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<dynamic> itemList = [];

  void onClickCard(data) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ProductDetails(itemData: data, itemList: itemList)));
  }

  Stream<List<Product>> getCategory() => FirebaseFirestore.instance
      .collection(PRODUCTS_COLLECTION)
      .snapshots()
      .map((snapshots) => snapshots.docs
          .where(
              (element) => element['productGroup'] == widget.itemData.groupName)
          .map((e) => Product.fromJson(e.data()))
          .toList());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: APP_BAR_BG,
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(widget.itemData.name),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: StreamBuilder<List<Product>>(
                stream: getCategory(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final products = snapshot.data!;
                    return GridView.builder(
                      padding: EdgeInsets.all(MAIN_PADDING_HORIZONTAL),
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 2,
                              mainAxisSpacing: 2),
                      itemBuilder: (BuildContext context, int index) {
                        return SimpleCard(
                          onClick: () {
                            onClickCard(products[index]);
                          },
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 80,
                                    width: 110,
                                    child: NetWorkImage(
                                      url: products[index].url,
                                    )),
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(products[index].productName),
                                ),
                              ]),
                        );
                      },
                    );
                  }
                  return const Text('No data');
                }),
          )
        ]));
  }
}
