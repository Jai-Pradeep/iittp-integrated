import 'package:flutter/material.dart';
import 'clubdetail.dart';

class TechnicalCommitteePage extends StatelessWidget {
  final List<String> clubs = [
    'Digital Wizards',
    'E-Cell',
    'Gagan Vedhi',
    'Navgati',
    'Sigma Squad',
    'Techmaniacs'
  ];

  final Map<String, IconData> clubIcons = {
    'Digital Wizards': Icons.computer,
    'E-Cell': Icons.lightbulb_outline,
    'Gagan Vedhi': Icons.satellite_alt,
    'Navgati': Icons.navigation,
    'Sigma Squad': Icons.engineering,
    'Techmaniacs': Icons.memory,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), 
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
            backgroundColor: Colors.transparent, 
            title: const Text(
              'Technical Committee Clubs',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.0,
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: clubs.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors
                      .lightBlue[200], 
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFE3F2FD),
                    child: Icon(
                      clubIcons[clubs[index]],
                      color: const Color.fromARGB(
                          255, 0, 0, 0), 
                    ),
                  ),
                  title: Text(
                    clubs[index],
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600, 
                      color: Colors.black, 
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFE3F2FD), 
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClubDetailsPage(
                          clubName: clubs[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
