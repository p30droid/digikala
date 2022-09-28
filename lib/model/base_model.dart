
import 'package:digikala/model/news_model.dart';
import 'package:digikala/model/product_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'data_model.dart';
part 'base_model.g.dart';
@JsonSerializable()
class BaseModel {


  @JsonKey(name: 'data')
  Data? data;
  @JsonKey(name: 'mobile')
  List<Product>? mobilesList;
  @JsonKey(name: 'makeup')
  List<Product>? makeupsList;
  @JsonKey(name: 'discount')
  List<Product>? discountsList;
  @JsonKey(name: 'AmazingOffer')
  List<Product>? amazingOffersList;
  @JsonKey(name: 'news')
  List<News>? newsList;

  BaseModel(this.data, this.mobilesList, this.makeupsList, this.discountsList,
      this.amazingOffersList, this.newsList);

  factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);
  Map<String, dynamic> toJson() => _$BaseModelToJson(this);



}