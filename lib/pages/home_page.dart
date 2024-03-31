import 'package:flutter/material.dart';
import 'package:weather_shop/components/bottom_nav_bar.dart';
import 'package:weather_shop/const.dart';
import 'package:weather_shop/pages/cart_page.dart';
import 'package:weather_shop/pages/shop_page.dart';
import 'package:weather_shop/pages/welcome_page.dart';

class HomePage extends StatefulWidget {
  final int index;
  const HomePage({super.key,required this.index});

  @override
  State<HomePage> createState() =>_HomePageState(selectedIndex: this.index);
}

class _HomePageState extends State<HomePage> {
  int selectedIndex;
  _HomePageState({required this.selectedIndex});

  //navigate bottom bar
  void navigateBottomBar(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  //pages
  final List<Widget> _pages = [
    const WelcomePage(),
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      //do not display on welcome page
      bottomNavigationBar: selectedIndex > 0? BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index), selectedIndex: selectedIndex
      ): null,
      body: _pages[selectedIndex],
    );
  }
}

class CardPage {
}