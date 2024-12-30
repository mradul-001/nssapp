import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as root_bundle;

class EventPage extends StatefulWidget {
  const EventPage({super.key});

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  List<String> months = [
    'JAN',
    'FEB',
    'MAR',
    'APR',
    'MAY',
    'JUN',
    'JUL',
    'AUG',
    'SEP',
    'OCT',
    'NOV',
    'DEC'
  ];
  List<dynamic> events = [];

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final jsonString = await root_bundle.rootBundle
          .loadString('assets/Events_Push/info.json');
      final jsonResponse = jsonDecode(jsonString);
      setState(() {
        events = jsonResponse; // Adjust if your JSON structure differs
      });
    } catch (e) {
      print('Error loading JSON: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    DateTime now = DateTime.now();
    int currentMonth = now.month;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: const Color(0xFF01013B),
          title: const Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'UPCOMING EVENTS',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32.0,
                  ),
                ),
                Icon(
                  Icons.calendar_month,
                  size: 48.0,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Custom Header Section
          Container(
            padding: const EdgeInsets.all(8.0),
            color: const Color(0xFF01013B),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  12, // Generate 12 cards
                  (index) {
                    return Card(
                      margin: const EdgeInsets.symmetric(horizontal: 8.0),
                      color: currentMonth - 1 == index
                          ? Colors.white
                          : const Color.fromARGB(255, 100, 95, 122),
                      child: Container(
                        width: 100,
                        height: 120,
                        alignment: Alignment.center,
                        child: Text(
                          months[index],
                          style: TextStyle(
                            color: currentMonth - 1 == index
                                ? const Color.fromARGB(255, 1, 1, 59)
                                : Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          // Main Content Section
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: List.generate(
                  events.length,
                  (index) {
                    final event = events[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      color: const Color(0xFFEEEEEF),
                      child: Container(
                        width: screenWidth * 0.99,
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              event['EVENT NAME'],
                              style: const TextStyle(
                                color: Color(0xFF02023C),
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const Divider(
                              color: Color(0xFF676565),
                              thickness: 2,
                              indent: 40,
                              endIndent: 40,
                            ),
                            Text(
                              event['DEPARTMENT NAME'],
                              style: const TextStyle(
                                color: Color(0xFF2A1B7A),
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text(
                                event['Content'],
                                style: const TextStyle(
                                  color: Color(0xFF1D0303),
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const Divider(
                              color: Color(0xFF676565),
                              thickness: 2,
                              indent: 40,
                              endIndent: 40,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'VENUE: ${event['VENUE']}',
                                  style: const TextStyle(
                                    color: Color(0xFF2A1B7A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  'TIMINGS: ${event['Timings']}',
                                  style: const TextStyle(
                                    color: Color(0xFF2A1B7A),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'DATE: ${event['Date']}',
                              style: const TextStyle(
                                color: Color(0xFF2A1B7A),
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
