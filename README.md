# skyview_weather_app

Our very first flutter project! hehe ( n U n )

# Features :
    - View Current Temperature, weather and weather details.
    - View 3days weather Forecast.
    - View hourly weather forecast of the day.
    - Search up City/location/Country to view weather details and forecast of the location.
    - Add City/location as favourite for quick-view.
    - View event calender.
    - Add events to specific date in event calender.
    - SkyBuddy, a weather cahtbot to make user experience more interesting.
    - FAQ section 





https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/bdf883a2-d4aa-43d7-9385-ef4680653734



# Screenshots :

### Home Screen 

<img src="https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/8e97f2af-149a-416e-aff6-b09c39246ad9" width="280" />

<img src="https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/f1cf4dcf-e781-45d4-bb0d-2eaaf4632df7" width="280" />

<img src="https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/8c2e2d55-095b-4c98-99ad-95275bca089c" width="280" />

### Add favourite city

https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/8a2dd6d4-b132-454f-9b22-dcbe3a9ff8fc


### Search up Locations

<img src="https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/74dbb831-af69-40da-b517-f72e04133d64" width="280" />

<img src="https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/74c36433-98d2-4ed2-9309-dbf934c90ce3" width="280" />


### Event Calender

<img src="https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/541302ee-a735-498d-8c0e-5461df12892f" width="280" />

<img src="https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/ad35d78c-c9fa-4e65-85ab-dc02b6e05bac" width="280" />


### User Friendly Chatbot

<img src="https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/d74346d6-ab67-4d7a-9269-ef742eac5028" width="280" />


### FAQ Section

<img src="https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/488ff714-357c-4c09-8619-6ba468f3d9b2" width="280" />

<img src="https://github.com/TasfiaTabassum/skyview_weather_app/assets/58984231/a276e30d-8d1f-44e2-b3d5-7a64800823b7" width="280" />






## Steps:


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


 2.  Install the Firebase CLI via npm by running the following command:

npm install -g firebase-tools


