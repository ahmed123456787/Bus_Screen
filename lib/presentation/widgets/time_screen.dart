import 'dart:async';

import 'package:flutter/material.dart';

class TimeScren extends StatefulWidget {
  const TimeScren({super.key});

  @override
  TimeScreenState createState() => TimeScreenState();
}

class TimeScreenState extends State<TimeScren> {
  String timeString = "";

  @override
  void initState() {
    super.initState();
    timeString = _formatDateTime(DateTime.now());
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getCurrentTime());
  }

  void _getCurrentTime() {
    final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime(now);
    setState(() {
      timeString = formattedDateTime;
    });
  }

  String _formatDateTime(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      double parentHeight = constraints.maxWidth;
      double textSize = parentHeight * 0.26;
      return Text(
        timeString,
        style: TextStyle(
            fontSize: textSize,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 255, 193, 0)),
      );
    });
  }
}
