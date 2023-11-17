// import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:skyview_weather_app/model/weather_model.dart';

import '../../provider/favourite_provider.dart';

class TodaysWeather extends StatefulWidget {
  final WeatherModel? weatherModel;
  TodaysWeather({Key? key, this.weatherModel, required bool isFav}) : super(key: key);

  @override
  State<TodaysWeather> createState() => _TodaysWeatherState();
}


class _TodaysWeatherState extends State<TodaysWeather> {

  bool isFav = false;

  final fireStrore = FirebaseFirestore.instance.collection('CityName');


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

  //
  @override
  Widget build(BuildContext context) {

    final provider = Provider.of<FavouriteProvider>(context);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent, // Ensure transparent background
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3), // Darker color for the shadow
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: WeatherBg(
                weatherType: getWeatherType(widget.weatherModel?.current),
                width: MediaQuery.of(context).size.width,
                height: 400,
              ),
            ),
          ),
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
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF000000).withAlpha(20),
                      blurRadius: 3.0,
                      spreadRadius: 0.0,
                      offset: const Offset(
                        2.0,
                        4.0,
                      ),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Row(
                      children: [
                        Column(
                          children: [
                            Text(
                              widget.weatherModel?.location?.name ?? "",
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
                              DateFormat.yMMMMEEEEd().format(DateTime.parse(
                                  widget.weatherModel?.current?.lastUpdated
                                          .toString() ??
                                      "")),


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
                            ),
                          ],
                        ),


                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.26), // Adjust the opacity and color as needed
                                spreadRadius: 0 ,
                                blurRadius: 0 ,
                                offset: Offset(0, 0), // Adjust the offset for the desired shadow direction
                              ),
                            ],
                          ),

                          child: IconButton(
                              onPressed: () {
                                provider.toggleFavourite(AutofillHints.location);
                                setState(() {
                                  isFav = !isFav;
                                });

                                //String id = DateTime.now().millisecondsSinceEpoch.toString();
                                fireStrore.doc(widget.weatherModel?.location?.name ?? "").set({
                                  'title': widget.weatherModel?.location?.name ?? "",
                                  //'id' : id,
                                }).then((value){

                                }).onError((error, stackTrace){
                                  Utils().toastMessage(error.toString());
                                });
                              },
                              icon: isFav == true
                                  ? const Icon(Icons.favorite,color: Colors.black,)
                                  :const Icon(Icons.favorite_border,color: Colors.white,)
                          ),
                        ),



                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Column(
                    //       children: [
                    //         Padding(
                    //           padding: const EdgeInsets.only(left: 80),
                    //           child: Text(
                    //             // DateFormat.jm().format(
                    //             //     DateTime.fromMillisecondsSinceEpoch(
                    //             //         weatherModel
                    //             //                 ?.current?.lastUpdatedEpoch ??
                    //             //             0)),
                    //
                    //           DateFormat('MMM d, y h:mm a').format(DateTime.now()),
                    //
                    //             style: const TextStyle(
                    //               fontSize: 18,
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.white,
                    //               shadows: [
                    //                 Shadow(
                    //                   color: Colors.black,
                    //                   blurRadius: 1.0,
                    //                   offset: Offset(1.0, 1.0),
                    //                 )
                    //               ],
                    //             ),
                    //           ),
                    //         ),
                    //       ],
                    //     )
                    //   ],
                    // )
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
                            offset: const Offset(
                              2.0,
                              4.0,
                            ),
                          ),
                        ],
                      ),
                      child: Image.network(
                          "https:${widget.weatherModel?.current?.condition?.icon ?? ""}"),
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
                              widget.weatherModel?.current?.tempC
                                      ?.round()
                                      .toString() ??
                                  "",
                              style: const TextStyle(
                                  fontSize: 80,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black,
                                      blurRadius: 2.0,
                                      offset: Offset(2.0, 2.0),
                                    )
                                  ]),
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
                                ]),
                          ),

                        ],
                      ),
                      Text(
                        widget.weatherModel?.current?.condition?.text.toString() ?? "",
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
                            ]),
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
                      offset: const Offset(
                        2.0,
                        4.0,
                      ),
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
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/sun.png',
                                      scale:15,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 5),
                                Column(
                                  children: [
                                    Text(
                                      "Feels Like",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.weatherModel?.current?.feelslikeC
                                          ?.round()
                                          .toString() ??
                                          "",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/wind.png',
                                      scale:15,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 5),
                                Column(
                                  children: [
                                    Text(
                                      "Wind",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${widget.weatherModel?.current?.windKph?.round().toString()} km/h",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            )

                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/humidity.png',
                                      scale:15,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 5),
                                Column(
                                  children: [
                                    Text(
                                      "Humidity",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${widget.weatherModel?.current?.humidity.toString()} %",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/cloud.png',
                                      scale:15,
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 5),
                                Column(
                                  children: [
                                    Text(
                                      "Visibility",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "${widget.weatherModel?.current?.visKm?.round().toString()} km",
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            )

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

class Utils {
  void toastMessage(String message) {

  }
}
