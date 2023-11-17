import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:skyview_weather_app/screens/faq.dart';
// import 'package:skyview_weather_app/Screens/calendar.dart';
// import 'package:skyview_weather_app/Screens/chat.dart';
// import 'package:skyview_weather_app/Screens/city.dart';
// import 'package:skyview_weather_app/screens/settings.dart';

import 'package:skyview_weather_app/ui/home.dart';
import 'faq.dart';
import 'calendar.dart';
import 'chat.dart';
import 'city.dart';
// import 'settings.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int pageIndex = 0;

  List<Widget> pageList = <Widget>[
    HomePage(),
    City(),
    Calendar(),
    Chat(),
    FAQ(),
    //QuestionAnswers(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: PageTransitionSwitcher(
        transitionBuilder: (
            child,
            primaryAnimation,
            secondaryAnimation,
            ) => FadeThroughTransition(
          //fillColor: Colors.purple[100],
          animation: primaryAnimation,
          secondaryAnimation: secondaryAnimation,
          child: child,
        ),
        child: pageList[pageIndex],
      ),
      bottomNavigationBar:
      Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black87.withOpacity(0.8),
              blurRadius: 5,
              offset: Offset(0, -2),
            ),
          ],
          borderRadius: BorderRadius.circular(48),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GNav(
            selectedIndex: pageIndex,
            onTabChange: (value){
              print(value);
              setState(() {
                pageIndex = value;
              });
            },
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            backgroundColor: Colors.transparent,
            tabBackgroundColor: Colors.black,
            color: Colors.white,
            activeColor: Colors.deepPurple,
            gap: 8,
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.location_city,
                text: 'City',
              ),
              GButton(
                icon: Icons.calendar_month,
                text: 'Calendar',
              ),

              GButton(
                icon: Icons.chat,
                text: 'My chat',
              ),
              GButton(
                icon: Icons.question_answer,
                text: 'FAQ',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
