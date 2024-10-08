import 'package:today_weather/models/weather_data.dart';

class ForecastData {
  final List<WeatherData?> list;

  ForecastData({
    required this.list,
  });

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    List<WeatherData?> list = [];

    for (dynamic e in json['list']) {
      WeatherData w = WeatherData(
        date: DateTime.fromMillisecondsSinceEpoch(
          e['dt'] * 1000,
          isUtc: false,
        ),
        name: json['city']['name'],
        temp: e['main']['temp'].toDouble(),
        description: e['weather'][0]['description'],
        icon: e['weather'][0]['icon'],
        tempmin: e['main']['temp_min'].toDouble(),
        tempmax: e['main']['temp_max'].toDouble(),
        pressure: e['main']['pressure'].toDouble(),
        humidity: e['main']['humidity'].toDouble(),
        visibility: e['visibility'] / 1000,
        feelslike: e['main']['feels_like'].toDouble(),
      );
      list.add(w);
    }

    return ForecastData(
      list: list,
    );
  }
}
