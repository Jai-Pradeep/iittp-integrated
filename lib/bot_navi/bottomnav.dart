import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;

  BottomNavBar({required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 40,
            height: 40,
            child: Lottie.asset(
              "assets/animations/home.json",
              repeat: false,
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 60,
            height: 60,
            child: Lottie.asset(
              "assets/animations/buss.json",
              repeat: false,
            ),
          ),
          label: 'Bus',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 40,
            height: 40,
            child: Lottie.asset(
              "assets/animations/map.json",
              repeat: false,
            ),
          ),
          label: 'Campus Map',
        ),
        BottomNavigationBarItem(
          icon: SizedBox(
            width: 50,
            height: 50,
            child: Lottie.asset(
              "assets/animations/calender.json",
              repeat: false,
            ),
          ),
          label: 'Time Table',
        ),
      ],
      currentIndex: currentIndex, // Update as per selection
      selectedItemColor: Colors.deepPurple,
      unselectedItemColor: Colors.grey,
      onTap: (int index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, '/');
            break;
          case 1:
            Navigator.pushNamed(context, '/bus');
            break;
          case 2:
            Navigator.pushNamed(context, '/map');
            break;
          case 3:
            Navigator.pushNamed(context, '/calendar');
            break;
        }
      },
    );
  }
}
