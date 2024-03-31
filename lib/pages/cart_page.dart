import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_shop/components/umbrella_tile.dart';
import 'package:weather_shop/models/umbrella.dart';
import 'package:weather_shop/models/umbrella_shop.dart';
import 'package:weather_shop/pages/home_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  void removeFromCart(Umbrella umbrella){
    Provider.of<UmbrellaShop>(context, listen: false).removeItemFromCart(umbrella);
  }

  void payNow(){
    //for empty cart
    if(Provider.of<UmbrellaShop>(context, listen: false).userCart.isEmpty){
      showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.brown,
        title: Center(
          child: Text(
            'Cart is empty!',
            style: TextStyle(fontSize: 20, color: Colors.white),
            ),
        ),
      ),
      );
      Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).pop();
      });
      return;
    }

    //for full cart
    Provider.of<UmbrellaShop>(context, listen: false).userCart.clear();
    
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage(index: 0)),
            );
    
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.brown,
        title: Center(
          child: Text(
            'Succesfully paid',
            style: TextStyle(fontSize: 20,color: Colors.white)
            ),
        ),
      ),
    );
    Future.delayed(const Duration(seconds: 1), () {
              Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UmbrellaShop>(
      builder: (context, value, child) => SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text(
              'Your cart',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),              
              ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView.builder(
                itemCount: value.userCart.length,
                itemBuilder: (context, index){
                Umbrella eachUmbrella = value.userCart[index];

                return UmbrellaTile(umbrella: eachUmbrella, 
                onPressed: () => removeFromCart(eachUmbrella), icon: const Icon(Icons.delete));
              })
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Total price: ${value.sumCart()},-",
                style: const TextStyle(fontSize: 20),              
                ),
            ),
            GestureDetector(
                onTap: payNow,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.brown, 
                  borderRadius: BorderRadius.circular(12)),
                  child: const Center(
                    child: Text("Pay now", 
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),),
                  ),
                ),
            ),
        ],),
      ),
    ),
    );
  }
}