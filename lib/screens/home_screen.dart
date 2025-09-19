import 'package:flutter/material.dart';
import '../widgets/weather_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Pogoda')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ⭐ Dodany widżet pogodowy
            const WeatherCard(
              city: 'Warszawa',
              temperature: 22.5,
              description: 'Słonecznie',
              icon: Icons.wb_sunny,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/details');
              },
              child: const Text('Sprawdź szczegóły'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              },
              child: const Text('Ustawienia'),
            ),
          ],
        ),
      ),
    );
  }
}
