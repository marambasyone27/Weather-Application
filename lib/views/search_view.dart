import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: Colors.blue,
          elevation: 10,
          shadowColor: const Color.fromARGB(255, 239, 23, 8),
          centerTitle: true,
          title: const Text(
            "Search for the city",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          )),
      body:  Padding(padding:const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: TextField(
          onSubmitted: (value) async{// trigger cubit ..... using it to manage the application
          var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
          getWeatherCubit.getCurrentWeather(cityName: value);
           Navigator.of(context).pop();// go to the previous screen (home view screen)
          },
          style: const TextStyle(color: Colors.black, fontSize: 20),
          decoration: const InputDecoration(
            prefix: Text(
              "city name: ",
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20),
            ),
            hintText: "Enter City name",
            label: Text(
              "search",
              style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 20),
            ),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(17)),
                borderSide: BorderSide(
                  color: Colors.orange,
                  width: 10,
                )),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                borderSide: BorderSide(color: Colors.grey, width: 1)),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(17)),
                borderSide: BorderSide(color: Colors.orangeAccent, width: 2)),
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            ),
          ),
        ),
      ),
       ), // appear when no weather data is available
    );
  }
}

