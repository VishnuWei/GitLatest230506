import 'package:flutter/material.dart';

class NotificationsTabView extends StatefulWidget {
  const NotificationsTabView({Key? key}) : super(key: key);

  @override
  _NotificationsTabViewState createState() => _NotificationsTabViewState();
}

class _NotificationsTabViewState extends State<NotificationsTabView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text("No Notifications Yet"),),
    );
  }
}
