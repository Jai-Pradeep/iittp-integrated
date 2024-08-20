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
      "Breakfast": ["Idli", "Vada", "Sambar", "Chutney"],
      "Lunch": ["Rice", "Dal", "Vegetable Curry", "Curd"],
      "Dinner": ["Chapati", "Paneer Curry", "Rice", "Salad"]
    },
    "Tuesday": {
      "Breakfast": ["Idli", "Vada", "Sambar", "Chutney"],
      "Lunch": ["Rice", "Dal", "Vegetable Curry", "Curd"],
      "Dinner": ["Chapati", "Paneer Curry", "Rice", "Salad"]
    },
    "Wednesday": {
      "Breakfast": ["Idli", "Vada", "Sambar", "Chutney"],
      "Lunch": ["Rice", "Dal", "Vegetable Curry", "Curd"],
      "Dinner": ["Chapati", "Paneer Curry", "Rice", "Salad"]
    },
    "Thursday": {
      "Breakfast": ["Idli", "Vada", "Sambar", "Chutney"],
      "Lunch": ["Rice", "Dal", "Vegetable Curry", "Curd"],
      "Dinner": ["Chapati", "Paneer Curry", "Rice", "Salad"]
    },
    "Friday": {
      "Breakfast": ["Idli", "Vada", "Sambar", "Chutney"],
      "Lunch": ["Rice", "Dal", "Vegetable Curry", "Curd"],
      "Dinner": ["Chapati", "Paneer Curry", "Rice", "Salad"]
    },
    "Saturday": {
      "Breakfast": ["Idli", "Vada", "Sambar", "Chutney"],
      "Lunch": ["Rice", "Dal", "Vegetable Curry", "Curd"],
      "Dinner": ["Chapati", "Paneer Curry", "Rice", "Salad"]
    },
    "Sunday": {
      "Breakfast": ["Aloo Parotta", "Curd", "Tea", "Egg/Banana"],
      "Lunch": ["Biriyani", "Raita", "Panneer", "Veg Biriyani"],
      "Dinner": ["Chapati", "Paneer Curry", "Rice", "Salad"]
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
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/image/background.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: TabBarView(
          controller: _tabController,
          children: days.map((day) {
            return ListView(
              padding: EdgeInsets.all(16.0),
              children: [
                ExpansionTile(
                  title: Text("Breakfast", style: TextStyle(fontWeight: FontWeight.bold)),
                  children: messMenu[day]?["Breakfast"]?.map((item) => ListTile(title: Text(item))).toList() ?? [Text("No menu available")],
                ),
                ExpansionTile(
                  title: Text("Lunch", style: TextStyle(fontWeight: FontWeight.bold)),
                  children: messMenu[day]?["Lunch"]?.map((item) => ListTile(title: Text(item))).toList() ?? [Text("No menu available")],
                ),
                ExpansionTile(
                  title: Text("Dinner", style: TextStyle(fontWeight: FontWeight.bold)),
                  children: messMenu[day]?["Dinner"]?.map((item) => ListTile(title: Text(item))).toList() ?? [Text("No menu available")],
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
