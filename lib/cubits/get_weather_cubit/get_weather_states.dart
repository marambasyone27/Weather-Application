// states of the application
import 'package:weather_app/model/weather_model.dart';

class WeatherState{}
class WeatherInitialState extends WeatherState{}
class WeatherLoadingState extends WeatherState{
  final WeatherModel weatherModel;

  WeatherLoadingState({required this.weatherModel});
}
class WeatherFailureState extends WeatherState{
  final String ErrorMessage;

  WeatherFailureState({required this.ErrorMessage});
}