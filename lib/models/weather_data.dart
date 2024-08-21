class WeatherData {
  final DateTime date;
  final String name;
  final double temp;
  final String description;
  final String icon;
  final double tempmin;
  final double tempmax;
  final double pressure;
  final double humidity;
  final double feelslike;
  final double visibility;

  WeatherData({
    required this.date,
    required this.name,
    required this.temp,
    required this.description,
    required this.icon,
    required this.tempmin,
    required this.tempmax,
    required this.pressure,
    required this.humidity,
    required this.feelslike,
    required this.visibility,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      date: DateTime.fromMillisecondsSinceEpoch(
        json['dt'] * 1000,
        isUtc: false,
      ),
      name: json['name'],
      temp: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      tempmin: json['main']['temp_min'].toDouble(),
      tempmax: json['main']['temp_max'].toDouble(),
      pressure: json['main']['pressure'].toDouble(),
      humidity: json['main']['humidity'].toDouble(),
      visibility: json['visibility'] / 1000,
      feelslike: json['main']['feels_like'].toDouble(),
    );
  }
}
