import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'Messages.dart';
import '../model/weather_model.dart';
import '../service/api_service.dart';



class Chat extends StatefulWidget {
  //static const routeName = '/chat';



  // const Chat({super.key});
  Chat({super.key});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  final ScrollController _scrollController = ScrollController();

  // followiing dialogFlow
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();

  List<Map<String, dynamic>> messages = [];

  final CollectionReference _messagesCollection =
  FirebaseFirestore.instance.collection('messages');


  @override
  void initState() {
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    super.initState();
    // _messagesRef = FirebaseDatabase.instance.reference().child('messages');
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
            // Column(
            //   children: [
            Expanded(child: MessagesScreen(messages: messages)),
            //   ],
            // ),
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
                            controller: _controller,
                            style: TextStyle(
                              color: Colors.white,
                            ),

                          ),
                        ),
                      ),
                    ),

                    const SizedBox(
                      width: 4.0,
                    ),
                    MaterialButton(
                      onPressed: () {
                        sendMessage(_controller.text);
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
            )
          ],
        )

    );
  }


  sendMessage(String text) async {
    if (text.isEmpty) {
      print('Message is empty');
    } else {
      // Add the user's message to Cloud Firestore
      await _messagesCollection.add({
        'text': text,
        'timestamp': FieldValue.serverTimestamp(),
        'isUserMessage': true,
      });

      setState(() {
        addMessage(Message(text: DialogText(text: [text])), true);
      });

      // Get the chat bot's response
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: text)));

      if (response.message != null) {
        // Add the chat bot's response to Cloud Firestore
        await _messagesCollection.add({
          'text': response.message!.text!.text?[0],
          'timestamp': FieldValue.serverTimestamp(),
          'isUserMessage': false,
        });

        setState(() {
          addMessage(response.message!);
        });
      }
    }
  }



  addMessage(Message message, [bool isUserMessage = false]) {
      messages.add({'message': message, 'isUserMessage': isUserMessage});
    }
  }


