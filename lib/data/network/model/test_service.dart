import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class Test{

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}