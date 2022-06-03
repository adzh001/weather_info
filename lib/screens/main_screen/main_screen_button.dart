import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_practice/commons/theme_helper.dart';
import 'package:weather_practice/screens/main_screen/bloc/weather_bloc.dart';
import 'package:weather_practice/screens/weatherScreen.dart';

class MainScreenBloc extends StatefulWidget {
  final TextEditingController textEditingController;
  const MainScreenBloc({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  State<MainScreenBloc> createState() => _MainScreenBlocState();
}

class _MainScreenBlocState extends State<MainScreenBloc> {
  late WeatherBloc weatherBloc;

  @override
  void initState() {
    weatherBloc = WeatherBloc();

    super.initState();
  }

  Widget build(BuildContext context) {
    return BlocConsumer<WeatherBloc, WeatherState>(
      bloc: weatherBloc,
      listener: (context, state) {
        if (state is WeatherErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error.message!)));
        }

        if (state is WeatherFetchedState) {
          widget.textEditingController.clear();
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => WeatherInfoScreen(
                        weatherModel: state.weatherModel,
                      )));
        }
      },
      builder: (context, state) {
        if (state is WeatherLoadingState) {
          return const CircularProgressIndicator();
        }
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(primary: ThemeHelper.yellow),
            onPressed: () {
              weatherBloc.add(
                  GetWeatherEvent(city: widget.textEditingController.text));
            },
            child: Text("Search city",
                style: TextHelper.medium.copyWith(
                  color: ThemeHelper.black,
                )),
          ),
        );
      },
    );
  }
}
