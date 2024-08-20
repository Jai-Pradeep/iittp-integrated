import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
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
            Icons.circle, // Dot color
            size: 8,
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

class AaswaadamMenu extends StatelessWidget {
  const AaswaadamMenu({super.key});

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
                SectionHeader(title: 'Tiffin & Hot Beverages'),
                SizedBox(height: 40),
                MenuItem(title: 'Dosa', price: 20),
                MenuItem(title: 'Masala Dosa', price: 30),
                MenuItem(title: 'Karam Dosa', price: 30),
                MenuItem(title: 'Poori(2)', price: 35),
                MenuItem(title: 'Idiyappam(2)', price: 22),
                MenuItem(title: 'Plain Dosa', price: 20),
                MenuItem(title: 'Podi Idly', price: 25),
                MenuItem(title: 'Egg Dosa', price: 30),
                MenuItem(title: 'Bonda(1)', price: 8),
                MenuItem(title: 'Punugulu', price: 15),
                SizedBox(height: 20),
                SectionHeader(title: 'Biryani'),
                SizedBox(height: 20),
                MenuItem(title: 'Veg Biryani', price: 120),
                MenuItem(title: 'Chicken Biryani', price: 150),
                MenuItem(title: 'Mutton Biryani', price: 200),
                MenuItem(title: 'Egg Biryani', price: 90),
                MenuItem(title: 'Special Chicken Biryani', price: 130),
                MenuItem(title: 'Fish Biryani', price: 180),
                MenuItem(title: 'Prawns Biryani', price: 190),
                SizedBox(height: 20),
                SectionHeader(title: 'Fried Rice / Noodles'),
                SizedBox(height: 20),
                MenuItem(title: 'Meals', price: 80),
                MenuItem(title: 'Special Meals', price: 150),
                MenuItem(title: 'Veg Fried Rice', price: 70),
                MenuItem(title: 'Gobi Fried Rice', price: 90),
                MenuItem(title: 'Mushroom Fried Rice', price: 90),
                MenuItem(title: 'Schezwan Fried Rice', price: 80),
                MenuItem(title: 'Paneer Fried Rice', price: 120),
                MenuItem(title: 'Kaju Fried Rice', price: 150),
                MenuItem(title: 'Spl Fried Rice (veg)', price: 170),
                MenuItem(title: 'Kaju Paneer Fried Rice', price: 150),
                MenuItem(title: 'Veg Noodles', price: 80),
                MenuItem(title: 'Gobi Noodles', price: 100),
                MenuItem(title: 'Mushroom Noodles', price: 100),
                MenuItem(title: 'Schezwan Noodles', price: 90),
                MenuItem(title: 'Paneer Noodles', price: 130),
                MenuItem(title: 'Special Veg Noodles', price: 150),
                MenuItem(title: 'Egg Noodles', price: 100),
                MenuItem(title: 'Chicken Noodles', price: 120),
                MenuItem(title: 'Schezwan Egg Noodles', price: 110),
                MenuItem(title: 'Schezwan Chicken Noodles', price: 130),
                MenuItem(title: 'Spl Chicken Noodles', price: 150),
                MenuItem(title: 'Egg Fried Rice', price: 90),
                MenuItem(title: 'Chicken Fried Rice', price: 110),
                MenuItem(title: 'Schezwan Egg Fried Rice', price: 100),
                MenuItem(title: 'Schezwan Chicken Rice', price: 120),
                MenuItem(title: 'Spl Chicken Fried Rice', price: 150),
                MenuItem(title: 'Tamota Rice', price: 60),
                MenuItem(title: 'Lemon Rice', price: 60),
                MenuItem(title: 'Curd Rice', price: 50),
                MenuItem(title: 'Dal Khichdi', price: 60),
                MenuItem(title: 'Mixed Veg. Fried Rice', price: 150),
                MenuItem(title: 'Mixed Non. Fried Rice', price: 200),
                SizedBox(height: 40),
                SectionHeader(title: 'Breads'),
                SizedBox(height: 40),
                MenuItem(title: 'Chapati(2) + Curry', price: 35),
                MenuItem(title: 'Parota + Curry', price: 40),
                MenuItem(title: 'Plain Chapati', price: 10),
                MenuItem(title: 'Plain Parota', price: 15),
                MenuItem(title: 'Butter Chapathi', price: 15),
                MenuItem(title: 'Pulka', price: 10),
                MenuItem(title: 'Egg Parota(2)', price: 50),
                SizedBox(height: 40),
                SectionHeader(title: 'Veg Starters'),
                SizedBox(height: 40),
                MenuItem(title: 'Gobi Chilli', price: 20),
                MenuItem(title: 'Gobi Manchurian', price: 70),
                MenuItem(title: 'Gobi 65', price: 80),
                MenuItem(title: 'Veg  Manchurian', price: 90),
                MenuItem(title: 'Panner 65', price: 130),
                MenuItem(title: 'Panner Manchurian', price: 130),
                MenuItem(title: 'Chilli Panner', price: 120),
                MenuItem(title: 'Mushroom Salt & Pepper', price: 95),
                MenuItem(title: 'Baby Corn Manchurian', price: 85),
                MenuItem(title: 'Chilli Baby Corn', price: 85),
                SizedBox(height: 40),
                SectionHeader(title: 'Non Veg Curries'),
                SizedBox(height: 40),
                MenuItem(title: 'Chicken', price: 100),
                MenuItem(title: 'Mutton', price: 160),
                MenuItem(title: 'Rayalaseema Chicken', price: 110),
                MenuItem(title: 'Egg Currie', price: 70),
                MenuItem(title: 'Egg Bhurji', price: 50),
                MenuItem(title: 'Chicken Keema', price: 150),
                MenuItem(title: 'Fish Curry', price: 100),
                MenuItem(title: 'Special Chicken', price: 150),
                MenuItem(title: 'Special Mutton', price: 220),
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
