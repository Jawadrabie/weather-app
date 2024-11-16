import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SearchPage.dart';

class NoWeatherBody extends StatelessWidget {
  const NoWeatherBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0,
        title:const Text("Weather App") ,

        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage(),));

          }, icon:Icon(Icons.search),)
        ],
      ),
      body: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text("There is no weather 😔 start",
             textAlign: TextAlign.center,
               style: TextStyle(fontSize: 30,)),
           Text(" searching now 🔎 ",
              textAlign: TextAlign.center,
               style: TextStyle(fontSize: 30,)),
        ],
      ),
    );
  }
}
