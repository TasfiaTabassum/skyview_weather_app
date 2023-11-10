import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:skyview_weather_app/screens/settings.dart';
import '../model/weather_model.dart';
import '../provider/favourite_provider.dart';
import '../service/api_service.dart';
import '../ui/components/hourly_weather_listitems.dart';
import '../ui/components/todays_details.dart';
import '../ui/components/todays_weather.dart';
import 'package:skyview_weather_app/ui/home.dart';
import 'calendar.dart';
import 'chat.dart';


class City extends StatelessWidget {
  const City({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService apiService = ApiService();
    String searchText = "auto:ip" ;
    //final provider = Provider.of<FavouriteProvider>(context);
    //final words = provider.words;
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'City',
        style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
    );
  }
}
