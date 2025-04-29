import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';
//http://api.weatherapi.com/v1/forecast.json?key=c76b5255b9014a9689d00738251503&q=Cairo&days=1
class WeatherServices {
final String baseURL='http://api.weatherapi.com/v1';// عملت النقطه دي لان المسار ممكن يتغير 
final String apiKey='c76b5255b9014a9689d00738251503';
final Dio dio ;// final Dio dio=Dio();
 WeatherServices(this.dio);
 Future<WeatherModel> getCurrentWeather({required String city}) async{// بترجع ليا الطقس الحالي
   try{
   Response res= await dio.get('$baseURL/forecast.json?key=$apiKey&q=$city&days=1');
  
  WeatherModel weatherModel=WeatherModel.fromJson(res.data);

  return weatherModel;
      } on DioException catch (err) {
      final errorMessage = err.response?.data?['error']?['message'] ?? 'Oops! Error occurred, please try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops! try later as something went wrong');
    }
  }
}





























































/*import 'dart:math';
//import 'dart:developer'
import 'package:dio/dio.dart';
import 'package:weather_app/model/weather_model.dart';

class WeatherServices {
final String baseURL='http://api.weatherapi.com/v1';// عملت النقطه دي لان المسار ممكن يتغير 
final String apiKey='c76b5255b9014a9689d00738251503';
final Dio dio ;// final Dio dio=Dio();
 WeatherServices(this.dio);
 Future<WeatherModel> getCurrentWeather({required String city}) async{// بترجع ليا الطقس الحالي
   try{
   Response res= await dio.get('$baseURL/forecast.json?key=$apiKey&q=$city&days=1');
  
  WeatherModel weatherModel=WeatherModel.fromJson(res.data);

  return weatherModel;
      }
   on DioException catch(err){
    final errorMessage=err.response?.data['error']['message']??'Opps!Error occured please try again later';
    throw Exception(errorMessage);
    //return null;
   }
   catch(e){
    log(e.toString() as num);
    throw Exception('Opps! try later as something went wrong');
   }
 } 

}*/