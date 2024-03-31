import 'package:flutter/material.dart';
import 'package:weather_shop/models/umbrella.dart';

class UmbrellaShop extends ChangeNotifier{

  final List<Umbrella> _shop = [
    Umbrella(name: "Blue", diameter: 2.1 ,height: 2, price: 1200, imagePath: "lib/images/blue.png"),
    Umbrella(name: "Green", diameter: 2.3,height: 1.8,price: 1100, imagePath: "lib/images/green.png"),
    Umbrella(name: "Rainbow", diameter: 1.9,height: 1.9,price: 1300, imagePath: "lib/images/greenredyellow.png"),
    Umbrella(name: "Green and yellow",diameter: 2,height: 2.2, price: 1000, imagePath: "lib/images/greenyellow.png"),
    Umbrella(name: "Orange",diameter: 2.1,height: 1.8, price: 900, imagePath: "lib/images/orange.png"),
    Umbrella(name: "Orange and white", diameter: 2.4,height: 2.1,price: 1400, imagePath: "lib/images/orangewhite.png"),
    Umbrella(name: "Red", diameter: 1.9,height: 2.3,price: 1150, imagePath: "lib/images/red.png"),
    Umbrella(name: "Red and yellow", diameter: 2,height: 2,price: 1200, imagePath: "lib/images/redyellow.png")
  ];

  List<Umbrella> _userCart = [];

  List<Umbrella> get umbrellaShop => _shop;
  List<Umbrella> get userCart => _userCart;

  void addItemToCart(Umbrella umbrella){
    _userCart.add(umbrella);
    notifyListeners();
  }

  void removeItemFromCart(Umbrella umbrella){
    _userCart.remove(umbrella);
    notifyListeners();
  }

  double sumCart(){
    double sum = 0;
    for (var element in _userCart) {sum += element.price;}
    return sum;
  }
}