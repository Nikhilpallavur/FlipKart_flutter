// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:my_flutter_app/components/flipkart/image/networkImage.dart';
import 'package:my_flutter_app/pages/flipkart/landingPage/main.dart';
import 'package:my_flutter_app/provider/cartItem.dart';
import 'package:my_flutter_app/style/flipkart/colors.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:my_flutter_app/utils/flipkart/variables/styleVariables.dart';
import 'package:my_flutter_app/utils/flipkart/variables/tabVariables.dart';
import 'package:provider/provider.dart';

class ProductDetails extends StatefulWidget {
  final Product itemData;
  final List<dynamic> itemList;

  const ProductDetails(
      {super.key, required this.itemData, required this.itemList});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  void addToCartOnClick() {
    context.read<CartProvider>().add(widget.itemData);
    // Navigator.pop(context, true);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyHomePageMain(
                  selectedButtonProps: FLIPKART,
                  selectedTabProps: BOTTOM_TABS.Cart.name,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  SingleChildScrollView(
                      clipBehavior: Clip.antiAlias,
                      padding:
                          EdgeInsets.only(bottom: MAIN_PADDING_VERTICAL * 3),
                      child: Stack(children: [
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: 1000,
                                  height: 300,
                                  color: Colors.white,
                                  child: Padding(
                                      padding: EdgeInsets.only(
                                          bottom: LARGE_IMAGE_PADDING),
                                      child: SizedBox(
                                          width: 1000,
                                          height: 300,
                                          child: NetWorkImage(
                                            url: widget.itemData.productURL,
                                            width: 1000,
                                            height: 250,
                                            objectFit: BoxFit.contain,
                                          )))),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: MAIN_PADDING_HORIZONTAL,
                                    vertical: MAIN_PADDING_HORIZONTAL),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.itemData.productName,
                                        style: const TextStyle(
                                            fontSize: 35,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            '30% off',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600,
                                                color: APP_GREEN_COLOR),
                                          ),
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          Text(
                                            '450.00',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w400,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: DISABLE_COLOR),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            '₹200.50',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w600),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'simply dummy text of the printing and typesetting',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Text(
                                        "          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        "          Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ]),
                              ),
                            ]),
                        Positioned(
                          top: 20,
                          left: MAIN_PADDING_HORIZONTAL,
                          child: GestureDetector(
                              onTap: () => Navigator.pop(context),
                              child: Icon(
                                Icons.arrow_back,
                                size: 30,
                                color: APP_ICON_DEFAULT_COLOR,
                              )),
                        ),
                      ])),
                  Positioned(
                    left: 0,
                    width: MediaQuery.of(context).size.width,
                    bottom: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Button(
                              text: 'Add to Cart',
                              bgColor: APP_COLOR,
                              textColor: APP_TEXT_COLOR,
                              onPress: () => addToCartOnClick()),
                          Button(
                              text: 'Book Now',
                              bgColor: BOOK_BUTTON_BG_COLOR,
                              textColor: BUTTON_TEXT_COLOR,
                              onPress: () => addToCartOnClick())
                        ]),
                  ),
                ]))));
  }

  Widget Button(
      {text, bgColor = Colors.blue, textColor = Colors.white, onPress}) {
    return GestureDetector(
        onTap: onPress,
        child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Container(
                color: bgColor,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: MAIN_PADDING_VERTICAL),
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: 18,
                      color: textColor,
                      fontWeight: FontWeight.w500),
                ))));
  }
}
