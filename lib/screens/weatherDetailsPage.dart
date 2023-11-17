import 'package:flutter/material.dart';

import '../model/weather_model.dart';

class WeatherDetailsPage extends StatelessWidget {
  final WeatherModel weatherData;

  const WeatherDetailsPage({required this.weatherData, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implement the UI to display the weather details using weatherData
    // You can access the data like weatherData.location.name, weatherData.current.tempC, etc.
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Location: ${weatherData.location?.name ?? ''}'),
            Text('Temperature: ${weatherData.current?.tempC ?? ''}°C'),
            // Add more details as needed
          ],
        ),
      ),
    );
  }
}