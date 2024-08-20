import 'package:flutter/material.dart';
import 'package:iittp_integrated/pages/more/contacts.dart';


class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('More'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contacts'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ContactsPage()),
              );
            },
          ),

          // Add more ListTiles for other pages
        ],
      ),
    );
  }
}
