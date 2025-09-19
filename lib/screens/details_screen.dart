import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Szczegóły pogody')),
      body: const Center(
        child: Text('Tutaj pokażemy prognozę na cały tydzień.'),
      ),
    );
  }
}
