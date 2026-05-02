import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/weather_model.dart';
import '../config/api_config.dart';

class WeatherService {

  Future<WeatherModel> getWeather(String city) async {

    final uri = Uri.https(
      ApiConfig.baseUrl,
      "/data/2.5/weather",
      {
        "q": city,
        "appid": ApiConfig.apiKey,
        "units": "metric",
      },
    );

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception("API error: ${response.statusCode}");
    }
  }
}