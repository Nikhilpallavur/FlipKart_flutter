import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/flipkart/layout/card/simpleCard.dart';
import 'package:my_flutter_app/components/flipkart/image/networkImage.dart';
import 'package:my_flutter_app/components/flipkart/listProducts/horizontalList.dart';
import 'package:my_flutter_app/pages/flipkart/product/list/productList.dart';
import 'package:my_flutter_app/pages/flipkart/product/productDetails/productDetails.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:my_flutter_app/utils/flipkart/firebase/product.dart';
import 'package:my_flutter_app/utils/flipkart/variables/firebase/firebaseVariable.dart';
import 'package:my_flutter_app/utils/flipkart/variables/imageVariables.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';

var url = 'url';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // @override
  // void initState() {
  // createCategory(
  //     ProductCategory('1', 'Snacks', FOOD_IMAGES[0], 'FOOD_IMAGES'));

  // filterList
  //     .add(ProductCategory('1', 'Snacks', FOOD_IMAGES[0], 'FOOD_IMAGES'));
  // filterList
  //     .add(ProductCategory('2', 'Students', STUDY_IMAGES[0], 'STUDY_IMAGES'));
  // filterList.add(ProductCategory('3', 'Mobiles', MOBILES[0], 'MOBILES'));
  // filterList.add(ProductCategory('4', 'Laptops', LAPTOPS[0], 'LAPTOPS'));
  // filterList.add(ProductCategory(
  //     '5', 'Medicines', MEDICINE_IMAGES[0], 'MEDICINE_IMAGES'));

  // super.initState();
  // }

  void onClickCard(data) {
//  context.read<CartProvider>().add(data);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductList(
                  itemData: data,
                )));
  }

  Stream<List<ProductCategory>> getCategory() => FirebaseFirestore.instance
      .collection(CATEGORY_COLLECTION)
      .snapshots()
      .map((snapshots) => snapshots.docs
          .map((e) => ProductCategory.fromJson(e.data()))
          .toList());

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StreamBuilder<List<ProductCategory>>(
          stream: getCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final filterList = snapshot.data!;
              return SimpleHorizontalList(
                itemCount: filterList.length,
                padding: EdgeInsets.only(
                    left: MAIN_PADDING_HORIZONTAL,
                    right: MAIN_PADDING_HORIZONTAL),
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
              );
            }
            return const Text('No data');
          }),
    ]);
  }
}
