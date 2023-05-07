import 'package:flutter/material.dart';

import '../../../app-settings/app-json-ui.dart';
import '../../../app-settings/app_router.dart';
import '../../../framework/widgets/widget-factory.dart';

class FeedPageView extends StatefulWidget {
  const FeedPageView({Key? key}) : super(key: key);
  @override
  FeedPageViewState createState() => FeedPageViewState();
}

class FeedPageViewState extends State<FeedPageView> {
  Map<String, dynamic> formData = {
    "Feeds": <String>[],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 25, 0, 0),
              child: Container(
                width: 100,
                height: 285.6,
                decoration: BoxDecoration(
                  color: Theme.of(context).dividerColor,
                  borderRadius: BorderRadius.circular(50),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.feeds, formData, context)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
