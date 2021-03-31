// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  Categories({
    this.categoryId,
    this.categoryName,
    this.image,
    this.products,
  });

  int categoryId;
  String categoryName;
  String image;
  List<Product> products;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    categoryId: json["category_id"],
    categoryName: json["category_name"],
    image: json["image"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "category_id": categoryId,
    "category_name": categoryName,
    "image": image,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
  };
}

class Product {
  Product({
    this.productId,
    this.productName,
    this.productDescription,
    this.productPrice,
    this.image,
    this.rating,
  });

  int productId;
  String productName;
  String productDescription;
  double productPrice;
  String image;
  double rating;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    productName: json["product_name"],
    productDescription: json["description"],
    productPrice: json["product_price"],
    image: json["image"],
    rating: json["rating"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "description": productDescription,
    "product_price": productPrice,
    "image": image,
    "rating": rating,
  };
}
