class ModelWeather{
  final String NameCity;
  final DateTime date;
  final double temp;
  final double maxtemp;
  final double mintemp;
  final String Text_Condition;
  final String Icon_Condetion;
ModelWeather({
  required this.NameCity,
  required this.date,
  required this.temp,
  required this.maxtemp,
  required this.mintemp,
  required this.Text_Condition,
  required this.Icon_Condetion
});

  factory ModelWeather.FromJson(Json){
return ModelWeather(
    NameCity: Json["location"]["name"],
    date:DateTime.parse(Json["current"]["last_updated"]) ,
    temp: Json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
    maxtemp: Json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
    mintemp: Json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
    Text_Condition: Json["forecast"]["forecastday"][0]["day"]["condition"]["text"],
    Icon_Condetion: Json["forecast"]["forecastday"][0]["day"]["condition"]["icon"]
);
  }
}
