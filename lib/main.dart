import 'package:flutter/material.dart';
import 'package:iittp_integrated/pages/auth_page.dart';
import 'package:iittp_integrated/pages/bus.dart';
import 'package:iittp_integrated/pages/calendar/calendar.dart';
import 'package:iittp_integrated/pages/club/club.dart';
import 'package:iittp_integrated/pages/developers/dev.dart';
import 'package:iittp_integrated/pages/feedback/feedback.dart';
import 'package:iittp_integrated/pages/home.dart';
import 'package:iittp_integrated/pages/map/map.dart';
import 'package:iittp_integrated/pages/medical/medical.dart';
import 'package:iittp_integrated/pages/mess/messmenu.dart';

import 'package:iittp_integrated/pages/more/chatbox_page.dart';
import 'package:iittp_integrated/pages/more/contacts.dart';
import 'package:iittp_integrated/pages/more/links/quiklinks.dart';
import 'package:iittp_integrated/pages/outlets/outletpage.dart';
import 'package:iittp_integrated/pages/tt/tt.dart';
import 'package:url_launcher/url_launcher.dart';
import 'pages/login_student.dart';
import 'package:iittp_integrated/pages/more/more.dart';
import 'package:iittp_integrated/pages/more/settings.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: AuthPage(),
      routes: {
        '/authpage':(context) => AuthPage(),
        '/login_student':(context) => LoginPage(),
        '/homepage': (context) => HomePage(),
        '/committees': (context) => ClubActivitiesPage(),

        '/developers' : (context) => DevPage(),
        '/bus' : (context) => BusScheduleScreen(),
        '/map' : (context) => MapsPage(),
        '/feedback' : (context) => FeedbackDialog(),
        '/outlet' : (context) => OutletPage(),
        '/quicklinks' : (context) => QuikLinksPage(),
        '/more' : (context) => MorePage(),
        '/contact': (context) => ContactsPage(),
        '/tt' : (context) => TimeTable(),
        '/chatbot':(context) => ChatboxPage(),
        '/medical' : (context) => MedicalFacilitiesInfo(),
        '/calendar' : (context) => EventsCalendarScreen(),
        '/mess' : (context) => MessMenuPage(),
      }
    );
  }
}
