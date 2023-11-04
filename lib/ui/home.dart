import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skyview_weather_app/model/weather_model.dart';
import 'package:skyview_weather_app/service/api_service.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:skyview_weather_app/ui/components/future_forecast_listitems.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skyview_weather_app/ui/components/todays_details.dart';
import 'package:skyview_weather_app/ui/components/todays_weather.dart';
import 'components/hourly_weather_listitems.dart';
import '../Screens/city.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiService apiService = ApiService();
  final _textFieldController = TextEditingController();
  String searchText = "auto:ip" ;


  _showTextInputDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent, // Set dialog background to transparent
          contentPadding: EdgeInsets.zero, // Remove default padding

          content: Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.black, // Set container color to black
              borderRadius: BorderRadius.circular(10), // Set border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5), // White glow effect
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Search Location",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _textFieldController,
                    style: TextStyle(color: Colors.white), // Set text color to white24
                    decoration: InputDecoration(
                      filled: true, // Set filled property to true
                      fillColor: Colors.white24, // Set the background color to white
                      hintText: "search by city, zip, lat, lang",
                      hintStyle: TextStyle(color: Colors.white70), // Set hint text color to white with opacity
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(

                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("Cancel"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_textFieldController.text.isEmpty) {
                          return;
                        }
                        Navigator.pop(context, _textFieldController.text);
                      },
                      child: Text("Ok"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor:Colors.black,
        color: Colors.white,
        activeColor: Colors.white,
        tabBackgroundColor: Colors.white24,
        padding: EdgeInsets.all(16),
        gap: 4,
        tabs: [
          GButton(
            icon: Icons.home,
            text: 'Home',
          ),
          GButton(
            icon: Icons.location_city,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => city()),
              );
            },
            text: 'City',
          ),
          GButton(
            icon: Icons.calendar_today,
            text: 'Calendar',
          ),
          GButton(
            icon: Icons.chat,
            text: 'Chat',
          ),
          GButton(
            icon: Icons.settings,
            text: 'settings',)
        ],
      ),
      //backgroundColor: const Color,
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/logo.png',
              width: 40,
              height: 40,
            ),
            SizedBox(
                width: 8
            ),
            Text(
              'SkyView',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: () async{
            _textFieldController.clear();
            String text = await _showTextInputDialog(context);
            setState(() {
              searchText = text ;
            });
          }, icon: Icon(Icons.search, color: Colors.white,)),
          IconButton(onPressed: (){
            searchText = "auto:ip";
            setState(() {

            });
          }, icon: Icon(Icons.my_location, color: Colors.white,)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: FutureBuilder(
            //future: _determinePosition(),
            builder: (context,snapshot){
              if(snapshot.hasData){
                WeatherModel? weatherModel = snapshot.data;

                return SingleChildScrollView(

                  child: Column(
                    children: [
                      TodaysWeather(
                        weatherModel: weatherModel,
                      ),

                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Weather By Hours",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 115,
                        child: ListView.builder(
                          itemBuilder: (context,index){
                            Hour? hour = weatherModel?.forecast?.forecastday?[0].hour?[index];
                            return HourlyWeatherListItem(hour: hour,);
                          },
                          itemCount: weatherModel?.forecast?.forecastday?[0].hour?.length ,
                          scrollDirection: Axis.horizontal,
                        ),
                      ),

                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Weather Details",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      TodaysDetails(
                        weatherModel: weatherModel,

                      ),

                      const SizedBox(
                        height: 8,
                      ),


                      const Text(
                        "Next 3 days Forecast",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),

                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (context,index){
                          Forecastday? forecastday = weatherModel?.forecast?.forecastday?[index];
                          return FutureForecastListItem(forecastday: forecastday,);
                        },
                        itemCount: weatherModel?.forecast?.forecastday?.length ,
                      ),

                    ],
                  ),
                );
              }
              if(snapshot.hasError){
                return const Center(
                  child: Text("Error!!!"),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }, future: apiService.getWeatherData(searchText),
          ),
        ),
      ),
    );
  }
}