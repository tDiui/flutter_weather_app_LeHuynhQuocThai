import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/weather_provider.dart';
import '../widgets/current_weather_card.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            /// SEARCH INPUT
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Enter city...",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                ElevatedButton(
                  onPressed: () {
                    final city = controller.text.trim();

                    if (city.isNotEmpty) {
                      Provider.of<WeatherProvider>(
                        context,
                        listen: false,
                      ).fetchWeather(city);
                    }
                  },
                  child: const Text("Search"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            /// RESULT AREA
            Expanded(
              child: Consumer<WeatherProvider>(
                builder: (context, provider, child) {

                  /// LOADING
                  if (provider.isLoading) {
                    return const LoadingWidget();
                  }

                  /// ERROR
                  if (provider.error != null) {
                    return ErrorWidgetCustom(
                      message: provider.error!,
                    );
                  }

                  /// DATA
                  if (provider.weather != null) {
                    return CurrentWeatherCard(
                      weather: provider.weather!,
                    );
                  }

                  /// DEFAULT
                  return const Center(
                    child: Text("Enter city to get weather"),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}