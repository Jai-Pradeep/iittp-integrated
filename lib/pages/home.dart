import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:iittp_integrated/bot_navi/bottomnav.dart';
import 'package:lottie/lottie.dart';
import 'package:iittp_integrated/pages/news/scrollable_widgets.dart';
import 'login_student.dart';
import 'package:iittp_integrated/main.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final user = FirebaseAuth.instance.currentUser;

  void signUserOut() {
    FirebaseAuth.instance.signOut();

  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String currentDay = DateFormat('EEEE').format(now);
    int hour = now.hour;
    String currentMeal = getCurrentMeal(hour);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[300],
        title: Text("HOME",
        style: TextStyle(
        color: Colors.white,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        letterSpacing: 2.0,),
        ),
        actions: [IconButton(onPressed: signUserOut, icon: Icon(Icons.logout))],
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue[50],
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(Icons.navigation, size: 48),
            ),
            ListTile(
              leading: Icon(Icons.celebration),
              title: Text("Club Activities"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/committees');
              },
            ),
            ListTile(
              leading: Icon(Icons.medical_information),
              title: Text("Medical Facility"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/medical');
              },
            ),
            ListTile(
              leading: Icon(Icons.link),
              title: Text("Quicklinks"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/quicklinks');
              },
            ),
            ListTile(
              leading: Icon(Icons.contact_emergency),
              title: Text("Contacts"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/contact');
              },
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Developers"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/developers');
              },
            ),
            ListTile(
              leading: Icon(Icons.feed),
              title: Text("Feedback"),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/feedback');
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              color: Colors.lightBlue[100],
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    ShaderMask(
                      shaderCallback: (bounds) => LinearGradient(
                        colors: [Colors.blue[500]!, Colors.blue[200]!], // Define your gradient colors here
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ).createShader(bounds),
                      child: Text(
                        'IIT Tirupati', // Add your desired title text
                        style: TextStyle(
                          fontSize: 35, // Adjust the font size
                          fontWeight: FontWeight.bold, // Make the title bold
                          color: Colors.white, // This color will be masked by the gradient
                          shadows: [
                            Shadow(
                              blurRadius: 5.0, // Adjust the blur radius for the shadow
                              color: Colors.black.withOpacity(0.5), // Shadow color with opacity
                              offset: Offset(2.0, 2.0), // Position of the shadow
                            ),
                          ],
                        ),
                      ),
                    ),
                      SizedBox(height: 20),
                      Text(
                        'Hi, Welcome to Integrated Insti App of IIT T',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                          color: Colors.blueGrey.withOpacity(0.8),
                          // shadows: [
                          //   Shadow(
                          //     blurRadius: 4.0, // Adjust the blur radius for the shadow
                          //     color: Colors.black.withOpacity(0.3), // Shadow color with opacity
                          //     offset: Offset(1.5, 1.5), // Position of the shadow
                          //   ),
                          // ],
                        ),
                      ),

                    SizedBox(height: 20), // Adjust the spacing between the title and the next elements
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/tt');
                            },
                            icon: Icon(
                              Icons.book_rounded,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Time Table",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[300],
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            ),
                          ),
                        ),
                        Container(
                          child: ElevatedButton.icon(
                            onPressed: () {
                              Navigator.pushNamed(context, '/outlet');
                            },
                            icon: Icon(
                              Icons.fastfood_rounded,
                              color: Colors.white,
                            ),
                            label: Text(
                              "Outlets",
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[300],
                              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Continue with the rest of your UI elements...
                    SizedBox(height: 10),
                    ListTile(
                      title: Text("What's on the Campus?"),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.pushNamed(context, '/calendar');
                      },
                    ),
                    Center(
                      child: Container(
                        width: double.infinity, // Ensures the container takes the full width of the screen
                        height: 180,
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[50],
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset: Offset(0, 2), // Shadow position
                            ),
                          ],
                        ),
                        child: ScrollableWidgets(),
                      ),
                    ),
                    SizedBox(height: 10),
                    ListTile(
                      title: Text("What's in the Mess?"),
                      trailing: Icon(Icons.arrow_forward),
                      onTap: () {
                        Navigator.pushNamed(context, '/mess');
                      },
                    ),

                    Center(
                      child: Container(
                        width: double.infinity, // Ensures the container takes the full width of the screen
                        padding: EdgeInsets.all(16.0),
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: Colors.lightBlue[50],
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset: Offset(0, 2), // Shadow position
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center, // Centers children horizontally
                          children: [
                            Center( // Center the text horizontally within the container
                              child: Text(
                                "$currentMeal Menu:",
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center, // Align the text within the Text widget
                              ),
                            ),
                            SizedBox(height: 10),
                            FutureBuilder<List<String>>(
                              future: getMenuForDay(currentDay, currentMeal),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState == ConnectionState.waiting) {
                                  return Center(child: CircularProgressIndicator());
                                } else if (snapshot.hasError) {
                                  return Center(child: Text("Error loading menu"));
                                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                                  return Center(child: Text("No menu available"));
                                } else {
                                  return Column(
                                    children: snapshot.data!.map((item) => Text(item)).toList(),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 16.0,
            right: 16.0,
            child: Stack(
              children: [
                Container(
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue.withOpacity(0.3),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/chatbot'),
                  child: ClipOval(
                    child: SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: Lottie.asset(
                        "assets/animations/bot.json",
                        repeat: true,
                        width: 100.0,
                        height: 100.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }

  String getCurrentMeal(int hour) {
    if (hour >= 6 && hour < 10) {
      return "Breakfast";
    } else if (hour >= 10 && hour < 15) {
      return "Lunch";
    } else if (hour >= 15 && hour < 22) {
      return "Dinner";
    } else {
      return "";
    }
  }

  Future<List<String>> getMenuForDay(String day, String meal) async {
    final Map<String, Map<String, List<String>>> menuData = {
      "Monday": {
        "Breakfast": [
          "Veg Uthappam",
          "Masala Sambar",
          "Groundnut Chutney",
          "Bread",
          "Butter",
          "Jam",
          "Banana/Egg-1",
          "Mutter"
        ],
        "Lunch": [
          "Roti",
          "Rice",
          "Ghee",
          "Papad",
          "Veg Salad",
          "Salt",
          "Curd",
          "Mango Pickle",
          "Pumpkin Fry",
          "Rajma Masala",
          "Palak dal",
          "Drumstick Sambar"
        ],
        "Dinner": [
          "Rice",
          "Fryums",
          "Veg Salad",
          "Salt",
          "Sugar",
          "Curd",
          "Pickle",
          "Aloo Gobi",
          "Pindi Chole",
          "Mudda pappu",
          "Tamarind rasam",
          "Watermelon/Papaya/Orange/Seasonal Fruit"
        ]
      },
      "Tuesday": {
        "Breakfast": [
          "Puri",
          "Aloo Masala Curry",
          "Bread",
          "Butter",
          "Jam",
          "Seasonal Fruit/Egg-1",
          "Lobia"
        ],
        "Lunch": [
          "Roti",
          "Rice",
          "Ghee",
          "Fryums",
          "Veg Salad",
          "Salt",
          "Buttermilk",
          "Tomato Pickle",
          "Methi Aloo",
          "Kala Channa Masala",
          "Tomato Dal",
          "Pumpkin Sambar"
        ],
        "Dinner": [
          "Roti",
          "Rice",
          "Papad",
          "Veg Salad",
          "Salt",
          "Curd",
          "Pickle",
          "Brinjal Fry",
          "Veg Manchurian",
          "Gongura Dal",
          "Pepper Rasam",
          "Ice-Cream"
        ]
      },
      "Wednesday": {
        "Breakfast": [
          "Idli",
          "Vada",
          "Groundnut Chutney",
          "Sambar",
          "Bread",
          "Butter",
          "Jam",
          "Banana/Omelete-1",
          "Moong"
        ],
        "Lunch": [
          "Roti",
          "Rice",
          "Ghee",
          "Papad",
          "Veg Salad",
          "Salt",
          "Sugar",
          "Curd",
          "Cucumber Pickle",
          "Raw Banana Fry",
          "Veg Koorma",
          "Dal Fry",
          "Mix Veg Sambar"
        ],
        "Dinner": [
          "Roti",
          "Rice",
          "Fryums",
          "Veg Salad",
          "Salt",
          "Sugar",
          "Curd",
          "Pickle",
          "Chicken Tikka Masala/Palak Paneer",
          "Lemon Coriander Rasam"
        ]
      },
      "Thursday": {
        "Breakfast": [
          "Pongal",
          "Sambar",
          "Bread",
          "Butter",
          "Jam",
          "Seasonal Fruit/Egg-1",
          "Chana"
        ],
        "Lunch": [
          "Roti",
          "Rice",
          "Ghee",
          "Fryums",
          "Gongura Chutney",
          "Salt",
          "Curd",
          "Red Chilli Pickle",
          "Aloo 65",
          "Corn Palak Masala",
          "Dal Makhani",
          "Tomato Onion Sambar"
        ],
        "Dinner": [
          "Roti",
          "Rice",
          "Veg Salad",
          "Salt",
          "Curd",
          "Pickle",
          "Masala Kichdi/Vegetable Pulao",
          "Mutter Masala",
          "Moong Dal",
          "Jeera Pepper Rasam",
          "Double ka Meetha/Payasam"
        ]
      },
      "Friday": {
        "Breakfast": [
          "Poha",
          "Green Chutney",
          "Mango Pickle",
          "Ketchup",
          "Bread",
          "Butter",
          "Jam",
          "Banana/Egg-1",
          "Mix Sprouts"
        ],
        "Lunch": [
          "Roti",
          "Rice",
          "Ghee",
          "Red Chilli Pickle",
          "Veg Salad",
          "Salt",
          "Buttermilk",
          "Bindi + Peanut + Onion Fry",
          "Kadi Pakoda",
          "Thotakura Pappu",
          "Bindi Sambar",
        ],
        "Dinner": [
          "Roti",
          "Rice",
          "Papad",
          "Veg Salad",
          "Salt",
          "Curd",
          "Pickle",
          "Malai Kofta",
          "Urad dal",
          "Tomato Rasam",
          "Water melon/Papaya/Orange/Seasonal Fruit"
        ]
      },
      "Saturday": {
        "Breakfast": [
          "Masala Dosa",
          "Groundnut Chutney",
          "Sambar",
          "Bread",
          "Butter",
          "Jam",
          "Seasonal Fruit/Egg-1",
          "Chhole"
        ],
        "Lunch": [
          "Roti",
          "Rice",
          "Papad",
          "Veg Salad",
          "Butter Milk",
          "Ginger Pickle",
          "Salt",
          "Curd",
          "Pickle",
          "Mix Veg Fry",
          "Meal Maker Thin Gravy",
          "Methi Dal",
          "Bottle Guard Sambar"
        ],
        "Dinner": [
          "Roti",
          "Rice",
          "Papad",
          "Veg Salad",
          "Salt",
          "Curd",
          "Pickle",
          "Moong Dal",
          "Chole Bhature",
          "Mysore Rasam",
          "Kala Jamun/Gulab Jamun"
        ]
      },
      "Sunday": {
        "Breakfast": [
          "Aloo Paratha",
          "Mint Chutney",
          "Lemon",
          "Bundi",
          "Onion",
          "Bread",
          "Butter",
          "Jam",
          "Moong"
        ],
        "Lunch": [
          "Chicken Dum Biryani with Non-Veg Shorba + Veg Biryani",
          "Methi Mutter Malai Paneer with Veg Shorba",
          "Roti",
          "Rice",
          "Ghee",
          "Veg Salad",
          "Salt",
          "Vegetable Curd Raita",
          "Egg-1/Banana"
        ],
        "Dinner": [
          "Rice",
          "Papad",
          "Veg Salad",
          "Salt",
          "Curd",
          "Pickle",
          "Beetroot Fry",
          "Cauliflower + Tomato Curry",
          "Bottle Guard Dal",
          "Ulavacharu"
        ]
      },
    };

    await Future.delayed(Duration(seconds: 2)); // Simulating a delay

    if (menuData.containsKey(day) && menuData[day]!.containsKey(meal)) {
      return menuData[day]![meal]!;
    } else {
      return [];
    }
  }
}
