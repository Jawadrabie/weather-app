// import 'dart:math';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather2/Model/weather_model.dart';
import 'dart:convert';

class Servic {

  final Dio dio=Dio();

  Future<ModelWeather> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get(
          "https://api.weatherapi.com/v1/forecast.json?key=fa0bdd1469d248ea87480652241603&q=$cityName&days=10");
      print(response.data);
      final weathermodel = ModelWeather.FromJson(response.data);
      // log(weathermodel.toString());
      print(weathermodel);
      // print(response.data);
      return weathermodel;
    } on DioException catch (e) {
      final String errormessage = e.response!.data["error"]["message"] ??
          'there was an error in reqest';
      log(errormessage.toString());
      throw Exception(errormessage);
    } catch (e) {
      log(e.toString());
      throw Exception('there was an error,try again later');
    }
  }
}

//import 'package:http/http.dart' as http;

// class WeatherService {
//   String baseUrl = 'http://api.weatherapi.com/v1';
//
//   String apiKey = '3677bed892474b30b7a122242220806';
//   Future<ModelWeather> getWeather({required String cityName}) async {
//     Uri url =
//     Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7');
//     http.Response response = await http.get(url);
//
//     if (response.statusCode == 400) {
//       var data  = jsonDecode(response.body);
//       throw Exception(data['error']['message']);
//     }
//     Map<String, dynamic> data = jsonDecode(response.body);
//
//     ModelWeather weather = ModelWeather.FromJson(data);
//
//     return weather;
//   }
// }