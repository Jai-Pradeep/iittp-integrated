import 'package:flutter/material.dart';
import 'academics.dart';
import 'cultural.dart';
import 'literary.dart';
import 'technical.dart';
import 'sports.dart';

class Committee {
  final String name;
  final Widget page;
  final IconData icon; // Add this line

  Committee(
      {required this.name,
      required this.page,
      required this.icon}); // Update constructor
}

class ClubActivitiesPage extends StatelessWidget {
  final List<Committee> committees = [
    Committee(
        name: 'Culturals',
        page: CulturalCommitteePage(),
        icon: Icons.music_note),
    Committee(
        name: 'Technical',
        page: TechnicalCommitteePage(),
        icon: Icons.engineering),
    Committee(name: 'Sports', page: SportsCommitteePage(), icon: Icons.sports),
    Committee(
        name: 'Literary', page: LiteraryCommitteePage(), icon: Icons.book),
    Committee(
        name: 'Academics', page: AcademicsCommitteePage(), icon: Icons.school),
  ];

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
            ],
          ),
          child: AppBar(
            backgroundColor: const Color.fromARGB(0, 178, 94, 94),
            title: const Text(
              'Club Activities',
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: committees.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 5, // Add shadow to the cards for depth
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(15.0), // Rounded corners for cards
              ),
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlue[200],
                  // Set your desired background color here
                  borderRadius: BorderRadius.circular(
                      15.0), // Optional: Match the card's border radius
                ), // Space between cards
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFE3F2FD),
                    child: Icon(
                      committees[index].icon, // Dynamic icon for each committee
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  title: Text(
                    committees[index].name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Montserrat',
                    ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFE3F2FD),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => committees[index].page,
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
