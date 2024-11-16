import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather2/main.dart';
import 'Model/weather_model.dart';
import 'SearchPage.dart';
import 'cubit/get_weather_cubit.dart';
class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({Key? key, required this.weatherModel,}) : super(key: key);
  @override
  final ModelWeather weatherModel;
  Widget build(BuildContext context) {
    return Scaffold(
   //   backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 2,
        title:const Text("Weather App") ,
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage(),));

          }, icon:Icon(Icons.search),)
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient:LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                getMaterialColor(weatherModel.Text_Condition),
                getMaterialColor(weatherModel.Text_Condition)[200]!,
                getMaterialColor(weatherModel.Text_Condition)[50]!,

              ]
            )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text(weatherModel.NameCity,style: TextStyle(fontSize: 37,fontWeight: FontWeight.w500),),
            Text_updated(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              //  Icon(Icons.cloudy_snowing,color: Colors.blue,size: 50),
               Image.network("https:${weatherModel.Icon_Condetion}") ,
                Text_Temp(),
              Column(children: [
                Text("maxtemp:${weatherModel.maxtemp.round()}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
                Text("mintemp:${weatherModel.mintemp.round()}",style: TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
              ],)
            ],),
                Text(weatherModel.Text_Condition,style: TextStyle(fontSize: 30),),

              ]),
        ),
      ),
    );
  }
}

class Text_Temp extends StatelessWidget {
  const Text_Temp({super.key,});
  @override
  Widget build(BuildContext context) {

    return Text(BlocProvider.of<GetWeatherCubit>(context).weatherModel!.temp.toString(),
      style: TextStyle(fontSize: 25),);
  }
}


class Text_updated extends StatelessWidget {
  const Text_updated({super.key});
  @override
  Widget build(BuildContext context) {
    ModelWeather get_updated_cubit=  BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Text("updated ${get_updated_cubit.date.hour}:${get_updated_cubit.date.minute}",
        style: TextStyle(fontSize:20,));
  }
}


//fun يوجد طريقتان للتعديل على الوقت
// DateTime DataTimeToString(String value){
//   return DateTime.parse(value);
// }
