import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_practice/commons/theme_helper.dart';
import 'package:weather_practice/screens/main_screen/bloc/weather_bloc.dart';
import 'package:weather_practice/screens/main_screen/mainScreen_bloc.dart';
import 'package:weather_practice/screens/weatherScreen.dart';
//import 'package:weather_practice/screens/weatherScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  WeatherBloc weatherBloc = WeatherBloc();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 85, 150, 87),
          Colors.orange,
          Color.fromARGB(255, 221, 95, 137),
        ], begin: Alignment.topRight, end: Alignment.bottomCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Enter your city",
              style: TextHelper.medium.copyWith(
                color: ThemeHelper.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: textEditingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ThemeHelper.yellow))),
            ),
            MainScreenBloc(
              textEditingController: textEditingController,
            ),
          ],
        ),
      ),
    );
  }
}
