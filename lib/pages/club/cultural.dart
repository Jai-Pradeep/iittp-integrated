import 'package:flutter/material.dart';
import 'clubdetail.dart';

class CulturalCommitteePage extends StatelessWidget {
  final List<String> clubs = [
    'Actomania',
    'Artista',
    'Celeste',
    'PFC',
    'Rasoi',
    'Sargam',
    'Xcite'
  ];

  final Map<String, IconData> clubIcons = {
    'Actomania': Icons.theater_comedy,
    'Artista': Icons.brush,
    'Celeste': Icons.checkroom,
    'PFC': Icons.movie,
    'Rasoi': Icons.restaurant,
    'Sargam': Icons.music_note,
    'Xcite': Icons.directions_run
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Match background color
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
            backgroundColor: Colors.transparent, // Transparent to show gradient
            title: const Text(
              'Cultural Committee Clubs',
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
            String clubName = clubs[index];
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              margin: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors
                      .lightBlue[200], // Match background color of the tile
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFE3F2FD),
                    child: Icon(
                      clubIcons[clubName] ?? Icons.group,
                      color: const Color.fromARGB(
                          255, 0, 0, 0), // Match icon color
                    ),
                  ),
                  title: Text(
                    clubName,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold, // Match text style
                      color: Color.fromARGB(255, 0, 0, 0), // Match text color
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFFE3F2FD), // Match trailing icon color
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClubDetailsPage(
                          clubName: clubName,
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
