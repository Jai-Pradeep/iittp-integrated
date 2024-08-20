import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:iittp_integrated/bot_navi/bottomnav.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: EventsCalendarScreen(),
    );
  }
}

class EventsCalendarScreen extends StatefulWidget {
  const EventsCalendarScreen({super.key});

  @override
  _EventsCalendarScreenState createState() => _EventsCalendarScreenState();
}

class _EventsCalendarScreenState extends State<EventsCalendarScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  late Map<DateTime, List<String>> _events;

  @override
  void initState() {
    super.initState();
    _events = {};

    _loadEvents().then((_) {
      setState(() {});
    });

    _events.addAll({
      // Holidays and Important Days
      DateTime(2024, 8, 15): ['Independence Day'],
      DateTime(2024, 10, 2): ['Mahatma Gandhi\'s Birthday'],
      DateTime(2024, 9, 16): ['Milad-Un-Nabi'],
      DateTime(2024, 11, 11): ['Diwali', 'Educational Day'],
      DateTime(2024, 12, 25): ['Christmas Day'],
      DateTime(2024, 11, 27): ['Guru Nanak\'s Jayanthi'],
      DateTime(2024, 10, 24): ['Dussehra'],
      DateTime(2024, 9, 5): ['Teacher\'s Day'],
      DateTime(2024, 9, 15): ['Engineer\'s Day'],
      DateTime(2024, 8, ): ['Fresher\'s Week Starts'],

      // Test-I Examinations
      DateTime(2024, 9, 9): ['Test-01 Examinations (Slot A - FN)', 'Test-01 Examinations (Slot B - AN)'],
      DateTime(2024, 9, 10): ['Test-01 Examinations (Slot C - FN)', 'Test-01 Examinations (Slot D - AN)'],
      DateTime(2024, 9, 11): ['Test-01 Examinations (Slot E - FN)', 'Test-01 Examinations (Slot F - AN)'],
      DateTime(2024, 9, 12): ['Test-01 Examinations (Slot G - FN)', 'Test-01 Examinations (Slot H - AN)'],

      // Test-II Examinations
      DateTime(2024, 10, 14): ['Test-02 Examinations (Slot A - FN)', 'Test-02 Examinations (Slot B - AN)'],
      DateTime(2024, 10, 15): ['Test-02 Examinations (Slot C - FN)', 'Test-02 Examinations (Slot D - AN)'],
      DateTime(2024, 10, 16): ['Test-02 Examinations (Slot E - FN)', 'Test-02 Examinations (Slot F - AN)'],
      DateTime(2024, 10, 17): ['Test-02 Examinations (Slot G - FN)', 'Test-02 Examinations (Slot H - AN)'],

      // End Semester Examinations
      DateTime(2024, 11, 26): ['End Semester Examinations (Slot A)'],
      DateTime(2024, 11, 27): ['End Semester Examinations (Slot B)'],
      DateTime(2024, 11, 28): ['End Semester Examinations (Slot C)'],
      DateTime(2024, 11, 29): ['End Semester Examinations (Slot D)'],
      DateTime(2024, 11, 30): ['End Semester Examinations (Slot E)'],
      DateTime(2024, 12, 2): ['End Semester Examinations (Slot F)'],
      DateTime(2024, 12, 3): ['End Semester Examinations (Slot G)'],
      DateTime(2024, 12, 4): ['End Semester Examinations (Slot H)'],
    });
  }

  Future<void> _saveEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = _events.map((key, value) {
      return MapEntry(key.toIso8601String(), value);
    });
    await prefs.setString('events', json.encode(encodedData));
  }

  Future<void> _loadEvents() async {
    final prefs = await SharedPreferences.getInstance();
    final String? eventsString = prefs.getString('events');
    if (eventsString != null) {
      final decodedData = json.decode(eventsString) as Map<String, dynamic>;
      _events = decodedData.map((key, value) {
        return MapEntry(DateTime.parse(key), List<String>.from(value));
      });
    }
  }

  void _addEvent(String eventName, DateTime eventDate) async {
    setState(() {
      final date = DateTime(eventDate.year, eventDate.month, eventDate.day);
      if (_events.containsKey(date)) {
        _events[date]!.add(eventName);
      } else {
        _events[date] = [eventName];
      }
    });
    await _saveEvents();
  }

  void _deleteEvent(DateTime date, int index) async {
    setState(() {
      _events[date]?.removeAt(index);
      if (_events[date]?.isEmpty ?? false) {
        _events.remove(date);
      }
    });
    await _saveEvents();
  }

  List<String> _getEventsForDay(DateTime day) {
    final date = DateTime(day.year, day.month, day.day);
    return _events[date] ?? [];
  }

  void _showAddEventDialog() {
    final formKey = GlobalKey<FormState>();
    String? eventName;
    DateTime? eventDate = DateTime.now();

    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Add New Event',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Event Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an event name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      eventName = value;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Event Date',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today),
                        onPressed: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: eventDate!,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2101),
                          );
                          if (pickedDate != null && pickedDate != eventDate) {
                            setState(() {
                              eventDate = pickedDate;
                            });
                          }
                        },
                      ),
                    ),
                    controller: TextEditingController(
                      text: DateFormat('yyyy-MM-dd').format(eventDate!),
                    ),
                    onTap: () async {
                      FocusScope.of(context).requestFocus(FocusNode());
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: eventDate!,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101),
                      );
                      if (pickedDate != null && pickedDate != eventDate) {
                        setState(() {
                          eventDate = pickedDate;
                        });
                      }
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select a date';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Swipe to delete after adding',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            _addEvent(eventName!, eventDate!);
                            Navigator.of(context).pop();
                            setState(() {});
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                        ),
                        child: const Text('Add'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
          return false;
        },
    child:  Scaffold(
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
              'Events Calender',
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: CalendarFormat.month,
              availableCalendarFormats: const {
                CalendarFormat.month: 'Month',
              },
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });

                final events = _getEventsForDay(selectedDay);
                if (events.isNotEmpty) {
                  setState(() {});
                }
              },
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              calendarStyle: const CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.lightBlue,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.deepPurple,
                  shape: BoxShape.circle,
                ),
                markersAlignment: Alignment.bottomCenter,
                markerDecoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
              ),
              eventLoader: _getEventsForDay,
            ),
            const SizedBox(height: 8.0),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              child: _buildEventList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEventDialog,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 3),
    ),);
  }

  Widget _buildEventList() {
    final events = _selectedDay != null ? _getEventsForDay(_selectedDay!) : [];
    if (events.isEmpty) {
      return const Center(
        child: Text('No events for this day', style: TextStyle(fontSize: 18, color: Colors.grey)),
      );
    }
    return ListView.builder(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: events.length,
      itemBuilder: (context, index) {
        final event = events[index];
        return Dismissible(
          key: Key(event),
          background: Container(color: Colors.redAccent),
          onDismissed: (direction) {
            setState(() {
              _deleteEvent(_selectedDay!, index);
              // The event is removed from the list here
              events.removeAt(index);
            });
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('$event dismissed')),
            );
          },
          direction: DismissDirection.endToStart,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              elevation: 5,
              color: Colors.lightBlue[50],
              child: ListTile(
                leading: Icon(Icons.event, color: Colors.blue[800]),
                title: Text(
                  event,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800],
                  ),
                ),
                onTap: () {
                  // Handle event click
                },
              ),
            ),
          ),
        );
      },
    );
  }

}
