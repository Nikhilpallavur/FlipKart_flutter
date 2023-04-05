import 'package:flutter/foundation.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';

class CartProvider extends ChangeNotifier {
  List<Product> products = [];

  void add(newData) {
    if (products.contains(newData)) {
      if (kDebugMode) {
        print('Product already added ');
      }
    } else {
      products.add(newData);
    }
    notifyListeners();
  }
}
