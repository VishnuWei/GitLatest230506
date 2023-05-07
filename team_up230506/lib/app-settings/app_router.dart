import 'package:flutter/material.dart';

import '../pages/auth_signin_form.dart';
import '../pages/auth_signup_form.dart';
import '../pages/homepage.dart';
import '../unused/pages/screens/event_create.dart';
import '../unused/pages/screens/event_list.dart';


enum AppScreen {
  signin,
  signup,
  veifyOTP,
  forgotPassword,
  passwordVerification,
  home,
  alerts,
  teams,
  events,
  profile,
  eventCreate,
}

class AppRouter {

  static Map<AppScreen, Widget> pages = {
    AppScreen.signin: const SigninForm(),
    AppScreen.signup: const SignupForm(),
    AppScreen.home: const HomePage(),
    AppScreen.events: const EventList(),
    AppScreen.eventCreate: const EventCreateForm(),
  };

  static void navigate(BuildContext context, AppScreen screen, bool root) {

    Widget? widget = pages[screen];
    if (widget == null) {
      return;
    }
    if (root) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ),
          ModalRoute.withName('/'));
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => widget,
          ));
    }
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }

  static void navigateToWidget(BuildContext context, Widget widget, bool bool) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ));
  }
}
