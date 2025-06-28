class WeatherModel {
  final String location;
  final String temp;
  final String condition;
  final String conditionIcon;

  WeatherModel(
      {required this.location,
      required this.temp,
      required this.condition,
      required this.conditionIcon});

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
        location: "${json['location']['country']}, ${json['location']['name']}",
        temp: "${json['current']['temp_c']} C",
        condition: json['current']['condition']['text'],
        conditionIcon: "https:${json['current']['condition']['icon']}");
  }
}
