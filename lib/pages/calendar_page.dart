import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return CupertinoTabView(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Row(
                  children: [
                    Text("2025",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                          fontFamily: "Sf",
                          color: Color(0xffDCA23D),
                        )),
                    Icon(Icons.arrow_forward_ios,
                        color: Color(0xffDCA23D), size: 16),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _selectedDay = null;
                    });
                  },
                  child: const Text("Reset dates",
                      style: TextStyle(color: Color(0xffDCA23D))),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Image(
                    image: AssetImage("images/mdi_heart-outline.png"),
                  ),
                )
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TableCalendar(
                  firstDay: DateTime.utc(2020, 1, 1),
                  lastDay: DateTime.utc(2030, 12, 31),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                  calendarStyle: const CalendarStyle(
                    selectedDecoration: BoxDecoration(
                      color: Color(0xffDCA23D),
                      shape: BoxShape.circle,
                    ),
                    todayDecoration: BoxDecoration(
                      color: Color(0xffF2CF00),
                    ),
                  ),
                  headerStyle: const HeaderStyle(
                    formatButtonVisible: false,
                    titleCentered: true,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
