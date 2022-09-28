

import 'package:digikala/model/base_category_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/base_model.dart';
part 'rest_client.g.dart';
@RestApi(baseUrl: 'http://androidsupport.ir/pack/digiAndroid/')
abstract class RestClient{

  factory RestClient(Dio dio , {String baseUrl}) = _RestClient;



  @GET('home.php')
  Future<BaseModel> getHome();

  @GET('getCategories.php')
  Future<BaseCategoryModel> getCategories();


}