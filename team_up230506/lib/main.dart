import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './pages/auth_signin_form.dart';

import 'app-settings/Styles.dart';





void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // testing git push - Divya
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TeamUp',
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),

      theme: ThemeData(
         // colorScheme: ColorScheme.fromSwatch(primarySwatch:createMaterialColor(Styles.buttonColor)),
        textTheme: GoogleFonts.ralewayTextTheme(),

        inputDecorationTheme: const InputDecorationTheme(
          focusedBorder:OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color:Styles.buttonColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              borderSide: BorderSide(color: Colors.white)),
          filled: true,
          contentPadding:
          EdgeInsets.only(bottom: 10.0, left: 10.0, right: 0.0),
         // labelText: widget.title,
        ),

      ),

      home: const SigninForm(),
    );
  }
}

