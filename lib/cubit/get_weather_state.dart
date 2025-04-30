part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

class WeatherInitial extends GetWeatherState {}

class WeatherLoaded extends GetWeatherState {}

class WeatherSuccess extends GetWeatherState {
  ModelWeather? weatherModel;

  WeatherSuccess({required this.weatherModel});
}

class WeatherFailureState extends GetWeatherState {}
