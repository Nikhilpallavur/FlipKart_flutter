import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_flutter_app/utils/flipkart/data/products.dart';
import 'package:my_flutter_app/utils/flipkart/variables/firebase/firebaseVariable.dart';

createProduct(Product product) async {
  final docProduct =
      FirebaseFirestore.instance.collection(PRODUCTS_COLLECTION).doc();
  product.id = docProduct.id;
  final json = product.toJson();
  await docProduct.set(json);
}

createCategory(ProductCategory productCategory) async {
  final docProduct =
      FirebaseFirestore.instance.collection(CATEGORY_COLLECTION).doc();
  productCategory.id = docProduct.id;
  final json = productCategory.toJson();
  await docProduct.set(json);
}

addToCart(Product newProduct) async {
  final docProduct =
      FirebaseFirestore.instance.collection(CART_COLLECTION).doc();
  newProduct.id = docProduct.id;
  final json = newProduct.toJson();
  await docProduct.set(json);
}

Stream<List<Product>> getCartProduct() => FirebaseFirestore.instance
    .collection(CART_COLLECTION)
    .snapshots()
    .map((snapshots) =>
        snapshots.docs.map((e) => Product.fromJson(e.data())).toList());
