import 'package:flutter/material.dart';

class MessMenuPage extends StatefulWidget {
  @override
  _MessMenuPageState createState() => _MessMenuPageState();
}

class _MessMenuPageState extends State<MessMenuPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];

  final Map<String, Map<String, List<String>>> messMenu = {
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

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final initialIndex = now.weekday - 1; // Set initial index to today's day
    _tabController = TabController(length: days.length, vsync: this, initialIndex: initialIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mess Menu"),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: days.map((day) => Tab(text: day)).toList(),
        ),
      ),
      body: Container(
        child: TabBarView(
          controller: _tabController,
          children: days.map((day) {
            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ExpansionTile(
                  backgroundColor: Colors.transparent, // Set transparent background
                  title: Text("Breakfast", style: TextStyle(fontWeight: FontWeight.bold)),
                  children: messMenu[day]?["Breakfast"]?.map((item) => ListTile(
                    title: Text(item),
                    tileColor: Colors.white.withOpacity(0.8), // Set opacity for ListTile background
                  )).toList() ?? [Text("No menu available")],
                ),
                ExpansionTile(
                  backgroundColor: Colors.transparent, // Set transparent background
                  title: Text("Lunch", style: TextStyle(fontWeight: FontWeight.bold)),
                  children: messMenu[day]?["Lunch"]?.map((item) => ListTile(
                    title: Text(item),
                    tileColor: Colors.white.withOpacity(0.8), // Set opacity for ListTile background
                  )).toList() ?? [Text("No menu available")],
                ),
                ExpansionTile(
                  backgroundColor: Colors.transparent, // Set transparent background
                  title: Text("Dinner", style: TextStyle(fontWeight: FontWeight.bold)),
                  children: messMenu[day]?["Dinner"]?.map((item) => ListTile(
                    title: Text(item),
                    tileColor: Colors.white.withOpacity(0.8), // Set opacity for ListTile background
                  )).toList() ?? [Text("No menu available")],
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
