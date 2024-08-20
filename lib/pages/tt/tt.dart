import 'package:flutter/material.dart';
import 'package:iittp_integrated/pages/home.dart';
import 'package:iittp_integrated/pages/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

DateTime now = DateTime.now();
int dayNum = now.weekday;

bool _MonSelected = dayNum == 1;
bool _TueSelected = dayNum == 2;
bool _WedSelected = dayNum == 3;
bool _ThuSelected = dayNum == 4;
bool _FriSelected = dayNum == 5;
bool _SatSelected = dayNum == 6;
bool _SunSelected = dayNum == 7;

class TimeTable extends StatefulWidget {
  @override
  _TimeTableState createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  SharedPreferences? _prefs;
  String? _selectedYear;
  String? _selectedBranch;
  bool _showTimetable = false;
  final int _pageOffset = 1000;
  int _selectedDayIndex = dayNum - 1;
  PageController _pageController = PageController(initialPage: dayNum - 1);

  // Timetable structure with permanent storage
  Map<String, Map<String, Map<String, List<Map<String, String>>>>> _timetable =
  {
    'Mon': {
      '1st Year': {
        'Computer Science': [
          {
            'name': 'Chemistry',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming Lab',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'CCF Lab 2'
          },
        ],
        'Electrical': [
          {
            'name': 'Chemistry',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming Lab',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'CCF Lab 2'
          },
        ],
        'Mechanical': [
          {
            'name': 'Chemistry',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming Lab',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'CCF Lab 2'
          },
        ],
        'Civil': [
          {
            'name': 'Chemistry',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming Lab',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'CCF Lab 2'
          },
        ],
        'Chemical': [
          {
            'name': 'Chemistry',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming Lab',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'CCF Lab 2'
          },
        ],
        'Engineering Physics': [
          {
            'name': 'Chemistry',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming Lab',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'CCF Lab 2'
          },
        ],
      },
      '2nd Year': {
        'Computer Science': [
          {
            'name': 'DSA',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'Discrete Math',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC CR 006'
          },
          {
            'name': 'DLD',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'Systems Lab'
          },
        ],
        'Electrical': [
          {
            'name': 'Electrical Circuits & Networks',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 005'
          },
          {
            'name': 'Semi-Conductor Devices',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 005'
          },
          {
            'name': 'DSP',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC CR 006'
          },
          {
            'name': 'DS Lab',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'Systems Lab'
          },
        ],
        'Mechanical': [
          {
            'name': 'Mechanics of Solids',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Fluid Mechanics',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Thermodynamics',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC CR 006'
          },
        ],
        'Chemical': [
          {
            'name': 'Fluid Mechanics',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 202'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Applied Processes',
            'start_time': '2pm',
            'end_time': '3pm',
            'location': 'LHC CR 202'
          },
        ]
      },
      '3rd Year': {
        'Chemical': [
          {
            'name': 'Homo Reaction Engineering',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'Transport Phenomena',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'Elective',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'AB2 CR 102'
          },
          {
            'name': 'Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'AB2 CR 102'
          },
          {
            'name': 'Mass Transfer Lab',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'AB2 CR 002'
          },
        ]
      }
    },
    'Tue': {
      '1st Year': {
        'Computer Science': [
          {
            'name': 'Chemistry',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Language Course',
            'start_time': '11am',
            'end_time': '1pm',
            'location': ''
          },
        ],
        'Electrical': [
          {
            'name': 'Chemistry',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Language Course',
            'start_time': '11am',
            'end_time': '1pm',
            'location': ''
          },
        ],
        'Mechanical': [
          {
            'name': 'Chemistry',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Language Course',
            'start_time': '11am',
            'end_time': '1pm',
            'location': ''
          },
        ],
        'Civil': [
          {
            'name': 'Chemistry',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Language Course',
            'start_time': '11am',
            'end_time': '1pm',
            'location': ''
          },
        ],
        'Chemical': [
          {
            'name': 'Chemistry',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Language Course',
            'start_time': '11am',
            'end_time': '1pm',
            'location': ''
          },
        ],
        'Engineering Physics': [
          {
            'name': 'Chemistry',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Language Course',
            'start_time': '11am',
            'end_time': '1pm',
            'location': ''
          },
        ],
      },
      '2nd Year': {
        'Computer Science': [
          {
            'name': 'DSA',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'Discrete Math',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'Software Engineering',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 006'
          },
          {
            'name': 'DLD',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'Quantum Science',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Electrical': [
          {
            'name': 'Electrical Circuits & Networks',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC CR 005'
          },
          {
            'name': 'Semi-Conductor Devices',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 005'
          },
          {
            'name': 'Digital Systems',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 005'
          },
          {
            'name': 'Quantum Science',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'DSP Lab',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'Systems Lab'
          },
        ],
        'Mechanical': [
          {
            'name': 'Fluid Mechanics',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Thermodynamics',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Material Science',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Foundry and Welding',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Quantum Science',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Chemical': [
          {
            'name': 'Fluid Mechanics',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 202'
          },
          {
            'name': 'Heat Transfer',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 202'
          },
          {
            'name': 'Computational Techniques',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 001'
          },
          {
            'name': 'Quantum Science',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Thermodynamics',
            'start_time': '2pm',
            'end_time': '4pm',
            'location': 'LHC CR 202'
          },
        ]
      },
      '3rd Year': {
        'Chemical': [
          {
            'name': 'Homo Reaction Engineering',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'Transport Phenomena',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'SPP',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'Computational Techniques',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 001'
          },
        ]
      }
    },
    'Wed': {
      '1st Year': {
        'Computer Science': [
          {
            'name': 'Engineering Mechanics',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'CED',
            'start_time': '3pm',
            'end_time': '5pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Electrical': [
          {
            'name': 'Engineering Mechanics',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'CED',
            'start_time': '3pm',
            'end_time': '5pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Mechanical': [
          {
            'name': 'Engineering Mechanics',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'CED',
            'start_time': '3pm',
            'end_time': '5pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Civil': [
          {
            'name': 'Engineering Mechanics',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'CED',
            'start_time': '3pm',
            'end_time': '5pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Chemical': [
          {
            'name': 'Engineering Mechanics',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'CED',
            'start_time': '3pm',
            'end_time': '5pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Engineering Physics': [
          {
            'name': 'Engineering Mechanics',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Math',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'CED',
            'start_time': '3pm',
            'end_time': '5pm',
            'location': 'LHC 240 Seater'
          },
        ],
      },
      '2nd Year': {
        'Computer Science': [
          {
            'name': 'Software Engineering',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Discrete Math',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Quantum Science',
            'start_time': '2pm',
            'end_time': '3pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'DSA Lab',
            'start_time': '3pm',
            'end_time': '6pm',
            'location': 'Intelligent Systems Lab'
          },
        ],
        'Electrical': [
          {
            'name': 'Digital Systems',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 005'
          },
          {
            'name': 'DSP',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Semi-conductor Devices',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 005'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Quantum Science',
            'start_time': '2pm',
            'end_time': '3pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Mechanical': [
          {
            'name': 'Mechanics of Solids',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Material Science',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Thermodynamics',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Quantum Science',
            'start_time': '2pm',
            'end_time': '3pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Chemical': [
          {
            'name': 'Heat Transfer',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 202'
          },
          {
            'name': 'Fluid Mechanics',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 202'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Quantum Science',
            'start_time': '2pm',
            'end_time': '3pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computational Techniques Lab',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'Comp Tech Lab'
          },
        ]
      },
      '3rd Year': {
        'Chemical': [
          {
            'name': 'SPP',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'Elective',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'AB2 CR 102'
          },
          {
            'name': 'Transport Phenomena',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'AB2 CR 102'
          },
        ]
      }
    },
    'Thu': {
      '1st Year': {
        'Computer Science': [
          {
            'name': 'Engineering Math',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Electrical': [
          {
            'name': 'Engineering Math',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Mechanical': [
          {
            'name': 'Engineering Math',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Civil': [
          {
            'name': 'Engineering Math',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Chemical': [
          {
            'name': 'Engineering Math',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Engineering Physics': [
          {
            'name': 'Engineering Math',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Electrical Systems',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
        ],
      },
      '2nd Year': {
        'Computer Science': [
          {
            'name': 'Discrete Math',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'DLD',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'DSA',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'Quantum Science',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Electrical': [
          {
            'name': 'Semi-conductor Devices',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC CR 005'
          },
          {
            'name': 'DSP',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Electrical Circuits & Networks',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 005'
          },
          {
            'name': 'Quantum Science',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Mechanical': [
          {
            'name': 'Thermodynamics',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Foundry and Welding',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Fluid Mechanics',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Quantum Science',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Chemical': [
          {
            'name': 'Fluid Mechanics',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC CR 202'
          },
          {
            'name': 'Computational Techniques',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 001'
          },
          {
            'name': 'Quantum Science',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
        ]
      },
      '3rd Year': {
        'Chemical': [
          {
            'name': 'Transport Phenomena',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'Elective',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'AB2 CR 102'
          },
          {
            'name': 'Computational Techniques',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 001'
          },
          {
            'name': 'Homo Reaction Engineering',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'Applied Process Engineering',
            'start_time': '2pm',
            'end_time': '5pm',
            'location': 'AB2 CR 002'
          },
        ]
      }
    },
    'Fri': {
      '1st Year': {
        'Computer Science': [
          {
            'name': 'Chemistry',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry Lab',
            'start_time': '3pm',
            'end_time': '6pm',
            'location': 'Chemistry Lab'
          },
        ],
        'Electrical': [
          {
            'name': 'Chemistry',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry Lab',
            'start_time': '3pm',
            'end_time': '6pm',
            'location': 'Chemistry Lab'
          },
        ],
        'Mechanical': [
          {
            'name': 'Chemistry',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry Lab',
            'start_time': '3pm',
            'end_time': '6pm',
            'location': 'Chemistry Lab'
          },
        ],
        'Civil': [
          {
            'name': 'Chemistry',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry Lab',
            'start_time': '3pm',
            'end_time': '6pm',
            'location': 'Chemistry Lab'
          },
        ],
        'Chemical': [
          {
            'name': 'Chemistry',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry Lab',
            'start_time': '3pm',
            'end_time': '6pm',
            'location': 'Chemistry Lab'
          },
        ],
        'Engineering Physics': [
          {
            'name': 'Chemistry',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Engineering Mechanics',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Computer Programming',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
          {
            'name': 'Chemistry Lab',
            'start_time': '3pm',
            'end_time': '6pm',
            'location': 'Chemistry Lab'
          },
        ],
      },
      '2nd Year': {
        'Computer Science': [
          {
            'name': 'DLD',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'Discrete Math',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'AB1 CR 101'
          },
          {
            'name': 'Software Engineering',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC CR 006'
          },
        ],
        'Electrical': [
          {
            'name': 'Electrical Circuits & Networks',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 005'
          },
          {
            'name': 'Digital Systems',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 005'
          },
          {
            'name': 'Math Elective',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 006'
          },
        ],
        'Mechanical': [
          {
            'name': 'Mechanics of Solids',
            'start_time': '8am',
            'end_time': '9am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Foundry and Welding',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Fluid Mechanics',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Material Science',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 002'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC 240 Seater'
          },
        ],
        'Chemical': [
          {
            'name': 'Computational Techniques',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 001'
          },
          {
            'name': 'Heat Transfer',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'LHC CR 202'
          },
          {
            'name': 'Math Elective',
            'start_time': '12pm',
            'end_time': '1pm',
            'location': 'LHC CR 006'
          },
          {
            'name': 'Thermodynamics',
            'start_time': '2pm',
            'end_time': '3pm',
            'location': 'LHC CR 202'
          },
        ]
      },
      '3rd Year': {
        'Chemical': [
          {
            'name': 'Computational Techniques',
            'start_time': '9am',
            'end_time': '10am',
            'location': 'LHC CR 001'
          },
          {
            'name': 'Homo Reaction Engineering',
            'start_time': '10am',
            'end_time': '11am',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'SPP',
            'start_time': '11am',
            'end_time': '12pm',
            'location': 'AB2 CR 002'
          },
          {
            'name': 'Elective',
            'start_time': '12am',
            'end_time': '1pm',
            'location': 'AB2 CR 102'
          },
        ]
      }
    },
    'Sat': {},
    'Sun': {},
  };

  final List<String> _years = ['1st Year', '2nd Year', '3rd Year', '4th Year'];
  final List<String> _branchesFirstYear = [
    'Computer Science',
    'Electrical',
    'Mechanical',
    'Civil',
    'Chemical',
    'Engineering Physics'
  ];
  final List<String> _branchesOtherYears = [
    'Computer Science',
    'Electrical',
    'Mechanical',
    'Civil',
    'Chemical'
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageOffset + dayNum - 1);
    _selectedDayIndex = dayNum - 1;
    _initializePreferences();

    _showTimetable = true;
    _selectedYear = "1st Year";
    _selectedBranch = "Computer Science";
  }

  Future<void> _initializePreferences() async {
    _prefs = await SharedPreferences.getInstance();
    _loadTimetable();

    // Ensure that the day index is properly set on re-initialization
    setState(() {
      _selectedDayIndex = dayNum - 1;
      _pageController = PageController(initialPage: _selectedDayIndex);
    });
  }

  void _loadTimetable() {
    String? savedTimetable = _prefs?.getString('timetable');
    if (savedTimetable != null) {
      setState(() {
        _timetable = Map<String,
            Map<String, Map<String, List<Map<String, String>>>>>.from(
            json.decode(savedTimetable));
      });
    }
  }

  void _saveTimetable() {
    _prefs?.setString('timetable', json.encode(_timetable));
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD),
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
            leading: _showTimetable
                ? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
            )
                : null,
            centerTitle: true,
            title: const Text(
              "Time Table",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: 'Josefin Sans',
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
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
            elevation: 0,
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  setState(() {
                    _showTimetable = false;
                    _selectedYear = null;
                    _selectedBranch = null;
                  });
                },
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: _showTimetable
              ? Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Row for Days with equal width containers
              Row(
                children: List.generate(7, (index) {
                  DateTime today = DateTime.now();
                  DateTime date = today.add(
                      Duration(days: (index - today.weekday + 8) % 7));
                  String dateString = "${date.day}/${date.month}";

                  return dayButton(
                    getDayName(index),
                    dateString,
                    index == _selectedDayIndex,
                        () {
                      setState(() {
                        _selectedDayIndex = index;
                        _pageController
                            .jumpToPage((_selectedDayIndex + 7) % 7);
                      });
                    },
                    screenWidth / 7,
                  );
                }),
              ),

              // Content that changes based on selected day
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _selectedDayIndex = index % 7;
                    });
                  },
                  itemCount: null,
                  itemBuilder: (context, index) {
                    int actualIndex = index %
                        7; // Wrap around the index for circular scrolling
                    return buildTimetable(
                      getDayName(actualIndex),
                      _selectedYear,
                      _selectedBranch,
                    );
                  },
                ),
              ),
            ],
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Dropdown for selecting year
              Container(
                width: 300,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButton<String>(
                    value: _selectedYear,
                    hint: const Text('Select Year'),
                    dropdownColor: Colors.blue[100],
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedYear = newValue;
                        _selectedBranch =
                        null; // Reset branch when year is changed
                      });
                    },
                    items: _years
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    underline: Container(),
                    isExpanded: true,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Dropdown for selecting branch
              Container(
                width: 300,
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: DropdownButton<String>(
                    value: _selectedBranch,
                    hint: const Text('Select Branch'),
                    dropdownColor: Colors.blue[100],
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedBranch = newValue;
                      });
                    },
                    items: (_selectedYear == '1st Year'
                        ? _branchesFirstYear
                        : _branchesOtherYears)
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    underline: Container(),
                    isExpanded: true,
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // Button to show timetable
              ElevatedButton(
                onPressed:
                _selectedYear != null && _selectedBranch != null
                    ? () {
                  setState(() {
                    _showTimetable = true;
                  });
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 16),
                  backgroundColor: Colors.blue[400],
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Show Timetable',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: _showTimetable
          ? FloatingActionButton(
        onPressed: () {
          addCourseDialog(getDayName(_selectedDayIndex));
        },
        backgroundColor: Colors.lightBlue,
        child: const Icon(Icons.add),
      )
          : null,
    );
  }

  String getDayName(int index) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[index];
  }

  Widget dayButton(String dayName, String date, bool isSelected,
      VoidCallback onTap, double width) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 37, 151, 244)
              : Color(0xFF81D4FA),
          //borderRadius: BorderRadius.circular(0.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                dayName,
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 2),
              Text(
                date,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimetable(String dayName, String? year, String? branch) {
    if (year == null || branch == null) {
      return Center(child: Text('Please select a year and branch.'));
    }
    List<Map<String, String>>? timetable = _timetable[dayName]?[year]?[branch];

    if (timetable == null) {
      return Container(); // Return an empty container if no timetable exists for the day
    }

    return ListView.builder(
      itemCount: timetable.length,
      itemBuilder: (context, index) {
        final course = timetable[index];
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          color: Colors.lightBlue[200],
          child: ListTile(
            contentPadding: EdgeInsets.all(8.0),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  course['name'] ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(
                  '${course['start_time']} - ${course['end_time']}',
                  style: TextStyle(color: Colors.grey[600]),
                ),
                SizedBox(height: 4.0),
                Text(
                  course['location'] ?? '',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  color: Colors.black87,
                  onPressed: () {
                    editCourseDialog(dayName, index);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    setState(() {
                      timetable.removeAt(index);
                    });
                    _saveTimetable(); // Save after deleting the course
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void addCourseDialog(String dayName) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        final _courseNameController = TextEditingController();
        final _startTimeController = TextEditingController();
        final _endTimeController = TextEditingController();
        final _locationController = TextEditingController();

        return AlertDialog(
          backgroundColor: Color(0xFFE3F2FD),
          title: Text('Add Course'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _courseNameController,
                  decoration: InputDecoration(labelText: 'Course Name'),
                ),
                TextField(
                  controller: _startTimeController,
                  decoration: InputDecoration(labelText: 'Start Time'),
                ),
                TextField(
                  controller: _endTimeController,
                  decoration: InputDecoration(labelText: 'End Time'),
                ),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final newCourse = {
                  'name': _courseNameController.text,
                  'start_time': _startTimeController.text,
                  'end_time': _endTimeController.text,
                  'location': _locationController.text,
                };

                setState(() {
                  _timetable[dayName] ??= {}; // Ensure the day exists
                  _timetable[dayName]![_selectedYear!] ??=
                  {}; // Ensure the year exists
                  _timetable[dayName]![_selectedYear!]![_selectedBranch!] ??=
                  []; // Ensure the branch exists
                  _timetable[dayName]![_selectedYear!]![_selectedBranch!]!
                      .add(newCourse); // Add the course
                });

                _saveTimetable(); // Save after adding the course
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void editCourseDialog(String dayName, int courseIndex) {
    final course =
    _timetable[dayName]![_selectedYear]![_selectedBranch]![courseIndex];
    final _courseNameController = TextEditingController(text: course['name']);
    final _startTimeController =
    TextEditingController(text: course['start_time']);
    final _endTimeController = TextEditingController(text: course['end_time']);
    final _locationController = TextEditingController(text: course['location']);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Course for $dayName'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _courseNameController,
                  decoration: InputDecoration(labelText: 'Course Name'),
                ),
                TextField(
                  controller: _startTimeController,
                  decoration: InputDecoration(labelText: 'Start Time'),
                ),
                TextField(
                  controller: _endTimeController,
                  decoration: InputDecoration(labelText: 'End Time'),
                ),
                TextField(
                  controller: _locationController,
                  decoration: InputDecoration(labelText: 'Location'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  course['name'] = _courseNameController.text;
                  course['start_time'] = _startTimeController.text;
                  course['end_time'] = _endTimeController.text;
                  course['location'] = _locationController.text;
                });

                _saveTimetable(); // Save after editing the course
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
