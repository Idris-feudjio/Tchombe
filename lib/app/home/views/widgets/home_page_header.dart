import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tchombe/themes/tchombe_sizes.dart';

class HomePageHeader extends StatefulWidget {
  @override
  _HomePageHeaderState createState() => _HomePageHeaderState();
}

class _HomePageHeaderState extends State<HomePageHeader> {
  DateTime? _selectedDay;
  DateTime? _focusedDay;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SliverToBoxAdapter(
      child: Container(
        height: 150,
        width: double.infinity,
        child: Card(
          elevation: elevationA,
          color: Colors.teal[50],
          child: TableCalendar(
            firstDay: DateTime.utc(1900, 01, 01),
            lastDay: DateTime.utc(2050, 12, 31),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
            calendarFormat: CalendarFormat.week,
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
        ),
      ),
    );
  }
}
