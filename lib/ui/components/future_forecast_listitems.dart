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
        color: Colors.white24,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      margin: EdgeInsets.all(8),
      width: double.infinity,
      child: Row(
        children: [
          Image.network("https:${forecastday?.day?.condition?.icon ?? ""}"),
          Expanded(
            child: Text(
              DateFormat.MMMEd().format(DateTime.parse(forecastday?.date.toString() ?? "")),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
            ),
          ),

          Expanded(
            child: Text(
              forecastday?.day?.condition?.text.toString() ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),

          Expanded(
            child: Text(
              "^${forecastday?.day?.maxtempC?.round()}/${forecastday?.day?.mintempC?.round()}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),

        ],
      ),
    );
  }
}