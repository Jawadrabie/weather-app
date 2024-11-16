import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather2/cubit/get_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.orange,
        title:Text("Search a city") ,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextFormField(
            onFieldSubmitted: (value) async{
              var getWeatherCubit=BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 15,vertical: 32),
            hintText: "Enter City Name",
             labelText: "Search",
             labelStyle: TextStyle(color: Colors.orange),
             suffixIcon: Icon(Icons.search),
                suffixIconColor: Colors.orange,
           border: OutlineInputBorder(
           borderRadius: BorderRadius.all(Radius.circular(10)),
         ),
           focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange))

          ),
          ),
        ),
      ),
    );
  }
}

