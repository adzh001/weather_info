import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_practice/helpers/converter.dart';
import 'package:weather_practice/models/weather_models.dart';
import 'package:weather_practice/screens/weatherScreen_body.dart';

class WeatherInfoScreen extends StatelessWidget {
  final WeatherModel weatherModel;
  const WeatherInfoScreen({Key? key, required this.weatherModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent[100],
        title: const Text(
          "Weather",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: WeatherScreenBody(weatherModel: weatherModel),
    );
  }
}
