import 'package:flutter/material.dart';
import 'package:weather_shop/models/weather_model.dart';
import 'package:weather_shop/pages/home_page.dart';
import 'package:weather_shop/service/weather_service.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  final _weatherService = WeatherService('f6f501f40a76adb57bdcbef67a644ef2');
  Weather? _weather;

  _fetchWeather() async{
    String city = await _weatherService.getCurrentCity();

    try{
      final weather = await _weatherService.getWeather(city);
      setState(() {
        _weather = weather;
      });
    }catch(er){
      print(er);
    }
  }  

  void shopNow(){
    Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage(index: 1)),
            );
  }

  @override
  void initState(){
    super.initState();

    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(top: 80, right: 25, bottom: 25, left: 25),
        child: Column(
          children: [
            const Icon(Icons.beach_access, size: 80, color: Colors.brown),
            const SizedBox(height: 30),
            const Text(
              'Welcome to Parasol shop!',
              style: TextStyle(fontSize: 28),              
              ),
            const SizedBox(height: 80),
            Text(_weather?.city != null ? "Hello to ${_weather?.city}" : "", style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 15),
            Text(_weather?.temperature.round() != null ? "You have nice ${_weather?.temperature.round()}°C" : "", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 30),
            const Text('Let´s buy some parasols!', style: TextStyle(fontSize: 18),),
            Container(
              margin: const EdgeInsets.only(top: 140),
              child: GestureDetector(
                  onTap: shopNow,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.brown, 
                    borderRadius: BorderRadius.circular(12)),
                    child: const Center(
                      child: Text("Shop now", 
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),),
                    ),
                  ),
              ),
            ),
        ],),
      ),
    );
  }
}