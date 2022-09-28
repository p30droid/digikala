// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseModel _$BaseModelFromJson(Map<String, dynamic> json) => BaseModel(
      json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      (json['mobile'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['makeup'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['discount'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['AmazingOffer'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['news'] as List<dynamic>?)
          ?.map((e) => News.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BaseModelToJson(BaseModel instance) => <String, dynamic>{
      'data': instance.data,
      'mobile': instance.mobilesList,
      'makeup': instance.makeupsList,
      'discount': instance.discountsList,
      'AmazingOffer': instance.amazingOffersList,
      'news': instance.newsList,
    };
