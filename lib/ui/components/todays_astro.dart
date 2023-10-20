// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:skyview_weather_app/model/weather_model.dart';


class AstroDetails extends StatelessWidget {
  //final WeatherModel? weatherModel;
  final Astro? astro;
  const AstroDetails({Key? key,this.astro}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          child: Container(
            // margin: EdgeInsets.all(8),
            // padding: EdgeInsets.all(8),
            // decoration: BoxDecoration(
            //   color: Colors.black38,
            //   borderRadius: BorderRadius.circular(30),
            //   boxShadow: [
            //     BoxShadow(
            //       color: const Color(0xFF000000).withAlpha(20),
            //       blurRadius: 3.0,
            //       spreadRadius: 0.0,
            //       offset: const Offset(2.0, 4.0,),
            //     ),
            //   ],
            // ),

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

                          Text(
                            "Sunrise",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            astro?.sunrise ?? "",
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
                            "Sunset",
                            style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                              astro?.sunset ?? "" ,
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
                          "Moonrise",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          astro?.moonrise ?? "" ,
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
                          "Moonset",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          astro?.moonset ?? "" ,
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Text(
                          "Moon Phase",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "    ${astro?.moonPhase } ",
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
                          "Moon Illumination",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "${ astro?.moonIllumination }" ,
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
          ),
        )
      ],
    );
  }
}

