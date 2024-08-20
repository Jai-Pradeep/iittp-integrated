import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:iittp_integrated/bot_navi/bottomnav.dart';

class BusScheduleScreen extends StatefulWidget {
  const BusScheduleScreen({super.key});

  @override
  _BusScheduleScreenState createState() => _BusScheduleScreenState();
}

class _BusScheduleScreenState extends State<BusScheduleScreen> {
  String? source;
  String? destination;

  final List<String> sources = ['Malhar', 'LHC', 'Kedar'];
  final List<String> destinations = ['Malhar', 'LHC', 'Kedar'];

  final Map<String, Map<String, List<String>>> weekdaySchedule = {
    '1': {
      'Kedar': [
        '7:30',
        '8:30',
        '9:30',
        '10:30',
        '11:30',
        '12:30',
        '14:00',
        '15:00',
        '16:00',
        '17:30',
        '18:30',
        '19:30'
      ],
      'LHC': [
        '7:40',
        '8:40',
        '9:40',
        '10:40',
        '11:40',
        '12:40',
        '14:10',
        '15:10',
        '16:10',
        '17:40',
        '18:40',
        '19:40'
      ],
      'Malhar': [
        '7:45',
        '8:45',
        '9:45',
        '10:45',
        '11:45',
        '12:45',
        '14:15',
        '15:15',
        '16:15',
        '17:45',
        '18:45',
        '19:45'
      ],
    },
    '2': {
      'Kedar': ['10:00', '11:00', '12:00', '13:30', '14:30', '15:30', '16:30'],
      'LHC': ['10:10', '11:10', '12:10', '13:40', '14:40', '15:35', '16:40'],
      'Malhar': ['10:15', '11:15', '12:15', '13:45', '14:45', '15:40', '16:45'],
    },
  };

  final Map<String, Map<String, List<String>>> weekendSchedule = {
    '1': {
      'Kedar': ['8:40', '9:30', '12:30', '13:15', '16:30', '17:30'],
      'LHC': ['8:50', '9:40', '12:40', '13:25', '16:40', '17:40'],
      'Malhar': ['8:55', '9:45', '12:45', '13:30', '16:45', '17:45'],
    },
  };

  List<Map<String, String>> nextBuses = [];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pushNamedAndRemoveUntil('/homepage', (route) => false);
          return false;
        },
    child:  Scaffold(
      backgroundColor: Color(0xFFe8f4fc),
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
              'Bus Schedule',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 2.0,
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
      body: Column(
        children: [
          Container(
            color: Colors.blue[200],
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'From:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue[300]!, Colors.blue[500]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: DropdownButtonFormField<String>(
                              value: source,
                              hint: const Text(
                                'Select',
                                style: TextStyle(color: Colors.white),
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.location_on,
                                    color: Colors.white),
                              ),
                              dropdownColor: Colors.blue[300],
                              style: const TextStyle(color: Colors.white),
                              iconEnabledColor: Colors.white,
                              items: sources.map((String source) {
                                return DropdownMenuItem<String>(
                                  value: source,
                                  child: Text(
                                    source,
                                    style: TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  source = newValue;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'To:',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blue[300]!, Colors.blue[500]!],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.2),
                                  blurRadius: 8,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            child: DropdownButtonFormField<String>(
                              value: destination,
                              hint: const Text(
                                'Select',
                                style: TextStyle(color: Colors.white),
                              ),
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(Icons.location_on,
                                    color: Colors.white),
                              ),
                              dropdownColor: Colors.blue[300],
                              style: const TextStyle(color: Colors.white),
                              iconEnabledColor: Colors.white,
                              items: destinations.map((String destination) {
                                return DropdownMenuItem<String>(
                                  value: destination,
                                  child: Text(
                                    destination,
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  destination = newValue;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        nextBuses = findNextBuses(source);
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15.0, horizontal: 50),
                      backgroundColor: Colors.blue[300],
                      textStyle: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      shadowColor: Colors.black.withOpacity(0.5),
                      elevation: 10.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 10),
                        const Text(
                          'Search',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              // Blue background
              child: nextBuses.isNotEmpty
                  ? ListView.builder(
                itemCount: nextBuses.length,
                itemBuilder: (context, index) {
                  final busInfo = nextBuses[index];

                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 5,
                    margin: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                source ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  height: 2,
                                  color: Colors.purple[300],
                                ),
                              ),
                              Text(
                                destination ?? '',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.directions_bus,
                                  color: Colors.pinkAccent, size: 24),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Departure: ${busInfo['time']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    'Leaves in: ${busInfo['remainingTime']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87,
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Lottie.asset(
                                  "assets/animations/bus2.json",
                                  repeat: true,
                                  fit: BoxFit.fitWidth,
                                  height: 75,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          LinearProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Colors.pinkAccent),
                            backgroundColor: Colors.purple[100],
                            minHeight: 5,
                            value: calculateProgress(
                                busInfo['remainingTime']!),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              )
                  : SizedBox(
                child: Lottie.asset(
                  'assets/animations/bus.json',
                  repeat: true,
                  fit: BoxFit.fitWidth,
                ),
              ),
              // Empty space if no buses
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    ),
    );
  }

  double calculateProgress(String remainingTime) {
    int totalMinutes = 0;

    if (remainingTime.contains('h')) {
      final hours = int.parse(remainingTime.split('h')[0].trim());
      totalMinutes += hours * 60;
    }

    if (remainingTime.contains('m')) {
      final minutesPart = remainingTime.split('h').length > 1
          ? remainingTime.split('h')[1].replaceAll('m', '').trim()
          : remainingTime.replaceAll('m', '').trim();
      totalMinutes += int.parse(minutesPart);
    }

    final maxWaitTime = 180;

    return 1 - (totalMinutes / maxWaitTime);
  }

  List<Map<String, String>> findNextBuses(String? source) {
    List<Map<String, String>> upcomingBuses = [];

    if (source == null) {
      return [];
    }

    final now = DateTime.now();
    final eveningThreshold = DateTime(now.year, now.month, now.day, 19, 30);
    final isWeekend =
        now.weekday == DateTime.saturday || now.weekday == DateTime.sunday;
    final schedule = isWeekend ? weekendSchedule : weekdaySchedule;

    for (var busNo in schedule.keys) {
      List<String> busTimes = schedule[busNo]![source]!;

      for (int i = 0; i < busTimes.length; i++) {
        final timeParts = busTimes[i].split(':');
        var busDateTime = DateTime(now.year, now.month, now.day,
            int.parse(timeParts[0]), int.parse(timeParts[1]));

        if (now.isAfter(busDateTime) && i == busTimes.length - 1) {
          // If current time is after the last bus, show the next day's first buses
          busDateTime = busDateTime.add(Duration(days: 1));
          for (int j = 0; j < schedule[busNo]![source]!.length; j++) {
            final nextDayTimeParts = schedule[busNo]![source]![j].split(':');
            final nextDayBusDateTime = DateTime(
              busDateTime.year,
              busDateTime.month,
              busDateTime.day,
              int.parse(nextDayTimeParts[0]),
              int.parse(nextDayTimeParts[1]),
            );
            final difference = nextDayBusDateTime.difference(now);
            final formattedTime = _formatDifference(difference);

            upcomingBuses.add({
              'time': DateFormat('hh:mm a').format(nextDayBusDateTime),
              'remainingTime': formattedTime,
            });
          }
        } else if (busDateTime.isAfter(now)) {
          final difference = busDateTime.difference(now);
          final formattedTime = _formatDifference(difference);

          upcomingBuses.add({
            'time': DateFormat('hh:mm a').format(busDateTime),
            'remainingTime': formattedTime,
          });
        }
      }
    }

    upcomingBuses.sort((a, b) {
      DateTime timeA = DateFormat('hh:mm a').parse(a['time']!);
      DateTime timeB = DateFormat('hh:mm a').parse(b['time']!);
      return timeA.compareTo(timeB);
    });

    return upcomingBuses;
  }

  String _formatDifference(Duration difference) {
    String formattedTime;
    if (difference.inMinutes > 59) {
      final hours = difference.inHours;
      final minutes = difference.inMinutes % 60;
      formattedTime = '${hours}h ${minutes}m';
    } else {
      formattedTime = '${difference.inMinutes}m';
    }
    return formattedTime;
  }
}
