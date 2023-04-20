// ignore_for_file: camel_case_types

import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';

final orderListProductsProvider =
    StateNotifierProvider<orderListRiverPod, List<Product>>((ref) {
  return orderListRiverPod();
});

class orderListRiverPod extends StateNotifier<List<Product>> {
  orderListRiverPod() : super([]);

  // void add(Product newData) {
  //   if (state.contains(newData)) {
  //     state.remove(newData);
  //     return;
  //   }
  //   state = [...state, newData];
  //   return;
  // }

  void add(Product newData) {
    updateData() => {
          state = [...state, newData]
        };
    if (state.isNotEmpty) {
      // element.productName == newData.productName
      String keyToUpdate = newData.id; // The key to find
      var valueNotFound = true;

      // Iterate through the array and find the object to update
      for (Product obj in state) {
        if (obj.id == keyToUpdate) {
          obj.quantity = obj.quantity + 1; // Update the value
          valueNotFound = false;
          break; // Stop iterating after finding the object
        }
      }
      if (valueNotFound) {
        updateData();
      }

      for (Product obj in state) {
        print("Key: ${obj.productName}, Value: ${obj.quantity}");
      }

      return;
    }
    updateData();
  }
}
