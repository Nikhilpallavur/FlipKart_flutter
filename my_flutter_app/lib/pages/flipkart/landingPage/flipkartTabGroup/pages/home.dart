import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/flipkart/layout/card/simpleCard.dart';
import 'package:my_flutter_app/components/flipkart/image/networkImage.dart';
import 'package:my_flutter_app/components/flipkart/listProducts/horizontalList.dart';
import 'package:my_flutter_app/pages/flipkart/product/list/productList.dart';
import 'package:my_flutter_app/pages/flipkart/product/productDetails/productDetails.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:my_flutter_app/utils/flipkart/variables/imageVariables.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';

var url = 'productURL';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ProductFilter> filterList = [];
  @override
  void initState() {
    filterList.add(ProductFilter('Snacks', FOOD_IMAGES[0], 'FOOD_IMAGES'));
    filterList.add(ProductFilter('Students', STUDY_IMAGES[0], 'STUDY_IMAGES'));
    filterList.add(ProductFilter('Mobiles', MOBILES[0], 'MOBILES'));
    filterList.add(ProductFilter('Laptops', LAPTOPS[0], 'LAPTOPS'));
    filterList
        .add(ProductFilter('Medicines', MEDICINE_IMAGES[0], 'MEDICINE_IMAGES'));

    super.initState();
  }

  void onClickCard(data) {
//  context.read<CartProvider>().add(data);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductList(
                  itemData: data,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SimpleHorizontalList(
        itemCount: filterList.length,
        padding: EdgeInsets.only(
            left: MAIN_PADDING_HORIZONTAL, right: MAIN_PADDING_HORIZONTAL),
        itemBuilder: (BuildContext context, int index) {
          return SimpleCard(
            onClick: () {
              onClickCard(filterList[index]);
            },
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: 110,
                      width: 110,
                      child: NetWorkImage(
                        url: filterList[index].url,
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                    child: Text(filterList[index].name),
                  ),
                ]),
          );
        },
      )
    ]);
  }
}
