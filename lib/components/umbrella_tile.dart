import 'package:flutter/material.dart';
import 'package:weather_shop/models/umbrella.dart';

class UmbrellaTile extends StatelessWidget {
  final Umbrella umbrella;
  void Function()? onPressed;
  final Widget icon;

  UmbrellaTile({super.key, required this.umbrella, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12)
        ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 5),
      child: ListTile(
        title: Text(umbrella.name, style: const TextStyle(fontWeight: FontWeight.bold),),
        subtitle: Text("Diameter: ${umbrella.diameter}m \nHeight: ${umbrella.height}m\n${umbrella.price},-"),
        leading: Image.asset(umbrella.imagePath),
        trailing: IconButton(
          icon: icon,
          onPressed: onPressed,
        ),
      ),
    );
  }
}