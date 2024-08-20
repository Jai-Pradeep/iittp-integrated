import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChatboxPage extends StatefulWidget {
  @override
  _ChatboxPageState createState() => _ChatboxPageState();
}

class _ChatboxPageState extends State<ChatboxPage> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];

  final Map<String, String> _responses = {
    'hi': 'Hello! How can I help you today?',
    'hello': 'Hi there! What do you need assistance with?',
    'good morning': 'Good morning! How can I assist you today?',
    'good evening': 'Good evening! How can I assist you?',
    'thank you': 'You’re welcome! Anything else?',
    'hospital': "Hello! 😊 If you need medical assistance or have any health concerns, the campus hospital is here to help. It's located near the main entrance in south campus and is open 24/7. You can visit for general check-ups, emergency care, or any health-related issues. For more serious conditions, they'll refer you to a specialist. You can also find other hospital details at the medical facilities page\n(Navigation Bar >> Medical facilities)\n\nStay healthy and take care!",
    'library': "Hi there! 📚 If you're looking for a quiet place to study or need access to academic resources, the campus library is the perfect spot. It's open from 8 AM to 10 PM on weekdays and 9 AM to 5 PM on weekends. You can find a vast collection of textbooks, research papers, and digital resources. Don't forget to bring your student ID to borrow books or use the computers. Happy studying!",
    'canteen': "Hello! 🍽️ Feeling hungry? The Food Court is open from 9 AM to 9 PM, serving a variety of meals and snacks throughout the day. Whether you're in the mood for a quick bite or a full meal, you'll find plenty of options, including vegetarian and non-vegetarian dishes. The canteen is a great place to relax and catch up with friends between classes. Enjoy your meal!",
    'no': "Okay, happy to chat with you!",
    'yes': "Great, where do I start?",
    'academics':'refer iittp.ac.in' ,
    'research': 'refer iittp.ac.in',
    'board of governors': 'refer https://www.iittp.ac.in/board-of-governors',
    'senate': 'refer https://www.iittp.ac.in/senate',
    'chemical engineering': 'refer https://chemical.iittp.ac.in/',
    'food': "Hello! 🍽️ Feeling hungry? The Food Court is open from 9 AM to 9 PM, serving a variety of meals and snacks throughout the day. Whether you're in the mood for a quick bite or a full meal, you'll find plenty of options, including vegetarian and non-vegetarian dishes.\nFor more info, check out the Outlets page in the Navigation Bar.\nEnjoy your meal!",
    'theatre':"Hello! 🎬 Looking to catch a movie or a show? A variety of films and performances can be found in Renigunta and Tirupati. The theatre is open from 10 AM to 10 PM, offering a comfortable space to enjoy the latest movies or live performances. It’s a perfect spot for some entertainment and relaxation!",
    'sports complex': 'The sports complex includes facilities for basketball, football, and tennis. It\'s open from 6 AM to 10 PM.',
    'hostel': "We have two hostels in the North Campus, Malhar and Des, where 2nd-year and above boys stay. The girls' hostels and the freshers' hostels, including Abheri, Bhairav, Kedar, Basant, and Sahana, are located in the South Campus.",
    'where is the admin office': 'The admin office is located on the ground floor of the main building.',
    'bye': 'Goodbye! Have a great day!',
    'see you': 'See you later! Take care!',
  };

  void _handleSubmitted(String text) {
    if (text.isEmpty) return;

    setState(() {
      _messages.add({'user': text});
    });

    _controller.clear();

    String response = _getResponse(text.toLowerCase());
    if (response.isNotEmpty) {
      Future.delayed(const Duration(milliseconds: 500), () {
        setState(() {
          _messages.add({'bot': response});
        });
      });
    }
  }

  String _getResponse(String input) {
    for (String key in _responses.keys) {
      if (input.contains(key)) {
        return _responses[key]!;
      }
    }
    return 'Sorry, I didn\'t understand that, but I know more information regarding food, theatre, medical, and library. Do you want to know about them?';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chatbox'),
      ),
      body: Stack(
        children: [
          // This will allow the messages to scroll behind the bot animation
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  padding: EdgeInsets.only(top: 100), // Adjust padding to avoid overlapping with the bot animation
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final message = _messages[_messages.length - 1 - index];
                    bool isUserMessage = message.containsKey('user');
                    return Align(
                      alignment: isUserMessage ? Alignment.centerRight : Alignment.centerLeft,
                      child: Row(
                        mainAxisAlignment: isUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
                        children: [
                          if (!isUserMessage)
                            ClipOval(
                              child: Lottie.asset(
                                "assets/animations/bot.json",
                                repeat: true,
                                width: 25,
                                height: 25,
                              ),
                            ),
                          SizedBox(width: 8),
                          ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: MediaQuery.of(context).size.width * 0.75, // 3/4th of the width
                            ),
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: isUserMessage ? Colors.blueAccent : Colors.grey[300],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                isUserMessage ? message['user']! : message['bot']!,
                                style: TextStyle(
                                  color: isUserMessage ? Colors.white : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        maxLines: null,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () => _handleSubmitted(_controller.text),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // This positions the bot animation at the top center
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Lottie.asset(
                "assets/animations/bot.json",
                repeat: true,
                width: 250,
                height: 250,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
