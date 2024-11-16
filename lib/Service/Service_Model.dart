// import 'dart:math';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather2/Model/weather_model.dart';

class Servic{
  Servic(this.dio);
final Dio dio;
Future<ModelWeather> getWeather({required String cityName}) async{
   try{
Response response= await dio.get(
    "https://api.weatherapi.com/v1/forecast.json?key=fa0bdd1469d248ea87480652241603&q=$cityName&days=10");
ModelWeather weathermodel =ModelWeather.FromJson(response.data);
 // log(weathermodel.toString());
  print(weathermodel);
// print(response.data);
return weathermodel;
 }
on DioException catch(e){
final String errormessage =  e.response!.data["error"]["message"]??'there was an error in reqest';
log(errormessage.toString());
throw Exception(errormessage);
}
catch(e){
    log(e.toString());
    throw Exception('there was an error,try again later');
}
}
}
