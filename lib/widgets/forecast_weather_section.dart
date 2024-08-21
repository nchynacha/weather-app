import 'package:flutter/material.dart';
import 'package:today_weather/models/forecast_data.dart';
import 'package:today_weather/models/weather_data.dart';
import 'package:today_weather/widgets/constants.dart';
import 'package:today_weather/widgets/weather.dart';

class ForecaseWeaterSection extends StatelessWidget {
  final ForecastData? forecastData;
  final WeatherData? weather;
  final Color? color;

  const ForecaseWeaterSection({
    super.key,
    this.forecastData,
    this.weather,
    this.color = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin:
            const EdgeInsets.only(left: 8.0, right: 8.0, top: 15, bottom: 20),
        child: Visibility(
          visible: forecastData != null,
          child: ListView.builder(
            itemCount: forecastData?.list.length ?? 0,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Card(
              color: primaryColor.withOpacity(0.8),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Weather(
                      weather: forecastData?.list[index],
                      color: whiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
