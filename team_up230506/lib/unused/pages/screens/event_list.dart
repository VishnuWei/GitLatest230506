import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../app-settings/app-json-ui.dart';
import '../../../../../app-settings/app_router.dart';
import '../../../framework/api_helper.dart';
import '../../../framework/models/ApiResponseSearchResult.dart';
import '../../../framework/widgets/dialogs.dart';
import '../../../framework/widgets/widget-factory.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);
  @override
  EventListState createState() => EventListState();
}

class EventListState extends State<EventList> {


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
        body:FutureBuilder<dynamic>(
          future:  ApiHelper.getList("list event", {}),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              ApiResponseSearchResult searchResult = snapshot.data!;
              return WidgetFactory.getItemListView(searchResult, onItemTap, onMoreTap);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return Center(
              child: Dialogs.getLoadingIndicator(),
            );
          },
        ),
    );


  /*  return Scaffold(
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
            Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.events, formData, context)),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
    ); */
  }

  void  onItemTap(Map<String, dynamic> item) {
    // AppRouter.navigate(context, AppScreen.eventCreate, true);
  }
  void  onMoreTap() {
  }
}


