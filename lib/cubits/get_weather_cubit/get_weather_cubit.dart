import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';

class  GetWeatherCubit extends Cubit<WeatherState>{
  GetWeatherCubit():super(WeatherInitialState());// no weather available yet
    WeatherModel?  weatherModel;
 getCurrentWeather({required String cityName}) async { // this method will be called from the search view screen
    try {
   weatherModel=await WeatherServices(Dio()).getCurrentWeather(city: cityName);
      emit(WeatherLoadingState(weatherModel: weatherModel!));

}  catch (e) {
  emit(WeatherFailureState(
     ErrorMessage: e.toString(),
  ));
}
     }
}