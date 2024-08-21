import 'package:flutter/material.dart';
import 'package:today_weather/controller/today_weather_controller.dart';
import 'package:today_weather/models/forecast_data.dart';
import 'package:today_weather/models/weather_data.dart';
import 'package:today_weather/widgets/constants.dart';
import 'package:today_weather/widgets/current_weather_section.dart';
import 'package:today_weather/widgets/forecast_weather_section.dart';
import 'package:today_weather/widgets/refresh_button.dart';

class TodayWeather extends StatefulWidget {
  const TodayWeather({super.key});

  @override
  State<StatefulWidget> createState() => _TodayWeatherState();
}

class _TodayWeatherState extends State<TodayWeather> {
  // Variables
  bool isLoading = false;
  WeatherData? weatherData;
  ForecastData? forecastData;
  Map<String, dynamic>? data;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      data = await TodayWeatherController().loadWeather();
      if (data != null && data!['code'] == 200) {
        weatherData = data!['weatherData'];
        forecastData = data!['forecastData'];
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  primaryColor,
                  secondaryColor,
                ],
              ),
            ),
            child: Column(
              children: <Widget>[
                CurrentWeather(
                  weatherData: weatherData,
                ),
                ForecaseWeaterSection(
                  forecastData: forecastData,
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: RefreshButton(
          isLoading: isLoading,
          onPressed: () async {
            setState(() {
              isLoading = true;
            });

            data = await TodayWeatherController().loadWeather();
            if (data != null && data!['code'] == 200) {
              weatherData = data!['weatherData'];
              forecastData = data!['forecastData'];
            }

            setState(() {
              isLoading = false;
            });
          },
        ),
        bottomNavigationBar: BottomAppBar(
          color: borderColor,
          height: 50,
          shape: CircularNotchedRectangle(),
        ),
      ),
    );
  }
}
