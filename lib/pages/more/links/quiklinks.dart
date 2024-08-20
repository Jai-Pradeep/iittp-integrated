import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class QuikLinksPage extends StatefulWidget {
  const QuikLinksPage({super.key});

  @override
  State<QuikLinksPage> createState() => _QuikLinksPageState();
}

class _QuikLinksPageState extends State<QuikLinksPage> {
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
            backgroundColor: const Color.fromARGB(0, 178, 94, 94),
            title: const Text(
              'QUICK LINKS',
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

      //
      body: Container(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue[200],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFE3F2FD),
                    child: Icon(
                      Icons.badge_rounded, // Dynamic icon for each committee
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  title: const Text(
                    'ERP Portal',
                    style: TextStyle(
                      fontSize: 20.0, // Set the font size here
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_outward_rounded),
                  iconColor: const Color.fromARGB(255, 255, 255, 255),

                  subtitle: const Text(
                      'For All Maintenance Requests Use The Online Portal '),

                  textColor: const Color.fromARGB(255, 0, 0, 0),
                  //tileColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(10),

                  onTap: () {
                    const link =
                        "https://iittp.plumerp.co.in/prod/iittirupati/";
                    launchUrl(Uri.parse(link), mode: LaunchMode.inAppWebView);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue[200],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFE3F2FD),
                    child: Icon(
                      Icons.school_rounded, // Dynamic icon for each committee
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  title: const Text(
                    'IIT Tirupati Site',
                    style: TextStyle(
                      fontSize: 20.0, // Set the font size here
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_outward_rounded),
                  iconColor: const Color.fromARGB(255, 255, 255, 255),

                  subtitle: const Text('For All College Related Information'),

                  textColor: const Color.fromARGB(255, 0, 0, 0),
                  //tileColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(10),

                  onTap: () {
                    const link = "https://www.iittp.ac.in/";
                    launchUrl(Uri.parse(link), mode: LaunchMode.inAppWebView);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Container(
                margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.lightBlue[200],
                ),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: const Color(0xFFE3F2FD),
                    child: Icon(
                      Icons.menu_book_rounded, // Dynamic icon for each committee
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  title: const Text(
                    'Campus Magazine',
                    style: TextStyle(
                      fontSize: 20.0, // Set the font size here
                    ),

                  ),
                  trailing: const Icon(Icons.arrow_outward_rounded),
                  iconColor: const Color.fromARGB(255, 255, 255, 255),

                  subtitle: const Text('Uncovering Campus Stories'),

                  textColor: const Color.fromARGB(255, 0, 0, 0),
                  //tileColor: Colors.blue,
                  contentPadding: const EdgeInsets.all(10),

                  onTap: () {
                    const link = "https://udaaniitt.in/";
                    launchUrl(Uri.parse(link), mode: LaunchMode.inAppWebView);
                  },
                ),

              ),

            ),

            //
            //
            //
          ],
        ),
      ),
    );
  }
}
