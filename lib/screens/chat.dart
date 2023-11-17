
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../model/weather_model.dart';
import '../service/api_service.dart';

class SkyBuddyChatbot {

  String respondToUser(String userQuery ) {
    String lowerCaseQuery = userQuery.toLowerCase();

    if (lowerCaseQuery.contains('hi') ||
        lowerCaseQuery.contains('hello') ||
        lowerCaseQuery.contains('what\'s up')) {
      return greetingResponse();
    }
    else if (lowerCaseQuery.contains('good morning')) {
      return morninggreetingResponse();
    }
    else if (lowerCaseQuery.contains('good afternoon')) {
      return 'Good afternoon! 🌤️';
    }
    else if (lowerCaseQuery.contains('good evening')) {
      return 'Good evening! 🌙';
    }
    else if (lowerCaseQuery.contains('good night')) {
      return nightgreetingResponse();
    }
    else if (lowerCaseQuery.contains('thank you') ||
        lowerCaseQuery.contains('thanks')) {
      return 'You\'re welcome! 😊';
    }
    else if (lowerCaseQuery.contains('how are you')) {
      return stateResponse();
    }
    else if (lowerCaseQuery.contains('tell me a joke') ||
        lowerCaseQuery.contains('tell me something funny') ||
        lowerCaseQuery.contains('joke')) {
      return tellJoke();
    }
    else if (lowerCaseQuery.contains('sing a song')  ||
        lowerCaseQuery.contains('can you sing')) {
      return singASong();
    }

    else if (lowerCaseQuery.contains('weather like today') ||
        lowerCaseQuery.contains('today\'s weather') ||
        lowerCaseQuery.contains('what\'s the weather today') ||
        lowerCaseQuery.contains('how\'s the weather today') ||
        lowerCaseQuery.contains('tell me about today\'s weather') ||
        lowerCaseQuery.contains('can you give me the forecast for today') ||
        lowerCaseQuery.contains('what should I expect from today\'s weather') ||
        lowerCaseQuery.contains('describe the weather today') ||
        lowerCaseQuery.contains('any special weather conditions for today') ) {
      return weatherResponse();
    }

    else if (lowerCaseQuery.contains('weather') ||
        lowerCaseQuery.contains('how\'s the weather') ||
        lowerCaseQuery.contains('what\'s the weather like') ||
        lowerCaseQuery.contains('tell me about the weather') ||
        lowerCaseQuery.contains('current weather') ||
        lowerCaseQuery.contains('weather conditions') ||
        lowerCaseQuery.contains('weather update') ||
        lowerCaseQuery.contains('sunny day') ||
        lowerCaseQuery.contains('cloudy weather') ||
        lowerCaseQuery.contains('windy day') ||
        lowerCaseQuery.contains('stormy weather') ||
        lowerCaseQuery.contains('rainy day') ||
        lowerCaseQuery.contains('snow forecast')) {
      return weatherResponse();
    }

    else if (lowerCaseQuery.contains('will it rain') ||
        lowerCaseQuery.contains('is it going to rain today') ||
        lowerCaseQuery.contains('do I need an umbrella today') ||
        lowerCaseQuery.contains('rain forecast') ||
        lowerCaseQuery.contains('is there any rain expected') ||
        lowerCaseQuery.contains('chance of rain') ||
        lowerCaseQuery.contains('rainy forecast') ||
        lowerCaseQuery.contains('umbrella needed') ||
        lowerCaseQuery.contains('do I need an umbrella') ||
        lowerCaseQuery.contains('raining today') ||
        lowerCaseQuery.contains('rainy weather') ||
        lowerCaseQuery.contains('showers forecast')) {
      return rainForecastResponse();
    }
    else if (lowerCaseQuery.contains('will it snow') ||
        lowerCaseQuery.contains('snow forecast') ||
        lowerCaseQuery.contains('is there any snow expected') ||
        lowerCaseQuery.contains('chance of snow') ||
        lowerCaseQuery.contains('snowy forecast') ||
        lowerCaseQuery.contains('do I need snow boots') ||
        lowerCaseQuery.contains('snowing today') ||
        lowerCaseQuery.contains('snowy weather') ||
        lowerCaseQuery.contains('snow showers forecast')) {
      return snowForecastResponse();
    }
    else if (lowerCaseQuery.contains('temperature') ||
        lowerCaseQuery.contains('how warm will it be today') ||
        lowerCaseQuery.contains('how cold will it be today') ||
        lowerCaseQuery.contains('current temp') ||
        lowerCaseQuery.contains('how hot is it') ||
        lowerCaseQuery.contains('how cold is it') ||
        lowerCaseQuery.contains('hot')||
        lowerCaseQuery.contains('cold')||
        lowerCaseQuery.contains('temperature today') ||
        lowerCaseQuery.contains('hot weather') ||
        lowerCaseQuery.contains('cold weather') ||
        lowerCaseQuery.contains('degrees outside') ||
        lowerCaseQuery.contains('current temperature') ||
        lowerCaseQuery.contains('hot today') ||
        lowerCaseQuery.contains('cold today') ||
        lowerCaseQuery.contains('weather temperature')) {
      return temperatureResponse();
    }

    else {
      return defaultResponse();
    }

  }

  String greetingResponse() {
    return 'Hi there! (´ ∀ ` *) How can SkyBuddy help you today?';
  }

  String morninggreetingResponse() {
    return 'Good morning! 🌤 ️';
  }

  String nightgreetingResponse() {
    return 'Good night! 🌜😴';
  }


  String stateResponse() {
    return 'I\'m doing amazing today! ୧( , ＾ 〰 ＾ , )୨ ️ How can I help you today?';
  }

  String tellJoke() {
    return 'Is your life not funny enough, or are you just trying to test my comedic genius? 😏';
  }

  String singASong() {
    return '🎵 La, la, la! I\'m singing in the chat! 🎶';
  }


  String weatherResponse() {
    // In a real-world scenario, replace the placeholder with actual weather data
    // String weatherData = weatherModel?.location?.name ?? "" ;
    //  return 'Good day! 🌞 The current weather is $weatherData.';

    // var weatherModel;
    //  String weatherData = weatherModel?.current?.condition?.text.toString() ?? "";
    //  return 'Good day! 🌞 The current weather is $weatherData.';


    // String weatherData = weatherModel?.location?.name ?? "";
    //
    // return 'Good day! 🌞 The current weather is $weatherData.';


    return 'Good day! 🌞 The current weather is sunny.';
  }

  String temperatureResponse() {
    // int temperature = getRandomTemperature();
    // return 'Sure thing! 🌡️ Currently, it\'s $temperature°C.';

    return 'Sure thing! 🌡️ Currently, it\'s 20°C.';
  }

  String rainForecastResponse() {
    // Implement logic to provide rain forecast information
    // For example:
    // return 'There is a 30% chance of rain today. Don\'t forget your umbrella!';
    return 'There is a chance of rain today. Stay prepared!';
  }

  String snowForecastResponse() {
    // Implement logic to provide snow forecast information
    // For example:
    // return 'Snow is expected later today. Bundle up!';
    return 'Snow is in the forecast. Stay warm!';
  }

  String defaultResponse() {
    return 'I\'m sorry, I didn\'t understand that. Can you please be more specific?';
  }


}


class Chat extends StatefulWidget {
  static const routeName = '/chat';


  final fireStrore = FirebaseFirestore.instance.collection('CityName').snapshots();
  final ApiService apiService = ApiService(); // Create an instance of ApiService


  // const Chat({super.key});
   Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  final CollectionReference _firestore =
  FirebaseFirestore.instance.collection('MyChatHistory');


//  final fireStrore = FirebaseFirestore.instance.collection('MyChatHistory').snapshots();
  final ApiService apiService = ApiService(); // Create an instance of ApiService

  late final WeatherModel? weatherModel;
  // _ChatState({Key? key, this.weatherModel, required bool isFav}) : super(key: key);







  final TextEditingController _chatController = TextEditingController();

  final ScrollController _scrollController = ScrollController();

  SkyBuddyChatbot _chatbot = SkyBuddyChatbot();

  late DatabaseReference _messagesRef;

  @override
  void initState() {
    super.initState();
    _messagesRef = FirebaseDatabase.instance.reference().child('messages');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Your Chat Buddy",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          StreamBuilder(
            stream: _firestore.orderBy('time').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              final messages = snapshot.data!.docs.reversed;

              List<Map<String, dynamic>> chatHistory = [];

              for (var message in messages) {
                final messageText = message['message'];
                final isSender = message['isSender'];

                chatHistory.add({
                  'time': DateTime.parse(message['time']),
                  'message': messageText,
                  'isSender': isSender,
                });
              }

              return Container(
                height: MediaQuery.of(context).size.height - 160,
                child: ListView.builder(
                  itemCount: chatHistory.length,
                  shrinkWrap: false,
                  reverse: true,
                  controller: _scrollController,
                  padding: const EdgeInsets.only(top: 10, bottom: 70),
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(
                          left: 14, right: 14, top: 10, bottom: 10),
                      child: Align(
                        alignment: (chatHistory[index]["isSender"]
                            ? Alignment.topRight
                            : Alignment.topLeft),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            color: (chatHistory[index]["isSender"]
                                ? Colors.black
                                : Colors.white),
                          ),
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            chatHistory[index]["message"],
                            style: TextStyle(
                              fontSize: 15,
                              color: chatHistory[index]["isSender"]
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              height: 60,
              width: 400,
              color: Colors.white,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.grey,
                            Colors.black87,
                          ],
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TextField(
                          decoration: const InputDecoration(
                            hintText: "Type a message",
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8.0),
                          ),
                          controller: _chatController,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      sendMessage();
                    },
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Colors.black87,
                            Colors.black87,
                          ],
                        ),
                        borderRadius:
                        BorderRadius.all(Radius.circular(50.0)),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 88.0,
                          minHeight: 36.0,
                        ),
                        alignment: Alignment.center,
                        child: const Icon(Icons.send, color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage() async {
    String userMessage = _chatController.text;

    // Add user message to chat history
    _firestore.add({
      "time": DateTime.now().toString(),
      "message": userMessage,
      "isSender": true,
    });

    _chatController.clear();

    String botResponse = _chatbot.respondToUser(userMessage);

    // Add bot response to chat history
    _firestore.add({
      "time": DateTime.now().toString(),
      "message": botResponse,
      "isSender": false,
    });
  }
}












//
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:flutter/material.dart';
//
// import '../model/weather_model.dart';
// import '../service/api_service.dart';
//
// class SkyBuddyChatbot  {
//
//   // final fireStore = FirebaseFirestore.instance.collection('MyChatHistory').snapshots();
//   // final ApiService apiService = ApiService(); // Create an instance of ApiService
//
//   String respondToUser(String userQuery ) {
//     String lowerCaseQuery = userQuery.toLowerCase();
//
//     if (lowerCaseQuery.contains('hi') ||
//         lowerCaseQuery.contains('hello') ||
//         lowerCaseQuery.contains('what\'s up')) {
//       return greetingResponse();
//     }
//     else if (lowerCaseQuery.contains('good morning')) {
//       return morninggreetingResponse();
//     }
//     else if (lowerCaseQuery.contains('good afternoon')) {
//       return 'Good afternoon! 🌤️';
//     }
//     else if (lowerCaseQuery.contains('good evening')) {
//       return 'Good evening! 🌙';
//     }
//     else if (lowerCaseQuery.contains('good night')) {
//       return nightgreetingResponse();
//     }
//     else if (lowerCaseQuery.contains('thank you') ||
//         lowerCaseQuery.contains('thanks')) {
//       return 'You\'re welcome! 😊';
//     }
//     else if (lowerCaseQuery.contains('how are you')) {
//       return stateResponse();
//     }
//     else if (lowerCaseQuery.contains('tell me a joke') ||
//         lowerCaseQuery.contains('tell me something funny') ||
//         lowerCaseQuery.contains('joke')) {
//       return tellJoke();
//     }
//     else if (lowerCaseQuery.contains('sing a song')  ||
//         lowerCaseQuery.contains('can you sing')) {
//       return singASong();
//     }
//
//     else if (lowerCaseQuery.contains('weather like today') ||
//         lowerCaseQuery.contains('today\'s weather') ||
//         lowerCaseQuery.contains('what\'s the weather today') ||
//         lowerCaseQuery.contains('how\'s the weather today') ||
//         lowerCaseQuery.contains('tell me about today\'s weather') ||
//         lowerCaseQuery.contains('can you give me the forecast for today') ||
//         lowerCaseQuery.contains('what should I expect from today\'s weather') ||
//         lowerCaseQuery.contains('describe the weather today') ||
//         lowerCaseQuery.contains('any special weather conditions for today') ) {
//       return weatherResponse();
//     }
//
//     else if (lowerCaseQuery.contains('weather') ||
//         lowerCaseQuery.contains('how\'s the weather') ||
//         lowerCaseQuery.contains('what\'s the weather like') ||
//         lowerCaseQuery.contains('tell me about the weather') ||
//         lowerCaseQuery.contains('current weather') ||
//         lowerCaseQuery.contains('weather conditions') ||
//         lowerCaseQuery.contains('weather update') ||
//         lowerCaseQuery.contains('sunny day') ||
//         lowerCaseQuery.contains('cloudy weather') ||
//         lowerCaseQuery.contains('windy day') ||
//         lowerCaseQuery.contains('stormy weather') ||
//         lowerCaseQuery.contains('rainy day') ||
//         lowerCaseQuery.contains('snow forecast')) {
//       return weatherResponse();
//     }
//
//     else if (lowerCaseQuery.contains('will it rain') ||
//         lowerCaseQuery.contains('is it going to rain today') ||
//         lowerCaseQuery.contains('do I need an umbrella today') ||
//         lowerCaseQuery.contains('rain forecast') ||
//         lowerCaseQuery.contains('is there any rain expected') ||
//         lowerCaseQuery.contains('chance of rain') ||
//         lowerCaseQuery.contains('rainy forecast') ||
//         lowerCaseQuery.contains('umbrella needed') ||
//         lowerCaseQuery.contains('do I need an umbrella') ||
//         lowerCaseQuery.contains('raining today') ||
//         lowerCaseQuery.contains('rainy weather') ||
//         lowerCaseQuery.contains('showers forecast')) {
//       return rainForecastResponse();
//     }
//     else if (lowerCaseQuery.contains('will it snow') ||
//         lowerCaseQuery.contains('snow forecast') ||
//         lowerCaseQuery.contains('is there any snow expected') ||
//         lowerCaseQuery.contains('chance of snow') ||
//         lowerCaseQuery.contains('snowy forecast') ||
//         lowerCaseQuery.contains('do I need snow boots') ||
//         lowerCaseQuery.contains('snowing today') ||
//         lowerCaseQuery.contains('snowy weather') ||
//         lowerCaseQuery.contains('snow showers forecast')) {
//       return snowForecastResponse();
//     }
//     else if (lowerCaseQuery.contains('temperature') ||
//         lowerCaseQuery.contains('how warm will it be today') ||
//         lowerCaseQuery.contains('how cold will it be today') ||
//         lowerCaseQuery.contains('current temp') ||
//         lowerCaseQuery.contains('how hot is it') ||
//         lowerCaseQuery.contains('how cold is it') ||
//         lowerCaseQuery.contains('hot')||
//         lowerCaseQuery.contains('cold')||
//         lowerCaseQuery.contains('temperature today') ||
//         lowerCaseQuery.contains('hot weather') ||
//         lowerCaseQuery.contains('cold weather') ||
//         lowerCaseQuery.contains('degrees outside') ||
//         lowerCaseQuery.contains('current temperature') ||
//         lowerCaseQuery.contains('hot today') ||
//         lowerCaseQuery.contains('cold today') ||
//         lowerCaseQuery.contains('weather temperature')) {
//       return temperatureResponse();
//     }
//
//     else {
//       return defaultResponse();
//     }
//
//   }
//
//   String greetingResponse() {
//     return 'Hi there! (´ ∀ ` *) How can SkyBuddy help you today?';
//   }
//
//   String morninggreetingResponse() {
//     return 'Good morning! 🌤 ️';
//   }
//
//   String nightgreetingResponse() {
//     return 'Good night! 🌜😴';
//   }
//
//
//   String stateResponse() {
//     return 'I\'m doing amazing today! ୧( , ＾ 〰 ＾ , )୨ ️ How can I help you today?';
//   }
//
//   String tellJoke() {
//     return 'Is your life not funny enough, or are you just trying to test my comedic genius? 😏';
//   }
//
//   String singASong() {
//     return '🎵 La, la, la! I\'m singing in the chat! 🎶';
//   }
//
//
//   String weatherResponse() {
//     // In a real-world scenario, replace the placeholder with actual weather data
//     // String weatherData = weatherModel?.location?.name ?? "" ;
//     //  return 'Good day! 🌞 The current weather is $weatherData.';
//
//     // var weatherModel;
//     //  String weatherData = weatherModel?.current?.condition?.text.toString() ?? "";
//     //  return 'Good day! 🌞 The current weather is $weatherData.';
//
//     //
//     // return 'Good day! 🌞 The current weather is $weatherData.';
//
//
//     return 'Good day! 🌞 The current weather is sunny.';
//   }
//
//   String temperatureResponse() {
//     // int temperature = getRandomTemperature();
//     // return 'Sure thing! 🌡️ Currently, it\'s $temperature°C.';
//
//     return 'Sure thing! 🌡️ Currently, it\'s 20°C.';
//   }
//
//   String rainForecastResponse() {
//     // Implement logic to provide rain forecast information
//     // For example:
//     // return 'There is a 30% chance of rain today. Don\'t forget your umbrella!';
//     return 'There is a chance of rain today. Stay prepared!';
//   }
//
//   String snowForecastResponse() {
//     // Implement logic to provide snow forecast information
//     // For example:
//     // return 'Snow is expected later today. Bundle up!';
//     return 'Snow is in the forecast. Stay warm!';
//   }
//
//   String defaultResponse() {
//     return 'I\'m sorry, I didn\'t understand that. Can you please be more specific?';
//   }
//
// }
//
//
// class Chat extends StatefulWidget {
//   static const routeName = '/chat';
//
//
//
//   const Chat({Key? key}) : super(key: key);
//
//   get apiService => null;
//
//   @override
//   State<Chat> createState() => _ChatState();
// }
//
// class _ChatState extends State<Chat> {
//   final CollectionReference _firestore = FirebaseFirestore.instance.collection('MyChatHistory');
//
//   // final ApiService apiService = ApiService(); // Create an instance of ApiService
//   // Future<WeatherModel> getWeatherData(String cityName) async {
//   //   // Call the method on the ApiService instance
//   //   return await apiService.getWeatherData(cityName);
//   // }
//
//   // late final ApiService apiService;
//
//   final ScrollController _scrollController = ScrollController();
//   final TextEditingController _chatController = TextEditingController();
//  // SkyBuddyChatbot _chatbot = SkyBuddyChatbot();
//
//   // SkyBuddyChatbot({required this.apiService}) {
//   //   // TODO: implement SkyBuddyChatbot
//   //   throw UnimplementedError();
//   // }
//
//   late DatabaseReference _messagesRef;
//
//   @override
//   void initState() {
//     super.initState();
//     _messagesRef = FirebaseDatabase.instance.reference().child('messages');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Your Chat Buddy",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           StreamBuilder(
//             stream: _firestore.orderBy('time').snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               if (!snapshot.hasData) {
//                 return Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//
//               final messages = snapshot.data!.docs.reversed;
//
//               List<Map<String, dynamic>> chatHistory = [];
//
//               for (var message in messages) {
//                 final messageText = message['message'];
//                 final isSender = message['isSender'];
//
//                 chatHistory.add({
//                   'time': DateTime.parse(message['time']),
//                   'message': messageText,
//                   'isSender': isSender,
//                 });
//               }
//
//               return Container(
//                 height: MediaQuery.of(context).size.height - 160,
//                 child: ListView.builder(
//                   itemCount: chatHistory.length,
//                   shrinkWrap: false,
//                   reverse: true,
//                   controller: _scrollController,
//                   padding: const EdgeInsets.only(top: 10, bottom: 70),
//                   physics: const BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return Container(
//                       padding: const EdgeInsets.only(
//                         left: 14,
//                         right: 14,
//                         top: 10,
//                         bottom: 10,
//                       ),
//                       child: Align(
//                         alignment: (chatHistory[index]["isSender"]
//                             ? Alignment.topRight
//                             : Alignment.topLeft),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 2,
//                                 blurRadius: 5,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                             color: (chatHistory[index]["isSender"]
//                                 ? Colors.black
//                                 : Colors.white),
//                           ),
//                           padding: const EdgeInsets.all(16),
//                           child: Text(
//                             chatHistory[index]["message"],
//                             style: TextStyle(
//                               fontSize: 15,
//                               color: chatHistory[index]["isSender"]
//                                   ? Colors.white
//                                   : Colors.black,
//                             ),
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               );
//             },
//           ),
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 16.0,
//                 vertical: 8.0,
//               ),
//               height: 60,
//               width: 400,
//               color: Colors.white,
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             Colors.grey,
//                             Colors.black87,
//                           ],
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(4.0),
//                         child: TextField(
//                           decoration: const InputDecoration(
//                             hintText: "Type a message",
//                             hintStyle: TextStyle(color: Colors.white),
//                             border: InputBorder.none,
//                             contentPadding: EdgeInsets.all(8.0),
//                           ),
//                           controller: _chatController,
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(
//                     width: 4.0,
//                   ),
//                   MaterialButton(
//                     onPressed: () {
//                       sendMessage();
//                     },
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(80.0),
//                     ),
//                     padding: const EdgeInsets.all(0.0),
//                     child: Ink(
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           begin: Alignment.topLeft,
//                           end: Alignment.bottomRight,
//                           colors: [
//                             Colors.black87,
//                             Colors.black87,
//                           ],
//                         ),
//                         borderRadius: BorderRadius.all(Radius.circular(50.0)),
//                       ),
//                       child: Container(
//                         constraints: const BoxConstraints(
//                           minWidth: 88.0,
//                           minHeight: 36.0,
//                         ),
//                         alignment: Alignment.center,
//                         child: const Icon(Icons.send, color: Colors.white),
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   void sendMessage() async {
//     String userMessage = _chatController.text;
//
//     // Add user message to chat history
//     _firestore.add({
//       "time": DateTime.now().toString(),
//       "message": userMessage,
//       "isSender": true,
//     });
//
//     _chatController.clear();
//
//
//
//     if (userMessage.toLowerCase().contains('weather')) {
//       try {
//         // Call your API service to get weather data
//         WeatherModel? weatherModel = await widget.apiService.getWeatherData();
//
//         // Extract the relevant information from the weather model
//         String weatherData = weatherModel?.location?.name ?? "Unknown Location";
//
//         // Add bot response to chat history with weather information
//         _firestore.add({
//           "time": DateTime.now().toString(),
//           "message": "The current weather is $weatherData.",
//           "isSender": false,
//         });
//       } catch (error) {
//         // Handle API request error
//         print("Error fetching weather data: $error");
//
//         // Add error message to chat history
//         _firestore.add({
//           "time": DateTime.now().toString(),
//           "message": "Sorry, there was an error fetching weather data.",
//           "isSender": false,
//         });
//       }
//     }
//
//     else {
//       String botResponse = _chatbot.respondToUser(userMessage);
//
//       // String botResponse = SkyBuddyChatbot(apiService: ApiService());
//
//       // Add bot response to chat history
//       _firestore.add({
//         "time": DateTime.now().toString(),
//         "message": botResponse,
//         "isSender": false,
//       });
//     }
//   }
// }