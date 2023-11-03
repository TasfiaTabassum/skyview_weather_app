// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/bg/weather_bg.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:skyview_weather_app/model/weather_model.dart';


class TodaysDetails extends StatelessWidget {
  final WeatherModel? weatherModel;
  const TodaysDetails({Key? key,this.weatherModel}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Container(

            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFFFFF).withAlpha(80),
                  blurRadius: 3.0,
                  spreadRadius: 0.0,
                  offset: const Offset(2.0, 4.0,),
                ),
              ],
            ),
            padding: EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            margin: EdgeInsets.all(8),
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Image.asset(
                                    'assets/temperature.png',
                                    scale:12,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 20),
                              Column(
                                children: [
                                  Text(
                                    "Temp.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "${weatherModel?.current?.tempF?.round().toString()}°F",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
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
                                    'assets/windsock.png',
                                    scale:12,
                                  ),
                                ],
                              ),
                              const SizedBox(width: 5),
                              Column(
                                children: [
                                  Text(
                                    "Wind dir.",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Text(
                                    "${ weatherModel?.current?.windDir?.toString()}" ,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )

                        ],
                      ),

                    ],
                  ),
                ),

                const SizedBox(
                  height: 30,
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
                                  'assets/atmospheric.png',
                                  scale:12,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "  Pressure",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "    ${weatherModel?.current?.pressureMb?.round().toString() } Mb",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                                  'assets/uv.png',
                                  scale:12,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "UV Index",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${ weatherModel?.current?.uv?.round().toString()}" ,
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                  height: 30,
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
                                  'assets/hot.png',
                                  scale:12,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "  Max. Temp.",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  // "    ${weatherModel?.current?.pressureMb?.round().toString() } Mb",
                                    "${weatherModel?.forecast?.forecastday?[0]?.day?.maxtempC?.toString()}°C",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                                  'assets/cold.png',
                                  scale:12,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "Min. Temp.",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${weatherModel?.forecast?.forecastday?[0]?.day?.mintempC?.toString()}°C",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                  height: 30,
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
                                  'assets/sunrise.png',
                                  scale:12,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "  Sunrise",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${weatherModel?.forecast?.forecastday?[0]?.astro?.sunrise}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                                  'assets/sunset.png',
                                  scale:12,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "Sunset",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${weatherModel?.forecast?.forecastday?[0]?.astro?.sunset}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                  height: 30,
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
                                  'assets/moon.png',
                                  scale:10,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "  Moonrise",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${weatherModel?.forecast?.forecastday?[0]?.astro?.moonrise}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                                  'assets/fog_moon.png',
                                  scale:11,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "Moonset",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${weatherModel?.forecast?.forecastday?[0]?.astro?.moonset}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                  height: 30,
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
                                  'assets/full-moon.png',
                                  scale:12,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "  Moon Phase",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${weatherModel?.forecast?.forecastday?[0]?.astro?.moonPhase ?? "N/A"}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                                  'assets/clear_night.png',
                                  scale: 2,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "Moon Illumination",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${weatherModel?.forecast?.forecastday?[0]?.astro?.moonIllumination ?? "N/A"}%",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                  height: 30,
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
                                  'assets/rain.png',
                                  scale:10,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "  Will it Rain?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${weatherModel?.forecast?.forecastday?[0]?.day?.dailyWillItRain == 1 ? "Yes" : "No"}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                                  'assets/snow.png',
                                  scale:11,
                                ),
                              ],
                            ),
                            const SizedBox(width: 5),
                            Column(
                              children: [
                                Text(
                                  "Will it Snow?",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  "${weatherModel?.forecast?.forecastday?[0]?.day?.dailyWillItSnow == 1 ? "Yes" : "No"}",
                                  style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),
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
                  height: 30,
                ),






              ],
            ),
          ),
        )
      ],
    );
  }
}

