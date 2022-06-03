import 'package:weather_practice/models/weather_models.dart';
import 'package:weather_practice/screens/main_screen/bloc/weather_provider.dart';

class WeatherRepository {
  Future<WeatherModel> getWeather(String city) {
    WeatherProvider provider = WeatherProvider();
    return provider.getWeather(city);
  }
}
