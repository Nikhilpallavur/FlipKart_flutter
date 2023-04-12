class Product {
  String id;
  String productName;
  String url;
  String productPrice;
  String productGroup;
  int quantity;
  Product(this.id, this.productName, this.url, this.productPrice,
      this.productGroup, this.quantity);

  Map<String, dynamic> toJson() => {
        'id': id,
        'productName': productName,
        'url': url,
        'productPrice': productPrice,
        'productGroup': productGroup,
        'quantity': quantity
      };

  static Product fromJson(Map<String, dynamic> json) => Product(
      json['id'],
      json['productName'],
      json['url'],
      json['productPrice'],
      json['productGroup'],
      json['quantity']);
}

class ProductCategory {
  String id;
  String name;
  String url;
  String groupName;
  ProductCategory(
    this.id,
    this.name,
    this.url,
    this.groupName,
  );

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'url': url, 'groupName': groupName};

  static ProductCategory fromJson(Map<String, dynamic> json) =>
      ProductCategory(json['id'], json['name'], json['url'], json['groupName']);
}
