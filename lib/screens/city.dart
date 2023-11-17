import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:skyview_weather_app/screens/weatherDetailsPage.dart';
// import 'package:skyview_weather_app/screens/settings.dart';
import '../model/weather_model.dart';
import '../provider/favourite_provider.dart';
import '../service/api_service.dart';
import '../ui/components/hourly_weather_listitems.dart';
import '../ui/components/todays_details.dart';
import '../ui/components/todays_weather.dart';
import 'package:skyview_weather_app/ui/home.dart';
import 'calendar.dart';
import 'chat.dart';


// class City extends StatefulWidget {
//   const City({super.key});
//
//   @override
//   State<City> createState() => _CityState();
// }
//
// class _CityState extends State<City> {
//   final fireStrore = FirebaseFirestore.instance.collection('CityName').snapshots();
//   final fireStrore1 = FirebaseFirestore.instance.collection('CalendarEvent').snapshots();
//   @override
//   Widget build(BuildContext context) {
//     ApiService apiService = ApiService();
//     String searchText = "auto:ip" ;
//     //final provider = Provider.of<FavouriteProvider>(context);
//     //final words = provider.words;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'City',
//           style: TextStyle(color: Colors.black,
//             fontWeight: FontWeight.bold,
//           ),
//
//         ),
//         backgroundColor: Colors.white,
//       ),
//       body: Column(
//         children:[
//           StreamBuilder<QuerySnapshot>(stream: fireStrore,
//               builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
//
//                 if(snapshot.connectionState == ConnectionState.waiting)
//                   return CircularProgressIndicator();
//                 if(snapshot.hasError)
//                   return Text('Some Error');
//
//                 return Expanded(
//                   child: ListView.builder(
//                     itemCount: snapshot.data?.docs.length,
//                     itemBuilder: (context,index){
//                       return ListTile(
//                         title: Text(snapshot.data!.docs[index]['title'].toString()),
//                       );
//                     },
//                   ),
//                 );
//               }
//           ),
//         ],
//       ),
//     );
//   }
// }



class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  State<City> createState() => _CityState();
}

class _CityState extends State<City> {
  final fireStrore = FirebaseFirestore.instance.collection('CityName').snapshots();
  final ApiService apiService = ApiService(); // Create an instance of ApiService

  // Add a method to handle button press
  void onCityButtonPress(String cityName) async {
    // Assuming you have a method to fetch weather data based on city name
    WeatherModel weatherData = await getWeatherData(cityName);

    // Navigate to the WeatherDetailsPage and pass the weatherData
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherDetailsPage(weatherData: weatherData),
      ),
    );
  }

  // Use this method to fetch weather data
  Future<WeatherModel> getWeatherData(String cityName) async {
    // Call the method on the ApiService instance
    return await apiService.getWeatherData(cityName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'City',
          style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: fireStrore,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting)
                return CircularProgressIndicator();
              if (snapshot.hasError) return Text('Some Error');

              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    return MaterialButton(
                      onPressed: () {
                        // Call the method when the button is pressed
                        onCityButtonPress(snapshot.data!.docs[index]['title'].toString());
                      },
                      child: ListTile(
                        title: Text(snapshot.data!.docs[index]['title'].toString()),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}