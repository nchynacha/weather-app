/*import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:today_weather/constants.dart';
import 'package:today_weather/models/weather_data.dart';

class Weather extends StatelessWidget {
  final WeatherData? weather;
  final Color? color;

  const Weather({
    super.key,
    this.weather,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          weather?.name ?? '-',
          style: TextStyle(color: color),
        ),
        Text(
          weather?.description ?? '-',
          style: TextStyle(color: color, fontSize: 28.0),
        ),
        Text(
          '${weather?.temp.toString()}°C',
          style: TextStyle(color: color),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'L : ${weather?.tempmin.toString()}°C',
              style: TextStyle(color: color),
            ),
            SizedBox(
              width: 10,
            ),
            Text('H : ${weather?.tempmax.toString()}°C',
                style: TextStyle(color: color))
          ],
        ),
        Image.network(
          'https://openweathermap.org/img/w/${weather?.icon}.png',
        ),
        Text(
          weather?.date != null
              ? DateFormat.yMMMd().format(weather!.date)
              : '-',
          style: TextStyle(color: color),
        ),
        Text(
          weather?.date != null ? DateFormat.Hm().format(weather!.date) : '-',
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}*/

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:today_weather/models/weather_data.dart';
import 'package:today_weather/widgets/constants.dart';

class Weather extends StatelessWidget {
  final WeatherData? weather;
  final Color? color;

  const Weather({
    super.key,
    this.weather,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          weather?.name ?? '-',
          style: TextStyle(
              color: color, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        Image.network(
          'https://openweathermap.org/img/w/${weather?.icon}.png',
        ),
        Text(
          '${weather?.temp.toInt()}°C',
          style: TextStyle(color: color, fontSize: 24.0),
        ),
        Text(
          weather?.description ?? '-',
          style: TextStyle(color: color, fontSize: 24.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'L : ${weather?.tempmin.toString()}°C',
              style: TextStyle(color: color),
            ),
            SizedBox(
              width: 10,
            ),
            Text('H : ${weather?.tempmax.toString()}°C',
                style: TextStyle(color: color))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              weather?.date != null
                  ? DateFormat.yMMMd().format(weather!.date)
                  : '-',
              style: TextStyle(color: color),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              weather?.date != null
                  ? DateFormat.Hm().format(weather!.date)
                  : '-',
              style: TextStyle(color: color),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildWeatherdetail('Humidity', '${weather?.humidity}%'),
            SizedBox(
              width: 20,
            ),
            _buildWeatherdetail(
                'Pressure', '${weather?.pressure.toString()}hPa')
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _buildWeatherdetail(
                'Feels like', '${weather?.feelslike.toInt()}°C'),
            SizedBox(
              width: 20,
            ),
            _buildWeatherdetail('Visibility', '${weather?.visibility}km')
          ],
        ),
      ],
    );
  }

  Widget _buildWeatherdetail(String label, dynamic value) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
        child: Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: borderColor),
          child: Column(
            children: <Widget>[
              Text(label, style: TextStyle(color: whiteColor)),
              Text(
                value,
                style: TextStyle(color: whiteColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
