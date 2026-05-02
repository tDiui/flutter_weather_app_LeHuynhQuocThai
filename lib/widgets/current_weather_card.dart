import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class CurrentWeatherCard extends StatelessWidget {

  final WeatherModel weather;

  const CurrentWeatherCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              weather.cityName,
              style: const TextStyle(fontSize: 24),
            ),

            const SizedBox(height: 10),

            Text(
              "${weather.temp}°C",
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 10),

            Text(weather.description),

          ],
        ),
      ),
    );
  }
}