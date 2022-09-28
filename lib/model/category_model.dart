import 'package:json_annotation/json_annotation.dart';

part 'category_model.g.dart';
@JsonSerializable()
class CategoryModel {

  String? id;
  String? title;
  String? description;
  String? icon;

  CategoryModel(this.id, this.title, this.description, this.icon);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => _$CategoryModelFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}