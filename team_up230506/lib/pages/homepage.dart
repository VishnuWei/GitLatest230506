import 'package:flutter/material.dart';
import '../app-settings/Styles.dart';
import '../app-settings/UiTexts.dart';
import '../app-settings/api_endpoints.dart';
import '../app-settings/app_router.dart';
import '../framework/models/ActionDef.dart';
import '../framework/widgets/widget-factory.dart';
import '../unused/pages/profile/my_profile_tabview.dart';
import '../unused/pages/screens/clan_overview.dart';
import '../unused/pages/screens/event_list.dart';
import '../unused/pages/screens/feed_screen.dart';
import '../unused/pages/screens/notification.dart';
import '../unused/pages/screens/search_screen.dart';
import 'entity_action_form.dart';
import 'entity_list_form.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> with TickerProviderStateMixin {

  int _currentIndex = 0;
  final screens = [
    const FeedPageView(),
    const SearchPageView(),
    const EventList(),
    const NotificationPageView(),
    const ClanOverview(),
  ];
  String actionContext = "Home";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: WidgetFactory.getAppBarShape(),
        title: WidgetFactory.getHomeTitleText("TeamUp"),
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ProfileTabView()));
              },
              child: const Icon(Icons.account_circle_rounded)),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: PopupMenuButton<String>(
              color: Styles.primaryColor,
              onSelected: (item) => onSelected(context, item),
              itemBuilder: (context) => [
                WidgetFactory.getMenuItem(UiTexts.newPost),
                WidgetFactory.getMenuItem(UiTexts.newTeam),
                WidgetFactory.getMenuItem(UiTexts.newEvent),
                const PopupMenuDivider(),
                WidgetFactory.getMenuItem(UiTexts.signOut)
              ],
            ),
          )
        ],
      ),
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.feed_outlined),
            label: 'Feed',
            backgroundColor: Colors.grey,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label: 'Events',
            backgroundColor: Colors.greenAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notification',
            backgroundColor: Colors.pink,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.groups_rounded),
            label: 'Groups',
            backgroundColor: Colors.amber,
          ),
        ],
      ),
    );
  }

  void onSelected(BuildContext context, String text) {
    if (text == UiTexts.signOut) {
      AppRouter.navigate(context, AppScreen.signin, true);
    } else if (text == UiTexts.newPost) {
      AppRouter.navigateToWidget(
          context, getEntityActionForm(EntityType.Post), false);
    } else if (text == UiTexts.newEvent) {
      AppRouter.navigateToWidget(
          context, getEntityActionForm(EntityType.Event), false);
    } else if (text == UiTexts.newTeam) {
      AppRouter.navigateToWidget(
          context, getEntityActionForm(EntityType.Team), false);
    }
  }

  EntityListForm getEntityListForm(String type) {
    String newContext = "Home->$type";
    ActionDef viewDetailsActionDef =
    ActionDef(type, ActionType.findItems, newContext, {});
    return EntityListForm(viewDetailsActionDef);
  }

  EntityActionForm getEntityActionForm(String type) {
    String newContext = "Home->$type";
    ActionDef viewDetailsActionDef =
    ActionDef(type, ActionType.create, newContext, {});
    return EntityActionForm(viewDetailsActionDef);
  }
}