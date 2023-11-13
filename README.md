# skyview_weather_app

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Steps:


1. To get access to weather gifs, please go to your 'weather_bg.dart' file ( '.../.pub-cache/hosted/pub.dev/flutter_weather_bg_null_safety-1.0.0/lib/bg/weather_bg.dart' ) and add the below code in 'WeatherItemBg' class :

String _getWeatherGif() {
    switch (weatherType) {
      case WeatherType.sunny:
        return 'assets/sunny_day.gif';
      case WeatherType.sunnyNight:
        return 'assets/sunny_night.gif';
      case WeatherType.cloudy:
        return 'assets/cloudy.gif';
      case WeatherType.cloudyNight:
        return 'assets/cloudy_night.gif';
      case WeatherType.overcast:
        return 'assets/overcast_night.gif';
      case WeatherType.lightRainy:
        return 'assets/rain_light.gif';
      case WeatherType.middleRainy:
        return 'assets/rain_medium.gif';
      case WeatherType.heavyRainy:
        return 'assets/rain_heavy.gif';
      case WeatherType.thunder:
        return 'assets/thunderstorm.gif';
      case WeatherType.lightSnow:
        return 'assets/snow_light.gif';
      case WeatherType.middleSnow:
        return 'assets/snow_medium.gif';
      case WeatherType.heavySnow:
        return 'assets/snow_heavy.gif';
      case WeatherType.foggy:
        return 'assets/fog.gif';
      case WeatherType.hazy:
        return 'assets/mist.gif';
      case WeatherType.dusty:
        return 'assets/dusty.gif';
      default:
        return 'assets/default.gif'; // Default GIF when the weather type is unknown
    }
  }


 2.  
