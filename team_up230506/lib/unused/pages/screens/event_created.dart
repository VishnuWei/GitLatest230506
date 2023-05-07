import 'dart:async';
import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';
import 'event_list.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  EventCreatedState createState() => EventCreatedState();
}

class EventCreatedState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const EventList())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Styles.primaryBGColor,
      body: Center(
        child: Text(
          "Event Created",
          style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: Styles.buttonColor),
        ),
      ),
    );
  }
}