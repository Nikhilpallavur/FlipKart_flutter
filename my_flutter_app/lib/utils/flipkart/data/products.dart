class Product {
  int productId;
  String productName;
  String productURL;
  String productPrice;
  String productGroup;
  int quantity;
  Product(this.productId, this.productName, this.productURL, this.productPrice,
      this.productGroup, this.quantity);
}

class ProductFilter {
  String name;
  String url;
  String listName;
  ProductFilter(
    this.name,
    this.url,
    this.listName,
  );
}
