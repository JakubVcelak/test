import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_shop/components/umbrella_tile.dart';
import 'package:weather_shop/models/umbrella.dart';
import 'package:weather_shop/models/umbrella_shop.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  void addToCart (Umbrella umbrella){
    Provider.of<UmbrellaShop>(context, listen: false).addItemToCart(umbrella);

    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        backgroundColor: Colors.brown,
        title: Center(
          child: Text(
            'Succesfully added to cart',
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
    return Consumer<UmbrellaShop>(builder: (context, value, child)=> SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text("What type are you looking for?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: ListView.builder(
                itemCount: value.umbrellaShop.length,
                itemBuilder: (context, index){
                Umbrella eachUmbrella = value.umbrellaShop[index];

                return UmbrellaTile(
                  umbrella: eachUmbrella,
                  icon: const Icon(Icons.add_shopping_cart_outlined),
                  onPressed: () => addToCart(eachUmbrella),
                );
            }),)
          ],
        ),
      ),
    ));
  }
}