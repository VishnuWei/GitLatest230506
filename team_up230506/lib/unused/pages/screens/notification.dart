import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../app-settings/UiTexts.dart';
import '../../../../../app-settings/app-json-ui.dart';
import '../../../../../app-settings/app_router.dart';
import '../../../framework/widgets/widget-factory.dart';

class NotificationPageView extends StatefulWidget {
  const NotificationPageView({Key? key}) : super(key: key);
  @override
  _NotificationPageViewState createState() => _NotificationPageViewState();
}

class _NotificationPageViewState extends State<NotificationPageView> {
  Map<String, dynamic> formData = {
    "Feeds": <String>[],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.notifications, formData, context)),
          ],
        ));
  }

}
