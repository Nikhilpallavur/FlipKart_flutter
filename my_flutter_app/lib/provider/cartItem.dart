import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:my_flutter_app/utils/flipkart/firebase/product.dart';
import 'package:my_flutter_app/utils/flipkart/variables/firebase/firebaseVariable.dart';

class CartProvider extends ChangeNotifier {
  List<Product> products = [];

  void updateList(List<Product> newData) {
    products = newData;
  }

  void add(Product newData) {
    updateData() => {
          addToCart(Product(newData.id, newData.productName, newData.url,
              newData.productPrice, newData.productGroup, 1)),
          products.add(Product(newData.id, newData.productName, newData.url,
              newData.productPrice, newData.productGroup, 1))
        };
    if (products.isNotEmpty) {
      // element.productName == newData.productName
      String keyToUpdate = newData.id; // The key to find
      var valueNotFound = true;

      // Iterate through the array and find the object to update
      for (Product obj in products) {
        if (obj.id == keyToUpdate) {
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
