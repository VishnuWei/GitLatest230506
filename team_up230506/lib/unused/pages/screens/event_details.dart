import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../app-settings/UiTexts.dart';
import '../../../../../app-settings/app-json-ui.dart';
import '../../../../../app-settings/app_router.dart';
import '../../../framework/widgets/widget-factory.dart';

class EventOverViewPage extends StatefulWidget {
  const EventOverViewPage({Key? key}) : super(key: key);
  @override
  EventOverViewPageState createState() => EventOverViewPageState();
}

class EventOverViewPageState extends State<EventOverViewPage> {
  Map<String, dynamic> formData = {
    "Feeds": <String>[],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        hoverColor: Colors.transparent,
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () {
          AppRouter.navigate(context, AppScreen.eventCreate, true);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children:<Widget>[
          Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.eventDetails, formData, context)),
          const SizedBox(
            height: 50,
          ),
          Row(
            children: <Widget>[
              WidgetFactory.getInkWellTextPageNavigator(UiTexts.join,onJoinTap),
            ],
          ),        ],
      ),
    );
  }

  void onJoinTap(String text) {
    AppRouter.navigate(context, AppScreen.eventCreate, true);
  }

}
