import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.lightBlue[200],
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 24,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.white,
              offset: Offset(2, 2),
            )
          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final String title;
  final double price;

  const MenuItem({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.circle,
            color: Color.fromARGB(255, 0, 0, 0), // Dot color
            size: 10, // Dot size
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.white,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Text(
            '₹$price',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.normal,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.white,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FoodcourtMenu extends StatelessWidget {
  const FoodcourtMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
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
                  color: Colors.white.withOpacity(0.3),
                  blurRadius: 10.0,
                  offset: const Offset(0, 5),
                ),
              ]),
          child: AppBar(
            backgroundColor: const Color.fromARGB(0, 178, 94, 94),
            title: const Text(
              'MENU',
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
      body: const Scrollbar(
        child: SingleChildScrollView(
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                SizedBox(height: 20),
                SectionHeader(title: 'Tea / Coffee'),
                SizedBox(height: 20),
                MenuItem(title: 'Tea(Ginger/elachi)', price: 12),
                MenuItem(title: 'Green Tea', price: 15),
                MenuItem(title: 'Lemon Tea', price: 15),
                MenuItem(title: 'Coffee', price: 15),
                MenuItem(title: 'Black Coffee', price: 25),
                SizedBox(height: 40),
                SectionHeader(title: 'Italian / Continental / Mexican / Cakes'),
                SizedBox(height: 40),
                MenuItem(title: 'Black Forest', price: 45),
                MenuItem(title: 'Choco Truffle', price: 55),
                MenuItem(title: 'Sweet Bun', price: 30),
                MenuItem(title: 'Sweet Bread', price: 40),
                MenuItem(title: 'Veg Puff', price: 20),
                MenuItem(title: 'Egg Puff', price: 25),
                MenuItem(title: 'Chicken Puff', price: 35),
                MenuItem(title: 'Veg Sandwich', price: 60),
                MenuItem(title: 'Panner Sandwich', price: 75),
                MenuItem(title: 'Chicken Sandwich', price: 85),
                MenuItem(title: 'Veg Burger', price: 70),
                MenuItem(title: 'Chicken Burger', price: 85),
                MenuItem(title: 'French Fries Small', price: 45),
                MenuItem(title: 'French Fries Large', price: 80),
                MenuItem(title: 'Choco Brownie', price: 80),
                MenuItem(title: 'Fried Chicken 1 pc', price: 55),
                MenuItem(title: 'Fried Chicken 2 pc', price: 120),
                MenuItem(title: 'Fried Chicken 4 pc', price: 230),
                MenuItem(title: 'Veg Cheese Pasta', price: 85),
                MenuItem(title: 'Veg Pizza Small', price: 85),
                MenuItem(title: 'Veg Pizza Medium', price: 120),
                MenuItem(title: 'chicken Pizza Small', price: 130),
                MenuItem(title: 'Chicken Pizza Medium', price: 230),
                MenuItem(title: 'Panner Pizza Small', price: 125),
                MenuItem(title: 'Panner Pizza Medium', price: 170),
                SizedBox(height: 40),
                SectionHeader(title: 'South Indian / Veg / Jain Food'),
                SizedBox(height: 40),
                MenuItem(title: 'Idly', price: 20),
                MenuItem(title: 'Vada', price: 15),
                MenuItem(title: 'Ghee Pongal', price: 32),
                MenuItem(title: 'Upma', price: 22),
                MenuItem(title: 'Poori(2)', price: 35),
                MenuItem(title: 'Idiyappam(2)', price: 22),
                MenuItem(title: 'Plain Dosa', price: 20),
                MenuItem(title: 'Masala Dosa', price: 32),
                MenuItem(title: 'Podi Idly', price: 25),
                MenuItem(title: 'Karam Dosa', price: 25),
                MenuItem(title: 'Egg Dosa', price: 30),
                MenuItem(title: 'Bonda(1)', price: 8),
                MenuItem(title: 'Punugulu', price: 15),
                MenuItem(title: 'Vegetable Biryani', price: 70),
                MenuItem(title: 'sambar Rice', price: 45),
                MenuItem(title: 'Coconut Rice', price: 45),
                MenuItem(title: 'Curd Rice', price: 40),
                MenuItem(title: 'Mini Meals', price: 75),
                MenuItem(title: 'Jain Meals', price: 105),
                MenuItem(title: 'Meals', price: 120),
                SizedBox(height: 40),
                SectionHeader(title: 'Biryani(Non Veg)'),
                SizedBox(height: 40),
                MenuItem(title: 'Plain Biryani', price: 80),
                MenuItem(title: 'Chicken Dum Biryani', price: 140),
                MenuItem(title: 'Special Chicken Biryani', price: 175),
                MenuItem(title: 'Chilly Chicken', price: 110),
                MenuItem(title: 'Mutton Biryani', price: 190),
                MenuItem(title: 'Mutton Roast', price: 150),
                MenuItem(title: 'Chicken 65 Biryani', price: 150),
                MenuItem(title: 'Chicken 65', price: 110),
                SizedBox(height: 40),
                SectionHeader(title: 'Chaats'),
                SizedBox(height: 40),
                MenuItem(title: 'Pani Puri', price: 25),
                MenuItem(title: 'Masala Puri', price: 30),
                MenuItem(title: 'Pav Bhaji', price: 40),
                MenuItem(title: 'Dahi Puri', price: 30),
                MenuItem(title: 'Bhel Puri', price: 25),
                MenuItem(title: 'Rabada', price: 35),
                MenuItem(title: 'Samosa chat', price: 30),
                SizedBox(height: 40),
                SectionHeader(title: 'North Indian / Chinese'),
                SizedBox(height: 40),
                MenuItem(title: 'Veg Fried Rice', price: 55),
                MenuItem(title: 'Panner Fried Rice', price: 75),
                MenuItem(title: 'Gobi Fried Rice', price: 70),
                MenuItem(title: 'Chicken Fried Rice', price: 85),
                MenuItem(title: 'Egg Fried Rice', price: 80),
                MenuItem(title: 'Mushroom Fried Rice', price: 75),
                MenuItem(title: 'Panner Noodles', price: 75),
                MenuItem(title: 'Gobi Noodles', price: 75),
                MenuItem(title: 'Veg Noodles', price: 60),
                MenuItem(title: 'Mushroom Noodles', price: 75),
                MenuItem(title: 'Chicken Noodles', price: 90),
                MenuItem(title: 'Egg Noodles', price: 85),
                MenuItem(title: 'Panner Curry', price: 75),
                MenuItem(title: 'Mushroom Curry', price: 75),
                MenuItem(title: 'Gobi Curry', price: 75),
                MenuItem(title: 'Kaju Curry', price: 80),
                MenuItem(title: 'Egg Bhurji', price: 60),
                MenuItem(title: 'Egg Curry', price: 60),
                MenuItem(title: 'Chicken Curry', price: 110),
                MenuItem(title: 'Butter Chicken Masala', price: 120),
                MenuItem(title: 'Panner Butter Masala', price: 75),
                MenuItem(title: 'Roti', price: 10),
                MenuItem(title: 'Naan', price: 10),
                SizedBox(height: 40),
                SectionHeader(title: 'Juices'),
                SizedBox(height: 40),
                MenuItem(title: 'Apple Juice', price: 70),
                MenuItem(title: 'Grape Juice', price: 65),
                MenuItem(title: 'Watermelon Juice', price: 60),
                MenuItem(title: 'Pineapple Juice', price: 65),
                MenuItem(title: 'Orange Juice', price: 65),
                MenuItem(title: 'Mosambi Juice', price: 60),
                MenuItem(title: 'Lemon Juice', price: 35),
                MenuItem(title: 'Vanilla Milkshake', price: 70),
                MenuItem(title: 'Badam Milkshake', price: 60),
                MenuItem(title: 'Banana Milkshake', price: 65),
                MenuItem(title: 'Oreo Milkshake', price: 70),
                MenuItem(title: 'Kitkat Milkshake', price: 70),
                MenuItem(title: 'Mango Milkshake', price: 70),
                MenuItem(title: 'Apple Milkshake', price: 70),
                MenuItem(title: 'Strawberry Milkshake', price: 70),
                MenuItem(title: 'Chocolate Milkshake', price: 70),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
