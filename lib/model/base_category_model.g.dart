// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseCategoryModel _$BaseCategoryModelFromJson(Map<String, dynamic> json) =>
    BaseCategoryModel(
      (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      (json['brands'] as List<dynamic>?)
          ?.map((e) => BrandModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseCategoryModelToJson(BaseCategoryModel instance) =>
    <String, dynamic>{
      'categories': instance.categoryModel,
      'data': instance.data,
      'brands': instance.brands,
    };
