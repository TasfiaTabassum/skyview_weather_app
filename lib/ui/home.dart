import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skyview_weather_app/model/weather_model.dart';
import 'package:skyview_weather_app/service/api_service.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:skyview_weather_app/ui/components/future_forecast_listitems.dart';
import 'package:skyview_weather_app/ui/components/todays_weather.dart';
import 'components/hourly_weather_listitems.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ApiService apiService = ApiService();
  final _textFieldController = TextEditingController();
  String searchText = "auto:ip" ;

  _showTextInputDialog(BuildContext context)async{
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Search Location"),
        content: TextField(
          controller: _textFieldController,
          decoration: InputDecoration(
            hintText: "search by city, zip, lat, lang"
          ),
        ),
        actions: [
          ElevatedButton(
              onPressed: (){
            Navigator.pop(context);
          },
              child: Text("Cancel")),
          ElevatedButton(
              onPressed: (){
            if(_textFieldController.text.isEmpty){
              return;
            }
            Navigator.pop(context, _textFieldController.text);
          },
              child: Text("Ok")),
        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF01263F),
      //backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              'assets/app_icon.png',
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

                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Weather By Hours",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 150,
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
                      height: 10,
                    ),
                    const Text(
                      "Next 7 days Forecast",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Expanded(
                      child: ListView.builder(itemBuilder: (context,index){
                        Forecastday? forecastday = weatherModel?.forecast?.forecastday?[index];
                        return FutureForecastListItem(forecastday: forecastday,);
                      },
                        itemCount: weatherModel?.forecast?.forecastday?.length ,
                      ),
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
    );
  }
}