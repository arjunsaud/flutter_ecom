import 'package:flutter/material.dart';
import 'package:flutter_ecom/cart_page.dart';
import 'product_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;

  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
      borderSide: BorderSide(
        color: Color.fromRGBO(255, 255, 255, 1),
      ),
    );
    return Scaffold(
      // body: pages[currentPage],

      //this indexed stack maintain scroll position
      body: IndexedStack(
        children: pages,
        index: currentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 28,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        //these above two are given because label takes some space if it is null
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ',',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: '',
          ),
        ],
      ),
    );
  }
}
