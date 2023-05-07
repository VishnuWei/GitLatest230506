import 'dart:async';
import 'package:flutter/material.dart';

import '../../../app-settings/Styles.dart';
import '../../../pages/auth_signin_form.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 2),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => const SigninForm())));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Styles.primaryBGColor,
      body: Center(
        child: Text(
          "Team\nUp!",
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