import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;
  int selectedIndex;

  BottomNavBar({super.key, required this.onTabChange, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: GNav(
        onTabChange: (value) => onTabChange!(value),
        color: Colors.grey[400],
        mainAxisAlignment: MainAxisAlignment.center,
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade300,
        tabBorderRadius: 0,
        selectedIndex: selectedIndex,
        padding: const EdgeInsets.only(right: 20, left: 20, bottom: 10,),
        tabActiveBorder: const Border(
                    bottom: BorderSide(width: 3.0, color: Colors.white), 
                  ),
        tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Home',
          iconSize: 25,
        ),
        GButton(
          icon: Icons.store,
          text: 'Shop',
          iconSize: 25,
        ),
        GButton(
          icon: Icons.shopping_cart,
          text: 'Cart',
          iconSize: 25,
        )
      ]),
    );
  }
}