import 'dart:convert';

AddCategory addCategoryFromJson(String str) => AddCategory.fromJson(json.decode(str));

String addCategoryToJson(AddCategory data) => json.encode(data.toJson());

class AddCategory {
  AddCategory({
    this.data,
  });

  Data data;

  factory AddCategory.fromJson(Map<String, dynamic> json) => AddCategory(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.message,
    this.name,
    this.image,
  });

  String message;
  String name;
  String image;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    message: json["message"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "name": name,
    "image": image,
  };
}