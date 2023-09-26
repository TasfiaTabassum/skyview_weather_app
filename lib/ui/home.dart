import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyview_weather_app/model/weather_model.dart';
import 'package:skyview_weather_app/service/api_service.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:skyview_weather_app/ui/components/todays_weather.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF01263F),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('SkyView: Your Weather Companion'),
      ),
      body: SafeArea(
        child: FutureBuilder(
          builder: (context,snapshot){
            if(snapshot.hasData){
              WeatherModel? weatherModel = snapshot.data;
              return SizedBox(
                child: Column(
                  children: [
                    TodaysWeather(
                        weatherModel: weatherModel
                    ),



                  ],
                ),
              );
            }
            if(snapshot.hasError){
              return Center(
                child: Text("Error!!!"),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }, future: apiService.getWeatherData("Dhaka"),
        ),
      ),
    );
  }
}
