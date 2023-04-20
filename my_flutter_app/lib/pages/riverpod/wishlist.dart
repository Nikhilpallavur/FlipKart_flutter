import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';

final wishListProductsProvider =
    StateNotifierProvider<WishListRiverPod, List<Product>>((ref) {
  return WishListRiverPod();
});

class WishListRiverPod extends StateNotifier<List<Product>> {
  WishListRiverPod() : super([]);

  void add(Product newData) {
    if (state.contains(newData)) {
      state.remove(newData);
      return;
    }
    state = [...state, newData];
    return;
  }
}
