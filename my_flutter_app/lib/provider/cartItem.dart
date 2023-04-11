import 'package:flutter/foundation.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';

class CartProvider extends ChangeNotifier {
  List<Product> products = [];

  void add(Product newData) {
    updateData() => {
          products.add(Product(
              newData.productId,
              newData.productName,
              newData.productURL,
              newData.productPrice,
              newData.productGroup,
              1))
        };
    if (products.isNotEmpty) {
      // element.productName == newData.productName
      String keyToUpdate = newData.productName; // The key to find
      var valueNotFound = true;

      // Iterate through the array and find the object to update
      for (Product obj in products) {
        if (obj.productName == keyToUpdate) {
          obj.quantity = obj.quantity + 1; // Update the value
          valueNotFound = false;
          break; // Stop iterating after finding the object
        }
      }
      if (valueNotFound) {
        updateData();
      }

      for (Product obj in products) {
        print("Key: ${obj.productName}, Value: ${obj.quantity}");
      }

      if (kDebugMode) {
        print('Product already added ');
      }

      return;
    }
    updateData();
    notifyListeners();
  }
}
