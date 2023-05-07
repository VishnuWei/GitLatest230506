import 'package:flutter/material.dart';

import '../../../app-settings/app-json-ui.dart';
import '../../../framework/widgets/widget-factory.dart';

class ClanOverview extends StatefulWidget {
  const ClanOverview({Key? key}) : super(key: key);
  @override
  ClanOverviewState createState() => ClanOverviewState();
}

class ClanOverviewState extends State<ClanOverview> {
  Map<String, dynamic> formData = <String, dynamic>{};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
            width: 348,
            height: 255,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.amber,
            ),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 25),
              child: Row(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.clanpart1, formData, context)),
            ),
          ),
          Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.clanpart2, formData, context)),
        ],
      ),
    );
  }
}
