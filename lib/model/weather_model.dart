
// ignore_for_file: public_member_api_docs, sort_constructors_first
class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temperature;
  // ignore: non_constant_identifier_names
  final double min_temperature;
  // ignore: non_constant_identifier_names
  final double max_temperature;
  // ignore: non_constant_identifier_names
  final String weather_status;
  final String? picture;

  WeatherModel({
    required this.cityName,
    required this.date,
    required this.temperature,
    // ignore: non_constant_identifier_names
    required this.min_temperature,
    // ignore: non_constant_identifier_names
    required this.max_temperature,
    // ignore: non_constant_identifier_names
    required this.weather_status,
    this.picture,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      temperature: (json['forecast']['forecastday'][0]['day']['avgtemp_c'] as num).toDouble(),
      min_temperature: (json['forecast']['forecastday'][0]['day']['mintemp_c'] as num).toDouble(),
      max_temperature: (json['forecast']['forecastday'][0]['day']['maxtemp_c'] as num).toDouble(),
      weather_status: json['forecast']['forecastday'][0]['day']['condition']['text'],
      picture: json['forecast']['forecastday'][0]['day']['condition']['icon'],
    );
  }
}
