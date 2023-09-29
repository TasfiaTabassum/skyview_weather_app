import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:skyview_weather_app/model/weather_model.dart';

class TodaysWeather extends StatelessWidget {
  final WeatherModel? weatherModel;
  const TodaysWeather({Key? key,this.weatherModel}) : super(key: key);

  WeatherType getWeatherType(Current? current){

    if(current?.isDay == 1){
      //day
      if(current?.condition?.text == "Sunny"){
        return WeatherType.sunny;
      }
      else if(current?.condition?.text == "OverCast"){
        return WeatherType.overcast;
      }
      else if(current?.condition?.text == "Partly Cloudy"){
        return WeatherType.cloudy;
      }
      else if(current?.condition?.text == "Cloudy"){
        return WeatherType.cloudy;
      }
      else if(current?.condition?.text == "Mist"){
        return WeatherType.lightRainy ;
      }
      else if(current!.condition!.text!.contains("Thunder")){
        return WeatherType.thunder;
      }
      else if(current?.condition?.text == "Rain"){
        return WeatherType.heavyRainy;
      }
      else if(current?.condition?.text == "Clear"){
        return WeatherType.sunny;
      }
    }
    else{
      //night
      if(current?.condition?.text == "Sunny"){
        return WeatherType.sunnyNight;
      }
      else if(current?.condition?.text == "OverCast"){
        return WeatherType.overcast;
      }
      else if(current?.condition?.text == "Partly Cloudy"){
        return WeatherType.cloudyNight;
      }
      else if(current?.condition?.text == "Cloudy"){
        return WeatherType.cloudyNight;
      }
      else if(current?.condition?.text == "Mist"){
        return WeatherType.lightRainy ;
      }
      else if(current?.condition?.text == "Thunder"){
        return WeatherType.thunder;
      }
      else if(current?.condition?.text == "Rain"){
        return WeatherType.heavyRainy;
      }
      else if(current?.condition?.text == "Clear"){
        return WeatherType.sunnyNight;
      }
    }

    return WeatherType.sunny;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        WeatherBg(weatherType: getWeatherType(weatherModel?.current),
            width: MediaQuery.of(context).size.width,
            height: 400
        ),
        SizedBox(
          width: double.infinity,
          height: 400,
          child: Column(
            children: [
             Container(
               padding: const EdgeInsets.all(8),
               alignment: Alignment.centerLeft,
               decoration: BoxDecoration(
                 color: Colors.white10,
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: [
                   BoxShadow(
                     color: const Color(0xFF000000).withAlpha(20),
                     blurRadius: 3.0,
                     spreadRadius: 0.0,
                     offset: const Offset(2.0, 4.0,),
                   ),
                 ],
               ),
               child: Column(
                 children: [
                   Text(
                     weatherModel?.location?.name ?? "",
                     style: const TextStyle(
                         fontSize: 25,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         shadows: [
                           Shadow(
                             color: Colors.black,
                             blurRadius: 2.0,
                             offset: Offset(2.0, 2.0),
                           )
                         ],


                     ),
                   ),
                   Text(
                     DateFormat.yMMMMEEEEd().format(
                         DateTime.parse(
                             weatherModel?.current?.lastUpdated.toString() ?? ""
                         )
                     ),
                     style: const TextStyle(
                         fontSize: 13,
                         fontWeight: FontWeight.bold,
                         color: Colors.white,
                         shadows: [
                           Shadow(
                             color: Colors.black,
                             blurRadius: 2.0,
                             offset: Offset(2.0, 2.0),
                           )
                         ]
                     ),
                   )
                 ],
               ),
             ),

              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white10,


                    ),


                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white10,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF000000).withAlpha(20),
                            blurRadius: 3.0,
                            spreadRadius: 0.0,
                            offset: const Offset(2.0, 4.0,),
                          ),
                        ],
                      ),
                      child: Image.network(
                          "https:${weatherModel?.current?.condition?.icon ?? ""}"
                      ),
                    ),
                  ),

                  const Spacer(),

                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 2.0),
                            child: Text(
                              weatherModel?.current?.tempC?.round().toString() ?? "",
                              style: const TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                color:  Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0),
                                    )
                                  ]
                              ),
                            ),
                          ),

                          const Text(
                            "o",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                                shadows: [
                                  Shadow(
                                    color: Colors.black,
                                    blurRadius: 2.0,
                                    offset: Offset(2.0, 2.0),
                                  )
                                ]
                            ),
                          )
                        ],
                      ),

                      Text(
                        weatherModel?.current?.condition?.text.toString() ?? "",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.white,
                            shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 2.0,
                                offset: Offset(2.0, 2.0),
                              )
                            ]
                        ),

                      )
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),

              const SizedBox(
                height: 75,
              ),

              Container(
                margin: EdgeInsets.all(8),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white10,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withAlpha(20),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: const Offset(2.0, 4.0,),
                    ),
                  ],
                ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Feels Like",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            weatherModel?.current?.feelslikeC?.round().toString() ?? "",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            "Wind",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                           "${ weatherModel?.current?.windKph?.round().toString()} km/h" ,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text(
                            "Humidity",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "${weatherModel?.current?.humidity.toString()} %",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Text(
                            "Visibility",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "${ weatherModel?.current?.visKm?.round().toString()} km" ,
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),




                ],
              ),



              )

            ],
          ),
        )
      ],
    );
  }
}

