import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weather_practice/helpers/catch_exception.dart';
import 'package:weather_practice/models/weather_models.dart';
import 'package:weather_practice/screens/main_screen/bloc/weather_repository.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()) {
    on<GetWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        WeatherModel weatherModel =
            await WeatherRepository().getWeather(event.city);
        emit(WeatherFetchedState(weatherModel: weatherModel));
      } catch (e) {
        emit(WeatherErrorState(error: CatchException.convertException(e)));
      }
    });
  }
}
