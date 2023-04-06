class Product {
  int productId;
  String productName;
  String productURL;
  String productPrice;
  String productGroup;
  Product(this.productId, this.productName, this.productURL, this.productPrice,
      this.productGroup);
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
