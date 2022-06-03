import 'package:dio/dio.dart';
import 'package:weather_practice/helpers/api_requester.dart';
import 'package:weather_practice/helpers/catch_exception.dart';
import 'package:weather_practice/models/weather_models.dart';

class WeatherProvider {
  Future<WeatherModel> getWeather(String city) async {
    try {
      ApiRequester requester = ApiRequester();
      print('city ==== $city');
      Response response = await requester.toGet("",
          param: {"q": city, "appid": "352b56119861f0415ec44480c7f72df0"});
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return WeatherModel.fromJson(response.data);
      } else {
        throw CatchException.convertException(response);
      }
    } catch (e) {
      print('e ===== $e');
      throw CatchException.convertException(e);
    }
  }
}
