import 'package:flutter/material.dart';
import 'package:weather_app/model/weather_model.dart';


class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weatherModel}) : super(key: key);

  final WeatherModel weatherModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: getGradient(weatherModel.temperature),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            Text(
              'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Image.asset('assets/images/cloudy.png'),
                if (weatherModel.picture != null) 
                  Image.network(
                    weatherModel.picture!.contains("https:") 
                      ? weatherModel.picture! 
                      : "https:${weatherModel.picture!}", 
                  )
                else 
                  const SizedBox.shrink(),
                Text(
                  '${weatherModel.temperature.round()}°C',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      "Max: ${weatherModel.max_temperature.round()}°C",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Min: ${weatherModel.min_temperature.round()}°C",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              weatherModel.weather_status,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  LinearGradient getGradient(double temp) {
    if (temp < 10) {
      return const LinearGradient(
        colors: [Colors.indigo, Colors.lightBlueAccent],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else if (temp < 20) {
      return const LinearGradient(
        colors: [Colors.blue, Colors.white],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else if (temp < 30) {
      return const LinearGradient(
        colors: [Colors.orangeAccent, Colors.yellow],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    } else {
      return const LinearGradient(
        colors: [Colors.red, Colors.orange],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
    }
  }
}