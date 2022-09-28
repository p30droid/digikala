import 'package:carousel_slider/carousel_slider.dart';
import 'package:digikala/api/rest_client.dart';
import 'package:digikala/model/base_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late Future<BaseModel> homeData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    var dio = Dio();

    final client = RestClient(dio);
    Logger logger = Logger();

    homeData = client.getHome();
    client.getHome().then((value) => logger.d(value));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,

        child: SingleChildScrollView(

          child:    Column(
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
              FutureBuilder<BaseModel>(
                future: homeData,
                builder: (context, snapshot) {
                  print('');
                  if (snapshot.hasData) {
                    List<Widget> newsList = [];

                    for (int i = 0; i < snapshot.data!.newsList!.length; i++) {
                      newsList.add(Image.network(
                        '${snapshot.data!.newsList![i].icon}',
                        fit: BoxFit.cover,
                      ));
                    }

                    return Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CarouselSlider(
                              items: newsList,
                              options: CarouselOptions(
                                height: 200,
                                aspectRatio: 16 / 9,
                                viewportFraction: 0.8,
                                initialPage: 0,
                                enableInfiniteScroll: true,
                                reverse: false,
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 3),
                                autoPlayAnimationDuration:
                                Duration(milliseconds: 800),
                                autoPlayCurve: Curves.fastOutSlowIn,
                                enlargeCenterPage: true,
                                scrollDirection: Axis.horizontal,
                              )),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'برترین موبایل ها',
                              style: TextStyle(fontFamily: 'IRANSans'),
                            ),
                          ),
                          Container(
                            height: 204,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount: snapshot.data!.mobilesList!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return

                                   GestureDetector(
                                     onTap: () {
                                       Get.toNamed('/detail' , arguments: snapshot.data!.mobilesList![index] );
                                     },
                                     child:  Container(
                                       margin: EdgeInsets.only(right: 8.0),
                                       color: Colors.white,
                                       height: 204,
                                       width: 164,
                                       child: Column(
                                         children: [
                                           Image.network(
                                             '${snapshot.data!.mobilesList![index].icon}' , fit: BoxFit.cover,
                                             width: 120,height: 120,
                                           ) ,
                                           SizedBox(height: 5,),
                                           setTitle('${snapshot.data!.mobilesList![index].title}'),
                                           SizedBox(height: 5,),
                                           Row(

                                             mainAxisAlignment: MainAxisAlignment.spaceAround,
                                             children: [

                                               Text(
                                                 '${snapshot.data!.mobilesList![index].price}',
                                                 style: TextStyle(fontFamily: 'IRANSans'),
                                               ),


                                               if(snapshot.data!.mobilesList![index].discount!="0")
                                                 Container(
                                                   width: 30,
                                                   height: 20,
                                                   decoration: BoxDecoration(
                                                       color: Colors.redAccent ,
                                                       borderRadius: BorderRadius.circular(4.0)
                                                   ),
                                                   child:     Center(child: Text(
                                                     '%${snapshot.data!.mobilesList![index].discount}',
                                                     style: TextStyle(fontFamily: 'IRANSans' , color: Colors.white),
                                                   ) ,),

                                                 )


                                             ],

                                           )
                                         ],
                                       ),
                                     ),

                                   );
                                }),
                          ) ,

                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'منتخب آرایشی و بهداشتی',
                              style: TextStyle(fontFamily: 'IRANSans'),
                            ),
                          ),
                          Container(
                            height: 204,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount: snapshot.data!.makeupsList!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 8.0),
                                    color: Colors.white,
                                    height: 204,
                                    width: 164,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          '${snapshot.data!.makeupsList![index].icon}' , fit: BoxFit.cover,
                                          width: 120,height: 120,
                                        ) ,
                                        SizedBox(height: 5,),
                                        setTitle('${snapshot.data!.makeupsList![index].title}'),
                                        SizedBox(height: 5,),
                                        Row(

                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [

                                            Text(
                                              '${snapshot.data!.makeupsList![index].price}',
                                              style: TextStyle(fontFamily: 'IRANSans'),
                                            ),


                                            if(snapshot.data!.makeupsList![index].discount!="0")
                                              Container(
                                                width: 30,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Colors.redAccent ,
                                                    borderRadius: BorderRadius.circular(4.0)
                                                ),
                                                child:     Center(child: Text(
                                                  '%${snapshot.data!.makeupsList![index].discount}',
                                                  style: TextStyle(fontFamily: 'IRANSans' , color: Colors.white),
                                                ) ,),

                                              )


                                          ],

                                        )
                                      ],
                                    ),
                                  );
                                }),
                          ) ,

                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'پیشنهاد های شگفت انگیز',
                              style: TextStyle(fontFamily: 'IRANSans'),
                            ),
                          ),
                          Container(
                            height: 204,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                                itemCount: snapshot.data!.amazingOffersList!.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 8.0),
                                    color: Colors.white,
                                    height: 204,
                                    width: 164,
                                    child: Column(
                                      children: [
                                        Image.network(
                                          '${snapshot.data!.amazingOffersList![index].icon}' , fit: BoxFit.cover,
                                          width: 120,height: 120,
                                        ) ,
                                        SizedBox(height: 5,),
                                        setTitle('${snapshot.data!.amazingOffersList![index].title}'),
                                        SizedBox(height: 5,),
                                        Row(

                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [

                                            Text(
                                              '${snapshot.data!.amazingOffersList![index].price}',
                                              style: TextStyle(fontFamily: 'IRANSans'),
                                            ),


                                            if(snapshot.data!.amazingOffersList![index].discount!="0")
                                              Container(
                                                width: 30,
                                                height: 20,
                                                decoration: BoxDecoration(
                                                    color: Colors.redAccent ,
                                                    borderRadius: BorderRadius.circular(4.0)
                                                ),
                                                child:     Center(child: Text(
                                                  '%${snapshot.data!.amazingOffersList![index].discount}',
                                                  style: TextStyle(fontFamily: 'IRANSans' , color: Colors.white),
                                                ) ,),

                                              )


                                          ],

                                        )
                                      ],
                                    ),
                                  );
                                }),
                          )





                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("error");
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),

        ),
      ),
    );
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
