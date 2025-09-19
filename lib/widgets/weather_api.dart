import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather.dart';

class WeatherApi {
  static const String baseUrl = 'https://api.open-meteo.com/v1/forecast';

  //  dla testów: Warszawa (lat: 52.23, lon: 21.01)
  static Future<Weather> fetchWeather(double latitude, double longitude) async {
    final url =
        '$baseUrl?latitude=$latitude&longitude=$longitude&current_weather=true';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Weather.fromJson(data);
    } else {
      throw Exception('Nie udało się pobrać pogody: ${response.statusCode}');
    }
  }
}
