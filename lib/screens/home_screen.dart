import 'package:flutter/material.dart';
import 'package:flutter_testowanie/screens/details_screen.dart';
import '../widgets/weather_api.dart';
import '../models/weather.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCity = 'Warszawa';
  late Future<Weather> futureWeather;

  @override
  void initState() {
    super.initState();
    futureWeather = WeatherApi.fetchWeather(52.23, 21.01);
  }

  void _updateCity(String city, double lat, double lon) {
    setState(() {
      selectedCity = city;
      futureWeather = WeatherApi.fetchWeather(lat, lon);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pogoda')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<Weather>(
              future: futureWeather,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Błąd: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  final weather = snapshot.data!;
                  return WeatherCard(
                    city: selectedCity,
                    temperature: weather.temperature,
                    description: 'Słonecznie', // możesz mapować z weathercode
                    icon: Icons.wb_sunny,
                  );
                } else {
                  return const Text('Brak danych');
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DetailsScreen()),
                );
                if (result != null) {
                  // result = {'city': 'Kraków', 'lat': 50.06, 'lon': 19.94}
                  _updateCity(result['city'], result['lat'], result['lon']);
                }
              },
              child: const Text('Wybierz miasto'),
            ),
          ],
        ),
      ),
    );
  }
}
