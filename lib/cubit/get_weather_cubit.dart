import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather2/Service/Service_Model.dart';
import '../Model/weather_model.dart';
part 'get_weather_state.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit(this.servic) : super(WeatherInitial());
  Servic servic=Servic();
  ModelWeather ?weatherModel;
  getWeather({required String cityName}) async {
    try {
      emit(WeatherLoaded());
      weatherModel = await servic.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel));
    } catch (e) {
      emit(WeatherFailureState());
    }
  }
}
