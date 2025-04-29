
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GetWeatherCubit cubit= GetWeatherCubit();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: getAppBarColor(context), 
        // backgroundColor: Colors.deepOrangeAccent,
        // elevation: 10,
        // shadowColor: const Color.fromARGB(255, 239, 23, 8),
        // centerTitle: true,
        title: const Text(
          'Weather App',
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SearchView(),
              ),
            ),
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),

      body: BlocBuilder<GetWeatherCubit,WeatherState>(
        builder: (context,state){
          if(state is WeatherInitialState){// appear when no weather data is available
            return const NoWeatherBody();
          }
          else if (state is WeatherLoadingState){
            return WeatherInfoBody(
              weatherModel: state.weatherModel,
              
            );
          }
          else {//state is WeatherFailureState
             return const Align(alignment: Alignment.center,
              child:Text("Oops something went wrong, try again later", style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),));
          }
        }
        ), 
    );
  }
  Color getAppBarColor(BuildContext context) {
    final state = context.watch<GetWeatherCubit>().state;

    if (state is WeatherLoadingState) {
      return getDominantColor(state.weatherModel.temperature);
    }
    return Colors.blue; // Default color before search
  }
  Color getDominantColor(double temp) {
    if (temp < 10) {
      return Colors.indigo;
    } else if (temp < 20 && temp>=10) {
      return Colors.blue;
    } else if (temp < 30 && temp>=20) {
      return Colors.orangeAccent;
    } else {
      return Colors.red;
    }
  }
}