import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  State<FAQ> createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  List<Item> _data = generateItems(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.100),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  padding: const EdgeInsets.only(
                    left: 96,
                    right: 14,
                    top: 40,
                    bottom: 5,
                  ),
                  child: Text(
                    'FAQ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                background: Container(
                  height: 9.0,
                  padding: const EdgeInsets.only(
                    left: 14,
                    right: 14,
                    top: 40,
                    bottom: 10,
                  ),
                  child: Image.network(
                    'https://cdni.iconscout.com/illustration/premium/thumb/faq-4550445-3778933.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return ExpansionTile(
                    title: Text(_data[index].question),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          _data[index].answer,
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  );
                },
                childCount: _data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  Item({
    required this.question,
    required this.answer,
    this.isExpanded = false,
  });

  String question;
  String answer;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  List<String> questions = [
    "How to add an event to the calendar?",
    "How to use a chatbot for convenience?",
    "How can I get assistance or support?",
  ];

  List<String> answers = [
    "To add an event to the calendar, begin by selecting the desired date. Subsequently, click on the '+' icon to initiate the event creation process. A pop-up will appear, prompting you to provide a title and description for the event. Once you've entered the necessary details, you can either click 'Add Event' to confirm the addition or 'Cancel' to discard the process. This user-friendly approach ensures a seamless and straightforward experience when managing your calendar events.",
    "Meet 'SkyBuddy,' your new companion in the app! This lively chatbot is here to add a touch of fun to your experience. Ask it anything about the weather, or spice things up by requesting a song or a joke. SkyBuddy is not just an assistant; it's your app's playful sidekick, ready to make your interaction delightful and entertaining!",
    "If you encounter any issues or need help, please feel free to reach out to our support team. You can contact us at [tasfia.tabassum.du@gmail.com] or [muntaher1025@gmail.com] for prompt assistance. We're here to ensure your experience is smooth and enjoyable!",
  ];

  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      question: questions[index],
      answer: answers[index],
      isExpanded: false,
    );
  });
}
