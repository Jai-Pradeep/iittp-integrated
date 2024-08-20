import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Required to make phone calls
import 'package:permission_handler/permission_handler.dart';

Future<void> requestPhonePermission() async {
  var status = await Permission.phone.status;
  if (!status.isGranted) {
    await Permission.phone.request();
  }
}

class MedicalFacilitiesInfo extends StatelessWidget {
  final Color primaryColor = Color(0xFF000C14);
  final Color accentColor = Color(0xFF4DAFF9);
  final Color secondaryColor = Color(0xFFB0E7FC);
  final Color backgroundColor = Color(0xFF75D4FA);
  final Color whiteColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
          return false;
        },
    child: Scaffold(
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
              'Medical Facility',
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
      backgroundColor: Colors.lightBlue[50],
      body: SafeArea(

        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Contact Information',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  InfoCard(
                    title: 'Location:',
                    content: 'Old Library, Ground Floor, Transit Campus',
                    primaryColor: primaryColor,
                    secondaryColor: secondaryColor,
                    whiteColor: whiteColor,
                  ),
                  SizedBox(height: 10),
                  // Container around Contact Tiles
                  Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        ContactTile(
                          name: 'Pharmacy',
                          number: '8247414838',
                          primaryColor: primaryColor,
                        ),
                        Divider(color: primaryColor.withOpacity(0.5)),
                        ContactTile(
                          name: 'Emergency',
                          number: '7901070270',
                          primaryColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Doctor Schedule',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Doctor Schedule
                  ScheduleTile(
                    day: 'Monday To Friday',
                    schedule: [
                      {'doctor': 'Ophthalmic', 'time': '09:30'},
                      {'doctor': 'Dentist', 'time': '13:30'},
                      {'doctor': 'Dermatology', 'time': '16:00'},
                      {'doctor': 'Pediatrician', 'time': '13:30 '},
                      {'doctor': 'Orthopaedician', 'time': '17:30'},
                      {'doctor': 'ENT', 'time': '14:00 '},
                    ],
                    primaryColor: primaryColor,
                  ),
                  SizedBox(height: 20),
                  ScheduleTile(
                    day: 'Saturday',
                    schedule: [
                      {'doctor': 'Dr. Madhu Azad (Homeopathy)', 'time': '09:30'},
                    ],
                    primaryColor: primaryColor,
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Nearby Hospitals',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  // Container around Nearby Hospitals Contact Tiles
                  Container(
                    decoration: BoxDecoration(
                      color: secondaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      children: [
                        ContactTile(
                          name: 'Amara Hospital',
                          number: '7993933777',
                          primaryColor: primaryColor,
                        ),
                        Divider(color: primaryColor.withOpacity(0.5)),
                        ContactTile(
                          name: 'Sankalpa Hospital',
                          number: '8886696040',
                          primaryColor: primaryColor,
                        ),
                        Divider(color: primaryColor.withOpacity(0.5)),
                        ContactTile(
                          name: 'Narayanadri Hospital',
                          number: '0877-2233449',
                          primaryColor: primaryColor,
                        ),
                        Divider(color: primaryColor.withOpacity(0.5)),
                        ContactTile(
                          name: 'Ankura Hospital',
                          number: '9053108108',
                          primaryColor: primaryColor,
                        ),
                        Divider(color: primaryColor.withOpacity(0.5)),
                        ContactTile(
                          name: 'Helios Hospital',
                          number: '7331123637',
                          primaryColor: primaryColor,
                        ),
                        Divider(color: primaryColor.withOpacity(0.5)),
                        ContactTile(
                          name: 'Haripriya Dental Hospital',
                          number: '9849499459',
                          primaryColor: primaryColor,
                        ),
                        Divider(color: primaryColor.withOpacity(0.5)),
                        ContactTile(
                          name: 'Firoz Dental Hospital',
                          number: '9704582322',
                          primaryColor: primaryColor,
                        ),
                        Divider(color: primaryColor.withOpacity(0.5)),
                        ContactTile(
                          name: 'Meghana Dental Hospital',
                          number: '7893327036',
                          primaryColor: primaryColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
    );
  }
}

// ListTile for Contacts
class ContactTile extends StatelessWidget {
  final String name;
  final String number;
  final Color primaryColor;

  ContactTile({
    required this.name,
    required this.number,
    required this.primaryColor,
  });

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0), // Added padding to avoid overflow
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(
            color: primaryColor,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          number,
          style: TextStyle(
            color: primaryColor.withOpacity(0.7),
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.call, color: primaryColor),
          onPressed: () {
            if (number.contains(RegExp(r'^[0-9]+$'))) {
              _makePhoneCall('tel:$number');
            }
          },
        ),
      ),
    );
  }
}

// ListTile for Doctor Schedules
class ScheduleTile extends StatelessWidget {
  final String day;
  final List<Map<String, String>> schedule;
  final Color primaryColor;

  ScheduleTile({
    required this.day,
    required this.schedule,
    required this.primaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(0xFFB0E7FC),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: TextStyle(
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Column(
              children: schedule.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        entry['doctor']!,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        entry['time']!,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// InfoCard Widget (assuming it's defined elsewhere)
class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final Color primaryColor;
  final Color secondaryColor;
  final Color whiteColor;

  InfoCard({
    required this.title,
    required this.content,
    required this.primaryColor,
    required this.secondaryColor,
    required this.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: secondaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              content,
              style: TextStyle(
                color: whiteColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
