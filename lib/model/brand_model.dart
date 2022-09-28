import 'package:json_annotation/json_annotation.dart';

part 'brand_model.g.dart';
@JsonSerializable()
class BrandModel {

  String? brand;

  BrandModel(this.brand);


  factory BrandModel.fromJson(Map<String, dynamic> json) => _$BrandModelFromJson(json);
  Map<String, dynamic> toJson() => _$BrandModelToJson(this);
}