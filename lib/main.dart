import 'package:bubble_tea_shop/components/bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'pages/cart_page.dart';
import 'pages/shop_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bubble Tea Shop',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

//Navigate bottom bar
int _selectedIndex = 0;
void navigateBottomBar(int newIndex){
  setState(() {
    _selectedIndex = newIndex;
  });
}
// Paginas 
final List<Widget> _pages = [
  ShopPage(),

  CartPage(),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
