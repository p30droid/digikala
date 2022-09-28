import 'package:digikala/model/base_category_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../api/rest_client.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  late Future<BaseCategoryModel> categories;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var dio = Dio();

    final client = RestClient(dio);
    Logger logger = Logger();
    categories = client.getCategories();



  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.all(8.0),
            height: 50.0,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(4.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('جستجو در دیجی کالا',
                    style: TextStyle(fontFamily: 'IRANSans')),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],
            ),
          ),

          FutureBuilder<BaseCategoryModel>(
              future: categories,
              builder: (context , snapshot) {

            if(snapshot.hasData){

              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [

                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'دسته بندی ها ',
                        style: TextStyle(fontFamily: 'IRANSans'),
                      ),
                    ),
                    Container(
                      height: 204,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: snapshot.data!.categoryModel!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 8.0),
                              color: Colors.white,
                              height: 164,
                              width: 164,
                              child: Column(
                                children: [
                                  Image.network(
                                    '${snapshot.data!.categoryModel![index].icon}' , fit: BoxFit.cover,
                                    width: 120,height: 120,
                                  ) ,
                                  SizedBox(height: 5,),
                                  setTitle('${snapshot.data!.categoryModel![index].title}'),
                                  SizedBox(height: 5,),

                                ],
                              ),
                            );
                          }),
                    ) ,

                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'برندها',
                        style: TextStyle(fontFamily: 'IRANSans'),
                      ),
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: snapshot.data!.brands!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.only(right: 8.0),
                              color: Colors.white,
                              height: 80,
                              width: 100,
                              child: Center(
                                child:
                                  setTitle('${snapshot.data!.brands![index].brand}'),
                                
                              ),
                            );
                          }),
                    ) ,


                  ],
                ),
              );

            }else if(snapshot.hasError) {

              return Text('Error');

            }else {
              return CircularProgressIndicator();
            }

          })
        ],

      ),


    ));
  }

  Widget setTitle(String title) {

    if(title.length<20) {

      return Text(
        '${title}',
        style: TextStyle(fontFamily: 'IRANSans'),
      );


    }else {

      return Text(
        '${title.substring(0,20)}',
        style: TextStyle(fontFamily: 'IRANSans'),
      );


    }

  }


}
