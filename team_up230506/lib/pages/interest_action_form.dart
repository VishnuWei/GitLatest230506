import 'package:flutter/material.dart';

import '../app-settings/UiTexts.dart';
import '../app-settings/app-json-ui.dart';
import '../app-settings/app_router.dart';
import '../framework/widgets/widget-factory.dart';

class Interests extends StatefulWidget {
  const Interests({Key? key}) : super(key: key);
  @override
  InterestsState createState() => InterestsState();
}

class InterestsState extends State<Interests> {
  Map<String, dynamic> formData = {
    "Interest": <String>[],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:<Widget>[
            Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.interests, formData, context)),
            Container( padding: WidgetFactory.buttonEdgeInserts, child: WidgetFactory.getInkWellButton(UiTexts.next, onNextTap)),
          ],
        ),
    );
  }

  void  onNextTap(String text) {
    AppRouter.navigate(context, AppScreen.home, true);
  }

}
