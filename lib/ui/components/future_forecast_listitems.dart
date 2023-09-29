import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../model/weather_model.dart';

class FutureForecastListItem extends StatelessWidget {
  final Forecastday? forecastday ;
  const FutureForecastListItem({Key? key,this.forecastday}) : super(key: key) ;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFFFFF).withAlpha(60),
            blurRadius: 3.0,
            spreadRadius: 0.0,
            offset: const Offset(2.0, 4.0,),
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.all(8),
      width: double.infinity,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle ,
                color: Colors.white30,
              ),
              child: Image.network("https:${forecastday?.day?.condition?.icon ?? ""}",

              ),
            ),
          ),
          Expanded(
            child: Text(
              DateFormat.MMMEd().format(DateTime.parse(forecastday?.date.toString() ?? "")),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),

          Expanded(
            child: Text(
              forecastday?.day?.condition?.text.toString() ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),

          Expanded(
            child: Text(
              "^${forecastday?.day?.maxtempC?.round()}/${forecastday?.day?.mintempC?.round()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                fontSize: 12,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
