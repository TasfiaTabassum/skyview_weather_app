import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/weather_model.dart';


class HourlyWeatherListItem extends StatelessWidget {
  final Hour? hour ;
  const HourlyWeatherListItem({Key? key, this.hour }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      padding: const EdgeInsets.all(6),
      width: 110,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            crossAxisAlignment:  CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 2.0),
                child: Text(
                  hour?.tempC?.round()?.toString() ?? "",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              const Text(
                "o",
                style: TextStyle(
                  color: Colors.white,

                ),
              ),
            ],
          ),

          Container(
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle ,
              color: Colors.white30,

            ),
            child:
            Image.network("https:${hour?.condition?.icon.toString()}"),
          ),
          Text(
            DateFormat.j().format(
              DateTime.parse(
                  hour?.time?.toString() ?? ""
              ),
            ),
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
