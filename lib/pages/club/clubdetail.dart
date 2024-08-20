import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class ClubDetailsPage extends StatefulWidget {
  final String clubName;

  ClubDetailsPage({required this.clubName});

  @override
  _ClubDetailsPageState createState() => _ClubDetailsPageState();
}

class _ClubDetailsPageState extends State<ClubDetailsPage> {
  String clubDescription = "Loading";
  String imageUrl =
      'assets/images/club/sargam.jpg'; // Default placeholder image
  String clubLogo = 'assets/images/club/sargam.jpg'; // Default logo placeholder
  List<String> clubPhotos = []; // To store the club photos
  List<String> clubProjects = []; // To store the club projects
  List<String> clubEvents = []; // To store the club events

  @override
  void initState() {
    super.initState();
    loadClubDescription();
  }

  Future<void> loadClubDescription() async {
    String jsonString = await rootBundle.loadString('assets/clubs.json');
    List<dynamic> jsonList = jsonDecode(jsonString);

    setState(() {
      var club =
          jsonList.firstWhere((club) => club['clubName'] == widget.clubName,
              orElse: () => {
                    'clubDescription': 'Description not available',
                    'imageUrl': 'assets/images/club/sargam.jpg',
                    'clubLogo': 'assets/images/club/sargam.jpg',
                    'photos': [],
                    'clubProjects': [],
                    'clubEvents': []
                  });
      clubDescription = club['clubDescription'];
      imageUrl = club['imageUrl'] ?? 'assets/images/iitlogo.jpeg';
      clubLogo = club['clubLogo'] ?? 'assets/images/iitlogo.jpeg';
      clubPhotos = List<String>.from(club['photos'] ?? []);
      clubProjects = List<String>.from(club['clubProjects'] ?? []);
      clubEvents = List<String>.from(club['clubEvents'] ?? []);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD), // Set background color
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
            title: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      imageUrl,
                      height: 40,
                      width: 40,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    widget.clubName,
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          blurRadius: 10.0,
                          color: Colors.black,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Image.asset(
                  imageUrl,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(height: 20.0),
              Card(
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    clubDescription,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      color: Colors.grey[800],
                      height: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Gallery",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 10.0),
              clubPhotos.isNotEmpty
                  ? GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10.0,
                        mainAxisSpacing: 10.0,
                        childAspectRatio: 1.0,
                      ),
                      itemCount: clubPhotos.length,
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              clubPhotos[index],
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    )
                  : const Text("No photos available"),
              const SizedBox(height: 20.0),
              const Text(
                "Projects",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 10.0),
              clubProjects.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: clubProjects.map((project) {
                        return Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const Icon(Icons.work,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    project,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : const Text("No projects available"),
              const SizedBox(height: 20.0),
              const Text(
                "Our Events",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat',
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              const SizedBox(height: 10.0),
              clubEvents.isNotEmpty
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: clubEvents.map((event) {
                        return Card(
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          margin: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const Icon(Icons.event,
                                    color: Color.fromARGB(255, 0, 0, 0)),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    event,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Montserrat',
                                      color: Colors.grey[800],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : const Text("No events available"),
              const SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
