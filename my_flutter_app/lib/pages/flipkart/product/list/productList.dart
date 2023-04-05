import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:my_flutter_app/components/flipkart/layout/card/simpleCard.dart';
import 'package:my_flutter_app/components/flipkart/image/networkImage.dart';
import 'package:my_flutter_app/pages/flipkart/product/productDetails/productDetails.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:my_flutter_app/utils/flipkart/variables/imageVariables.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';

var url = 'productURL';

class ProductList extends StatefulWidget {
  final ProductFilter itemData;
  const ProductList({super.key, required this.itemData});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [];
  List<dynamic> itemList = [];

  void changeValue(name, Arr, GroupName) {
    itemList.addAll(Arr);
    for (var i = 0; i < 102; i++) {
      products
          .add(Product(i, "$name $i", Arr[i % Arr.length], "100$i", GroupName));
    }
  }

  @override
  void initState() {
    switch (widget.itemData.listName) {
      case 'FOOD_IMAGES':
        changeValue('Snack', FOOD_IMAGES, 'FOOD_IMAGES');
        break;
      case 'STUDY_IMAGES':
        changeValue('Study', STUDY_IMAGES, 'STUDY_IMAGES');
        break;
      case 'MOBILES':
        changeValue('Mobile', MOBILES, 'MOBILES');
        break;
      case 'LAPTOPS':
        changeValue('Laptops', LAPTOPS, 'LAPTOPS');
        break;
      case 'MEDICINE_IMAGES':
        changeValue('Medicine', MEDICINE_IMAGES, 'MEDICINE_IMAGES');
        break;
      default:
        changeValue('Snack', FOOD_IMAGES, 'FOOD_IMAGES');
        break;
    }

    super.initState();
  }

  void onClickCard(data) {
//  context.read<CartProvider>().add(data);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                ProductDetails(itemData: data, itemList: itemList)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white, //change your color here
          ),
          title: Text(widget.itemData.name),
          centerTitle: true,
        ),
        body: Column(children: [
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(MAIN_PADDING_HORIZONTAL),
              itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2),
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
                              url: products[index].productURL,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, bottom: 5),
                          child: Text(products[index].productName),
                        ),
                      ]),
                );
              },
            ),
          )
        ]));
  }
}
