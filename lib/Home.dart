import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'NoWeatherBody.dart';
import 'WeatherInfoBody.dart';
import 'cubit/get_weather_cubit.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    body:BlocBuilder <GetWeatherCubit,GetWeatherState> (
      builder: (context, state) {
     if(state is WeatherInitialState){
      return const NoWeatherBody();
     }
     else if(state is WeatherLoadedState){
       return WeatherInfoBody(weatherModel: state.weatherModel);
     }
     else  {
       return Center(child: Container(
         color: Colors.pink,
           height: 200,
           width: double.infinity,
           child:  const Text("opps, there was an Error")));
     }
      },
    )
    );
  }
}

