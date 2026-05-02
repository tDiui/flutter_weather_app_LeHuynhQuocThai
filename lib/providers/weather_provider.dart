import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../services/weather_service.dart';

class WeatherProvider extends ChangeNotifier {

  WeatherModel? _weather;
  bool _isLoading = false;
  String? _error;

  WeatherModel? get weather => _weather;
  bool get isLoading => _isLoading;
  String? get error => _error;

  final WeatherService _service = WeatherService();

  Future<void> fetchWeather(String city) async {

    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _weather = await _service.getWeather(city);
    } catch (e) {
      _error = "Không lấy được dữ liệu!";
    }

    _isLoading = false;
    notifyListeners();
  }
}