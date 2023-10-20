// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:skyview_weather_app/model/weather_model.dart';


class TodaysWeather extends StatelessWidget {
  final WeatherModel? weatherModel;
  const TodaysWeather({Key? key,this.weatherModel}) : super(key: key);

  WeatherType getWeatherType(Current? current){

    if (current?.condition?.text != null) {

      String conditionText = current!.condition!.text!.toLowerCase();

      if (conditionText.contains("snow") || conditionText.contains("snowfall") ) {
        if (conditionText.contains("slightly") || conditionText.contains("light") || conditionText.contains("lightly")  || conditionText.contains("patchy") || conditionText.contains("flurries")  || conditionText.contains("dusting") ) {
          return WeatherType.lightSnow;
        }
        else if (conditionText.contains("moderate") || conditionText.contains("medium") || conditionText.contains("steady") ) {
          return WeatherType.middleSnow;
        }
        else if (conditionText.contains("heavy") || conditionText.contains("blizzard") || conditionText.contains("snowstorm") ) {
          return WeatherType.heavySnow;
        }

        else if (conditionText.contains("sleet")  || conditionText.contains("hail")   ) {
          return WeatherType.hazy;
        }
        else {
          return WeatherType.middleSnow; // Default to moderate snow if intensity not specified
        }
      }

      else if (conditionText.contains("overcast")  || conditionText.contains("no sun")   || conditionText.contains("dull sky")   || conditionText.contains("bright")   || conditionText.contains("gloomy")  ) {
          return WeatherType.overcast;
      }

      else if (conditionText.contains("dusty")  || conditionText.contains("dust")  ) {
        return WeatherType.dusty;
      }


      else if (conditionText.contains("cloudy") || conditionText.contains("clouds")  || conditionText.contains("cloud")  || conditionText.contains("clouded") || conditionText.contains("grey") ) {
        if(current!.isDay == 1){
          return WeatherType.cloudy;
        }
        else{
          return WeatherType.cloudyNight;
        }
      }

      else if (conditionText.contains("sunny")  || conditionText.contains("clear")   || conditionText.contains("sunshine")   || conditionText.contains("bright")   || conditionText.contains("fine")   || conditionText.contains("no clouds")   || conditionText.contains("sunlit") || conditionText.contains("blue")  ) {
        if(current?.isDay == 1){
          return WeatherType.sunny;
        }
        else{
          return WeatherType.sunnyNight;
       }

      }


      else if (conditionText.contains("mist") || conditionText.contains("misty")  || conditionText.contains("foggy")  || conditionText.contains("fog") || conditionText.contains("Mist")  ) {
        return WeatherType.foggy;
      }


      else if (conditionText.contains("thunder")) {
        return WeatherType.thunder;
      }


      else if (conditionText.contains("rain") || conditionText.contains("showers") ) {
        if (conditionText.contains("slightly") || conditionText.contains("light") || conditionText.contains("lightly")  || conditionText.contains("patchy") || conditionText.contains("drizzle") || conditionText.contains("sprinkles") ) {
          return WeatherType.lightRainy;
        }
        else if (conditionText.contains("moderate") || conditionText.contains("medium") || conditionText.contains("steady") ) {
          return WeatherType.middleRainy;
        }
        else if (conditionText.contains("heavy") || conditionText.contains("torrential") || conditionText.contains("downpour") ) {
          return WeatherType.heavyRainy;
        }
        else if (conditionText.contains("thunder")  || conditionText.contains("thunderstorms")   || conditionText.contains("lightning")  ) {
          return WeatherType.thunder;
        }
        else {
          return WeatherType.hazy; // Default to hazy if intensity not specified
        }
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
                 color: Colors.black38,
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
                             blurRadius: 1.0,
                             offset: Offset(1.0, 1.0),
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
                             blurRadius: 1.0,
                             offset: Offset(1.0, 1.0),
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
                      color: Colors.black12,


                    ),


                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black38,
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
                                    blurRadius: 1.0,
                                    offset: Offset(1.0, 1.0),
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
                                blurRadius: 1.0,
                                offset: Offset(1.0, 1.0),
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
                  color: Colors.black38,
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

