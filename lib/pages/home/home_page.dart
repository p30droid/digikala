import 'package:digikala/pages/cart/cart_page.dart';
import 'package:digikala/pages/category/category_page.dart';
import 'package:digikala/pages/main/main_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> screens = [MainPage(), CategoryPage(), CartPage()];
  int currentItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens.elementAt(currentItem),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: 'Category'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart), label: 'Cart')
        ],
        currentIndex: currentItem,
        onTap: (value) {
          setState(() {
            currentItem = value;
          });
        },
      ),
    );
  }
}
