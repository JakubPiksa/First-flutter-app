import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map<String, List<double>> citiesCoordinates = {
    'Warszawa': [52.23, 21.01],
    'Kraków': [50.06, 19.94],
    'Gdańsk': [54.35, 18.65],
    'Wrocław': [51.11, 17.03],
  };

  DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wybierz miasto')),
      body: ListView(
        children: citiesCoordinates.entries.map((entry) {
          final city = entry.key;
          final coords = entry.value;

          return ListTile(
            title: Text(city),
            onTap: () {
              Navigator.pop(context, {
                'city': city,
                'lat': coords[0],
                'lon': coords[1],
              });
            },
          );
        }).toList(),
      ),
    );
  }
}
