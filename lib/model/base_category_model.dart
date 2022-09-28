import 'package:digikala/model/brand_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'category_model.dart';
import 'data_model.dart';

part 'base_category_model.g.dart';

@JsonSerializable()
class BaseCategoryModel {
  @JsonKey(name: 'categories')
  List<CategoryModel>? categoryModel;

  @JsonKey(name: 'data')
  Data? data;
  @JsonKey(name: 'brands')
  List<BrandModel>? brands;
  BaseCategoryModel(this.categoryModel, this.data, this.brands);


  factory BaseCategoryModel.fromJson(Map<String, dynamic> json) => _$BaseCategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseCategoryModelToJson(this);

}
