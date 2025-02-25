import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:weather2/Service/Service_Model.dart';
import '../Model/weather_model.dart';
part 'get_weather_state.dart';

class  GetWeatherCubit extends Cubit <GetWeatherState> {
  GetWeatherCubit() : super(WeatherInitialState());
   ModelWeather? weatherModel;
  getWeather({required String cityName}) async {
    try{
     weatherModel =
    await Servic(Dio()).getWeather(cityName: cityName);
    emit(WeatherLoadedState(weatherModel!));
    } catch (e){
      emit(WeatherFailureState(
          e.toString()
      ));
    }
}
}
