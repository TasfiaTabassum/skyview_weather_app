
import 'dart:convert';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../provider/favourite_provider.dart';
import '../ui/home.dart';

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final firestore = FirebaseFirestore.instance.collection('CalendarEvent').snapshots();

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDate;

  Map<String, List> mySelectedEvents = {};

  final titleController = TextEditingController();
  final descpController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = _focusedDay;

    //loadPreviousEvents();
  }


  List _listOfDayEvents(DateTime dateTime) {
    String formattedDate = DateFormat('yyyy-MM-dd').format(dateTime);

    // Fetch events from Firestore for the selected date
    final CollectionReference<Map<String, dynamic>> eventsCollection
    = FirebaseFirestore.instance.collection('CalendarEvent');

// ...
//     eventsCollection.snapshots().listen((querySnapshot) {
//       for (var doc in querySnapshot.docs) {
//         Map<String, dynamic> data = doc.data();
//        // var fooValue = data.data();
//         print(data);
//     }
//     });

    eventsCollection
        .where("date", isEqualTo: formattedDate)
        .get()
        .then((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List events = querySnapshot.docs.map((DocumentSnapshot<Map<String, dynamic>> document) {



        return document.data();
      }).toList();

      setState(() {
        mySelectedEvents[formattedDate] = events;
      });
    })
        .catchError((error) {
      print('Error fetching events: $error');
    });


    // Return local events while waiting for Firestore query to complete
    return mySelectedEvents[formattedDate] ?? [];
  }

  _showAddEventDialog() async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Event', textAlign: TextAlign.center),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              controller: descpController,
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            child: const Text('Add Event'),
            onPressed: () {
              if (titleController.text.isEmpty && descpController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Required title and description'),
                    duration: Duration(seconds: 2),
                  ),
                );
                return;
              } else {
                // Store the event details in Firestore
                FirebaseFirestore.instance.collection('CalendarEvent').add({
                  'title': titleController.text,
                  'description': descpController.text,
                  'date': DateFormat('yyyy-MM-dd').format(_selectedDate!),
                }).then((value) {
                  print('Event added to Firestore successfully');
                }).catchError((error) {
                  print('Error adding event to Firestore: $error');
                  Utils().toastMessage(error.toString());
                });

                // Update the local state
                setState(() {
                  if (mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)] != null) {
                    mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)]?.add({
                      "title": titleController.text,
                      "description": descpController.text,
                    });
                  } else {
                    mySelectedEvents[DateFormat('yyyy-MM-dd').format(_selectedDate!)] = [
                      {
                        "title": titleController.text,
                        "description": descpController.text,
                      }
                    ];
                  }
                });

                titleController.clear();
                descpController.clear();
                Navigator.pop(context);
                return;
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<FavouriteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Event Calendar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              headerStyle: HeaderStyle(formatButtonVisible: false, titleCentered: true),
              firstDay: DateTime.utc(2000, 1, 16),
              lastDay: DateTime.utc(2050, 2, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              onDaySelected: (selectedDay, focusedDay) {
                if (!isSameDay(_selectedDate, selectedDay)) {
                  setState(() {
                    _selectedDate = selectedDay;
                    _focusedDay = focusedDay;
                  });
                }
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              eventLoader: _listOfDayEvents,
            ),
            ..._listOfDayEvents(_selectedDate!).map(
                  (myEvents) => ListTile(
                leading: const Icon(
                  Icons.done,
                  color: Colors.teal,
                ),
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text('Event Title:   ${myEvents['title']}'),
                ),
                subtitle: Text('Description:   ${myEvents['description']}'),
              ),
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: () {
      //     // Show the add event dialog
      //     _showAddEventDialog();
      //     _listOfDayEvents(_selectedDate!);
      //
      //
      //     // In the _showAddEventDialog function, when the user presses "Add Event",
      //     // update the database with the selected date and event details.
      //   },
      //   label: const Text('Add Event'),
      // ),


      floatingActionButton: Stack(
        children: [
          Positioned(
            bottom: 70.0, // Adjust the bottom position as needed
            right: 5.0, // Adjust the right position as needed
            child: FloatingActionButton.extended(
              onPressed: () => _showAddEventDialog(),
              // label: const Text('Add Event'),
              label: const Text('+',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0, // Adjust the font size as needed
                ),

              ),

            ),
          ),
        ],
      ),


    );
  }
}

class Utils {
  // You can define utility methods or functions here if needed
  void toastMessage(String message) {
    // Implement your toast message logic here
  }
}



