import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Product {
  Product({
    required this.id,
    required this.name,
    required this.info,
    required this.description,
    required this.points,
    required this.slug,
    required this.stock,
    required this.images,
    required this.isNew,
    required this.rating,
    required this.numOfReviews,
    required this.isWishlist,
  });


  int id;
  String? name;
  String? info;
  String? description;
  int? points;
  String slug;
  int stock;
  List<String> images;
  int isNew;
  double rating;
  int numOfReviews;
  int isWishlist;

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}