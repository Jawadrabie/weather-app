import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather2/Home.dart';
import 'package:weather2/Service/Service_Model.dart';
import '../Model/weather_model.dart';

import 'cubit/get_weather_cubit.dart';

void main() {
  runApp(const MyApp());
  //  Servic(Dio()).getWeather(cityName: 'london');
}

//final dio = Dio();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(Servic()),
      child: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) => MaterialApp(
          theme: ThemeData(
            primarySwatch:
            getMaterialColor(
                BlocProvider.of<GetWeatherCubit>(context).weatherModel?.Text_Condition
            ),

          ),
          home: Home(),
        ),
      ),
    );
  }
}

MaterialColor getMaterialColor(String? condition) {
  if (condition == null) return Colors.blue;
  switch (condition) {
    case "Sunny":
      return Colors.yellow; // Bright yellow
    case "Partly cloudy":
    case "Cloudy":
    case "Overcast":
    case "Mist":
      return Colors.grey; // Gray
    case "Patchy rain possible":
    case "Patchy snow possible":
    case "Patchy sleet possible":
    case "Patchy freezing drizzle possible":
      return Colors.lightBlue; // Light blue
    case "Thundery outbreaks possible":
      return Colors.pink; // Light pink - Changed for better distinction
    case "Blowing snow":
    case "Blizzard":
      return Colors.blueGrey; // Light cool blue - Changed to indicate coldness
    case "Fog":
    case "Freezing fog":
      return Colors.grey; // Medium gray
    case "Patchy light drizzle":
    case "Light drizzle":
    case "Light rain":
    case "Light freezing rain":
    case "Light sleet":
    case "Light snow":
    case "Light rain shower":
    case "Light sleet showers":
    case "Light snow showers":
    case "Light showers of ice pellets":
    case "Patchy light rain with thunder":
    case "Patchy light snow with thunder":
      return Colors.deepPurple; // Very light blue
    default:
      return Colors.blue; // Blue - For severe or unspecified conditions
  }
}
