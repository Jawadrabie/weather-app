part of 'get_weather_cubit.dart';

@immutable
sealed class GetWeatherState {}

class WeatherInitialState extends GetWeatherState{}

class WeatherLoadedState extends GetWeatherState{
 final ModelWeather weatherModel;

  WeatherLoadedState(this.weatherModel);
}

class WeatherFailureState extends GetWeatherState{
 final String error_message;

  WeatherFailureState(this.error_message);
}

