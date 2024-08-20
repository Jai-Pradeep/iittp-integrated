import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'aaswaadam_menu.dart';
import 'foodcourt_menu.dart';
import 'teapoint.dart';

class OutletPage extends StatefulWidget {
  const OutletPage({super.key});

  @override
  State<OutletPage> createState() => _OutletPageState();
}

class _OutletPageState extends State<OutletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Container(
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [
                Color(0xFF81D4FA),
                Color.fromARGB(255, 37, 151, 244),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 10.0,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: AppBar(
            backgroundColor: const Color.fromARGB(0, 178, 94, 94),
            title: const Text(
              'OUTLETS',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.0, // Increase letter spacing
                // Replace with your custom font
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12.0),
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.lightBlue[200],
            ),
            child: ListTile(
              leading: const Icon(
                Icons.restaurant_menu_rounded,
                color: Colors.amber,
              ),
              title: const Text(
                'Food Court',
                style: TextStyle(
                  fontSize: 20.0, // Set the font size here
                ),
              ),
              subtitle: const Text('10:00 AM - 10:00 PM'),
              textColor: Colors.black,
              contentPadding: const EdgeInsets.all(10),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const FoodcourtMenu()),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightBlue[200],
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.restaurant_menu_rounded,
                  color: Colors.amber,
                ),
                title: const Text(
                  'Aaswaadam',
                  style: TextStyle(
                    fontSize: 20.0, // Set the font size here
                  ),
                ),
                subtitle: const Text('7:00 AM - 12:00 PM'),
                textColor: Colors.black,
                contentPadding: const EdgeInsets.all(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AaswaadamMenu()),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.lightBlue[200],
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.restaurant_menu_rounded,
                  color: Colors.amber,
                ),
                title: const Text(
                  'Tea Point',
                  style: TextStyle(
                    fontSize: 20.0, // Set the font size here
                  ),
                ),
                subtitle: const Text('9:00 AM - 7:00 PM'),
                textColor: Colors.black,
                contentPadding: const EdgeInsets.all(10),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Teapoint()),
                  );
                },
              ),
            ),
          ),
          Center(
            child: Lottie.asset(
              "assets/animations/food.json",
              repeat: true,
              width: MediaQuery.of(context).size.width,
              height: 350,
            ),
          ),
        ],
      ),
    );
  }
}
