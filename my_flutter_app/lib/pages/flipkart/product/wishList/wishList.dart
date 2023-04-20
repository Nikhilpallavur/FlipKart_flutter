import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_app/components/flipkart/image/networkImage.dart';
import 'package:my_flutter_app/components/flipkart/layout/card/simpleCard.dart';
import 'package:my_flutter_app/components/flipkart/warning/noData/noData.dart';
import 'package:my_flutter_app/pages/riverpod/wishlist.dart';
import 'package:my_flutter_app/style/flipkart/colors.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';

class WishList extends ConsumerStatefulWidget {
  const WishList({super.key});

  @override
  ConsumerState<WishList> createState() => _WishListState();
}

class _WishListState extends ConsumerState<WishList> {
  @override
  Widget build(BuildContext context) {
    void onClickCard() {}

    var products = ref.watch(wishListProductsProvider);
    // List<Product> products = [];
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: APP_BAR_BG,
          title: const Text("My wish list"),
        ),
        body: Padding(
            padding: EdgeInsets.only(
                left: MAIN_PADDING_HORIZONTAL,
                right: MAIN_PADDING_HORIZONTAL,
                top: MAIN_PADDING_VERTICAL),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: products.isEmpty
                    ? SizedBox(
                        width: 350,
                        height: 150,
                        /*decoration: BoxDecoration( color: Colors.red, borderRadius: BorderRadius.circular(50.0)),*/
                        child: NoDataContainer())
                    : ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SimpleCard(
                              onClick: () {
                                onClickCard();
                              },
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                        height: 110,
                                        width: 110,
                                        child: NetWorkImage(
                                          url: products[index].url,
                                          alignment: Alignment.center,
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 15),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(products[index].productName),
                                            Row(
                                              children: [
                                                const Text(
                                                  'Count',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 4.0),
                                                  child: Text(products[index]
                                                      .quantity
                                                      .toString()),
                                                ),
                                              ],
                                            )
                                          ]),
                                    )
                                  ]));
                        }))));
  }
}
