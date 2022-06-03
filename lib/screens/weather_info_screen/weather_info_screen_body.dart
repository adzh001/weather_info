import 'package:flutter/material.dart';
import 'package:weather_practice/helpers/converter.dart';
import 'package:weather_practice/models/weather_models.dart';

class WeatherScreenBody extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherScreenBody({Key? key, required this.weatherModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 164, 98, 175),
        Color.fromARGB(255, 246, 160, 53),
        Color.fromARGB(255, 75, 154, 219)
      ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
      child: Center(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            getDateFormat(weatherModel.dt!),
            style: const TextStyle(
                fontSize: 27, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            weatherModel.name.toString(),
            style: const TextStyle(
                fontSize: 27, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        Image.network(
          "http://openweathermap.org/img/wn/${weatherModel.weather!.first.icon}@4x.png",
        ),
        Text(
          getTemp(weatherModel.main!.temp!).toString() + "°C",
          style: const TextStyle(
              fontSize: 27, fontWeight: FontWeight.w500, color: Colors.white),
        ),
        const SizedBox(
          height: 100,
        ),
        const Text(
          "Monday",
          style: TextStyle(
              fontSize: 27, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ])),
    );
  }
}
