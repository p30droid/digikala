import 'package:carousel_slider/carousel_slider.dart';
import 'package:digikala/model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({Key? key}) : super(key: key);

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late Product product;

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    product = data;
    print(product);

    List<Widget> galleryList = [];

    for (int i = 0; i < product.gallery!.length; i++) {
      galleryList.add(Image.network(
        '${product.gallery![i].img}',
        fit: BoxFit.cover,
      ));
    }


    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: MediaQuery.of(context).size.height-80,
              child:
              SingleChildScrollView(
              child:   Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                              onPressed: () {}, icon: Icon(Icons.favorite)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.add_shopping_cart)),
                          IconButton(onPressed: () {}, icon: Icon(Icons.menu))
                        ],
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(Icons.close))
                    ],
                  ) ,


                  CarouselSlider(
                      items: galleryList,
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
                      )) ,


                  Text('${product.brand}' , style: TextStyle(
                      color: Colors.orange
                  ),),
                  Text('${product.title}' , style: TextStyle(
                      fontFamily: 'IRANSans',fontSize: 18.0 , color: Colors.black
                  ),),


                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),


                  Text('${product.fullDescription}' , style: TextStyle(
                      fontFamily: 'IRANSans',fontSize: 18.0 , color: Colors.black
                  ),),


                ],
              ),
            ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('${product.price}'),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('افزودن به سبد خرید'),
                    style: ElevatedButton.styleFrom(primary: Colors.redAccent),
                  ),
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
