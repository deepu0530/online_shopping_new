// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  Categories({
    this.products,
    this.page,
    this.limit,
    this.count,
  });

  List<Product> products;
  int page;
  int limit;
  int count;

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    page: json["page"],
    limit: json["limit"],
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "page": page,
    "limit": limit,
    "count": count,
  };
}

class Product {
  Product({
    this.productId,
    this.productName,
    this.productPrice,
    this.categoryId,
    this.categoryName,
    this.imageUrl,
    this.description,
    this.rating,
  });

  int productId;
  String productName;
  int productPrice;
  int categoryId;
  CategoryName categoryName;
  String imageUrl;
  String description;
  double rating;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    productId: json["product_id"],
    productName: json["product_name"],
    productPrice: json["product_price"],
    categoryId: json["category_id"],
    categoryName: categoryNameValues.map[json["category_name"]],
    imageUrl: json["image_url"],
    description: json["description"],
    rating: json["rating"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_name": productName,
    "product_price": productPrice,
    "category_id": categoryId,
    "category_name": categoryNameValues.reverse[categoryName],
    "image_url": imageUrl,
    "description": description,
    "rating": rating,
  };
}

enum CategoryName { GROCERY, EBOOKS, TOYS, APPLIANCES, ELECTRONICS }

final categoryNameValues = EnumValues({
  "Appliances": CategoryName.APPLIANCES,
  "ebooks": CategoryName.EBOOKS,
  "Electronics": CategoryName.ELECTRONICS,
  "Grocery": CategoryName.GROCERY,
  "Toys": CategoryName.TOYS
});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
