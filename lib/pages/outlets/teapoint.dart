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
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10.0,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              blurRadius: 10.0,
              color: Colors.black,
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
            size: 8, // Dot size
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                fontSize: 20,
                fontWeight: FontWeight.normal,
                shadows: [
                  Shadow(
                    blurRadius: 8.0,
                    color: Color.fromRGBO(0, 0, 0, 0.3),
                    offset: Offset(3, 3),
                  ),
                ],
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Text(
            '₹$price',
            style: const TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontSize: 20,
              fontWeight: FontWeight.normal,
              shadows: [
                Shadow(
                  blurRadius: 8.0,
                  color: Color.fromRGBO(0, 0, 0, 0.3),
                  offset: Offset(3, 3),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Teapoint extends StatelessWidget {
  const Teapoint({super.key});

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
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 10.0,
                  offset: const Offset(0, 5),
                ),
              ]),
          child: AppBar(
            backgroundColor: Colors.transparent,
            title: const Text(
              'MENU',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black,
                      offset: Offset(2, 2),
                    )
                  ]),
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
                SectionHeader(title: 'Tea / Coffee'),
                SizedBox(height: 20),
                MenuItem(title: 'Tea (Ginger/Elachi) (120ml)', price: 12),
                MenuItem(title: 'Green Tea (120ml)', price: 15),
                MenuItem(title: 'Lemon Tea (120ml)', price: 15),
                MenuItem(title: 'Coffee (120ml)', price: 15),
                MenuItem(title: 'Black Coffee (120ml)', price: 25),
                MenuItem(title: 'Boost (120ml)', price: 20),
                MenuItem(title: 'Horlicks (120ml)', price: 20),
                MenuItem(title: 'Black Tea (120ml)', price: 15),
                MenuItem(title: 'Hot Badam Milk (120ml)', price: 25),
                SizedBox(height: 40),
                SectionHeader(title: 'Juice'),
                SizedBox(height: 40),
                MenuItem(title: 'Vanilla Milkshake (250ml)', price: 70),
                MenuItem(title: 'Badam Milk (250ml)', price: 60),
                MenuItem(title: 'Banana Milkshake (250ml)', price: 65),
                MenuItem(title: 'Oreo Milkshake (250ml)', price: 70),
                MenuItem(title: 'Kitkat Milkshake (250ml)', price: 70),
                MenuItem(title: 'Mango Milkshake (250ml)', price: 70),
                MenuItem(title: 'Apple Milkshake (250ml)', price: 70),
                MenuItem(title: 'Strawberry Milkshake (250ml)', price: 70),
                MenuItem(title: 'Chocolate Milkshake (250ml)', price: 70),
                MenuItem(title: 'Cold Badam Milk (250ml)', price: 60),
                MenuItem(title: 'Assorted Drinks (250ml)', price: 25),
                SizedBox(height: 40),
                SectionHeader(title: 'Snaks'),
                SizedBox(height: 40),
                MenuItem(title: 'Veg Puff (60 grm)', price: 20),
                MenuItem(title: 'Egg Puff (90 grm)', price: 25),
                MenuItem(title: 'Chicken Puff (90 grm)', price: 35),
                MenuItem(title: 'Alloo Samosa (60 grm)', price: 15),
                MenuItem(title: 'Onion Samosa (3pc, 30 grm)', price: 20),
                MenuItem(title: 'Choco Brownie (60 grm)', price: 80),
                MenuItem(title: 'Black Forest (70 grm)', price: 45),
                MenuItem(title: 'Choco Fruit (70 grm)', price: 55),
                MenuItem(title: 'Sweet Bun (150 grm)', price: 30),
                MenuItem(title: 'Milk Shake (300 grm)', price: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
