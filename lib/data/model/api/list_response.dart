class ListResponse {
  final List<Product> products;

  ListResponse(this.products);

  factory ListResponse.fromJson(dynamic json) {
    return ListResponse(
        (json['data'] as List).map((e) => Product.fromJson(e)).toList()
    );
  }
}

class Product {
  final String? prodName;
  final String? prodContent;

  Product(this.prodName, this.prodContent);

  factory Product.fromJson(dynamic json) => Product(
      json['prodName'] as String,
      json['prodContent'] as String
  );
}
