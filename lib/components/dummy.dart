import 'package:flutter/material.dart';

class MedicalFacilitiesInfo extends StatelessWidget {
  final Color primaryColor = Color(0xFF000C14);
  final Color accentColor = Color(0xFF4DAFF9);
  final Color secondaryColor = Color(0xFFB0E7FC);
  final Color whiteColor = Color(0xFF000C14);
  final Color backgroundColor = Color(0xFF75D4FA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Medical Facilities Info',
          style: TextStyle(
            color: whiteColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(color: whiteColor),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/med2.jpeg'),

            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Location and Contact Information
                InfoCard(
                  title: 'Location:',
                  content: 'Old Library, Ground Floor, Transit Campus',
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                  whiteColor: primaryColor,
                ),
                SizedBox(height: 10),
                InfoCard(
                  title: 'Pharmacy',
                  content: '8247414838',
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                  whiteColor: primaryColor,
                ),
                SizedBox(height: 10),
                InfoCard(
                  title: 'Emergency',
                  content: '7901070270',
                  icon: Icons.phone,
                  primaryColor: primaryColor,
                  secondaryColor: secondaryColor,
                  whiteColor: primaryColor,
                ),
                SizedBox(height: 20),

                // Doctor Schedule
                ScheduleCard(
                  day: 'Monday To Friday',
                  schedule: [
                    {'doctor': 'Dr. Arun (Opthalmic)', 'time': '09:30'},
                    {'doctor': 'Dr. Sahithi (Dentist)', 'time': '13:30'},
                    {'doctor': 'Dr. Keerthi (Dermatology)', 'time': '16:00'},
                    {'doctor': 'Dr. Sindhura (Pediatrician)', 'time': '13:30 (Mon & Thu)'},
                    {'doctor': 'Dr. Umamaheswar (Orthopaedician)', 'time': '17:30'},
                    {'doctor': 'Mrs. Pratap (ENT)', 'time': '14:00 (Tue & Fri)'},
                  ],
                  primaryColor: secondaryColor,
                  accentColor: primaryColor,
                  whiteColor: primaryColor,
                ),
                SizedBox(height: 20),
                ScheduleCard(
                  day: 'Saturday',
                  schedule: [
                    {'doctor': 'Dr. Madhu Azad (Homeopathy)', 'time': '09:30'},
                  ],
                  primaryColor: secondaryColor,
                  accentColor: primaryColor,
                  whiteColor: primaryColor,
                ),
                SizedBox(height: 20),

                // Nearby Hospitals
                Text(
                  'Nearby Hospitals',
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                HospitalCard(
                  name: 'Amara Hospital',
                  phoneNumber: '7993933777',
                  primaryColor: secondaryColor,
                  accentColor: whiteColor,
                  whiteColor: whiteColor,
                ),
                HospitalCard(
                  name: 'Sankalpa Hospital',
                  phoneNumber: '8886696040',
                  primaryColor: secondaryColor,
                  accentColor: whiteColor,
                  whiteColor: whiteColor,
                ),
                HospitalCard(
                  name: 'Narayanadri Hospital',
                  phoneNumber: '0877-2233449',
                  primaryColor: secondaryColor,
                  accentColor: whiteColor,
                  whiteColor: whiteColor,
                ),
                HospitalCard(
                  name: 'Ankura Hospital',
                  phoneNumber: '9053108108',
                  primaryColor: secondaryColor,
                  accentColor: whiteColor,
                  whiteColor: whiteColor,
                ),
                HospitalCard(
                  name: 'Helios Hospital',
                  phoneNumber: '7331123637',
                  primaryColor: secondaryColor,
                  accentColor: whiteColor,
                  whiteColor: whiteColor,
                ),
                HospitalCard(
                  name: 'Haripriya Dental Hospital',
                  phoneNumber: '9849499459',
                  primaryColor: secondaryColor,
                  accentColor: whiteColor,
                  whiteColor: whiteColor,
                ),
                HospitalCard(
                  name: 'Firoz Dental Hospital',
                  phoneNumber: '9704582322',
                  primaryColor: secondaryColor,
                  accentColor: whiteColor,
                  whiteColor: whiteColor,
                ),
                HospitalCard(
                  name: 'Meghana Dental Hospital',
                  phoneNumber: '7893327036',
                  primaryColor: secondaryColor,
                  accentColor: whiteColor,
                  whiteColor: whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// InfoCard, HospitalCard, and ScheduleCard classes remain unchanged
// InfoCard Widget
class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData? icon;
  final Color primaryColor;
  final Color secondaryColor;
  final Color whiteColor;

  InfoCard({
    required this.title,
    required this.content,
    this.icon,
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
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(height: 4),
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
            if (icon != null)
              Icon(
                icon,
                color: whiteColor,
              ),
          ],
        ),
      ),
    );
  }
}

// HospitalCard Widget
class HospitalCard extends StatelessWidget {
  final String name;
  final String phoneNumber;
  final Color primaryColor;
  final Color accentColor;
  final Color whiteColor;

  HospitalCard({
    required this.name,
    required this.phoneNumber,
    required this.primaryColor,
    required this.accentColor,
    required this.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: TextStyle(
                color: whiteColor,
                fontSize: 16,
              ),
            ),
            Text(
              phoneNumber,
              style: TextStyle(
                color: accentColor,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ScheduleCard Widget
class ScheduleCard extends StatelessWidget {
  final String day;
  final List<Map<String, String>> schedule;
  final Color primaryColor;
  final Color accentColor;
  final Color whiteColor;

  ScheduleCard({
    required this.day,
    required this.schedule,
    required this.primaryColor,
    required this.accentColor,
    required this.whiteColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              day,
              style: TextStyle(
                color: whiteColor,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            for (var entry in schedule)
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      entry['doctor']!,
                      style: TextStyle(
                        color: accentColor,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      entry['time']!,
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}