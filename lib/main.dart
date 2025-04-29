import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Weather Application',
              theme: ThemeData(
                primarySwatch: createMaterialColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weather_status),
              ),
              home: const HomeView(),
            );
          },
        );
      }),
    );
  }
}
  MaterialColor createMaterialColor(String? stateOfWeather) {
    if (stateOfWeather == null) {
      return Colors.blue;
    }
    stateOfWeather = stateOfWeather.toLowerCase();

    if (stateOfWeather.contains('cloudy')) {
      return Colors.blueGrey;
    } else if (stateOfWeather.contains('sunny') ||
        stateOfWeather.contains('clear')) {
      return Colors.yellow;
    } else if (stateOfWeather.contains('snow')) {
      return Colors.lightBlue;
    } else if (stateOfWeather.contains('rain') ||
        stateOfWeather.contains('shower')) {
      return Colors.blue;
    } else if (stateOfWeather.contains('thunder')) {
      return Colors.deepPurple;
    } else if (stateOfWeather.contains('mist') ||
        stateOfWeather.contains('fog')) {
      return Colors.grey;
    } else if (stateOfWeather.contains('drizzle')) {
      return Colors.cyan;
    } else if (stateOfWeather.contains('overcast')) {
      return Colors.blueGrey;
    } else if (stateOfWeather.contains('snow') ||
        stateOfWeather.contains('ice')) {
      return Colors.lightBlue;
    } else {
      return Colors.teal;
    }
  }

