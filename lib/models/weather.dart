class Weather {
  final double temperature;
  final double windspeed;
  final int weatherCode;
  final bool isDay;
  final DateTime time;

  Weather({
    required this.temperature,
    required this.windspeed,
    required this.weatherCode,
    required this.isDay,
    required this.time,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    final current = json['current_weather'];
    return Weather(
      temperature: current['temperature']?.toDouble() ?? 0.0,
      windspeed: current['windspeed']?.toDouble() ?? 0.0,
      weatherCode: current['weathercode'] ?? 0,
      isDay: current['is_day'] == 1,
      time: DateTime.parse(current['time']),
    );
  }
}
