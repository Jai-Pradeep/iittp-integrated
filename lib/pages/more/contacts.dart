import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsPage extends StatelessWidget {
  final List<Contact> contacts = [
    Contact(name: 'Admin', number: '0877-250-3507'),
    Contact(name: 'Academics', number: '0877-250-3530'),
    Contact(name: 'Library', number: '0877-250-3591'),
    Contact(name: 'HoME', number: '08772503156'),
    Contact(name: 'Placement', number: '111-222-3333'),
    Contact(name: 'Ambulance Service 2', number: '444-555-6666'),
    Contact(name: 'Fire Department', number: '101'),
    Contact(name: 'Police Department', number: '100'),
  ];

  Future<void> requestPhonePermission() async {
    var status = await Permission.phone.status;
    if (!status.isGranted) {
      await Permission.phone.request();
    }
  }

  Future<void> _makePhoneCall(String number, BuildContext context) async {
    await requestPhonePermission(); // Ensure permission is requested
    final url = 'tel:9080028512';
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Could not launch $url')),
        );
       }
    }catch (e) {
    print('\nError launching URL: $e\n');
    ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text('Error launching call')),
    );
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              'Contacts',
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
      body: Container(
        color: Color(0xFFE3F2FD),
        child: ListView.builder(
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.lightBlue[200],
              child: ListTile(
                title: Text(
                  contacts[index].name,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  contacts[index].number,
                  style: TextStyle(
                    color: Colors.grey[700],
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Icons.call),
                  color: Colors.grey[800],
                  onPressed: () {
                    _makePhoneCall(contacts[index].number, context);
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

class Contact {
  final String name;
  final String number;

  Contact({required this.name, required this.number});
}
