// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      json['id'] as String?,
      json['catId'] as String?,
      json['catName'] as String?,
      json['title'] as String?,
      json['brand'] as String?,
      json['garanti'] as String?,
      json['count'] as String?,
      json['shortDescription'] as String?,
      json['fullDescription'] as String?,
      json['special'] as String?,
      json['discount'] as String?,
      json['rate'] as String?,
      json['price'] as String?,
      json['icon'] as String?,
      (json['gallery'] as List<dynamic>?)
          ?.map((e) => Gallery.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'catId': instance.catId,
      'catName': instance.catName,
      'title': instance.title,
      'brand': instance.brand,
      'garanti': instance.garanti,
      'count': instance.count,
      'shortDescription': instance.shortDescription,
      'fullDescription': instance.fullDescription,
      'special': instance.special,
      'discount': instance.discount,
      'rate': instance.rate,
      'price': instance.price,
      'icon': instance.icon,
      'gallery': instance.gallery,
    };
