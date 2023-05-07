import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../app-settings/Styles.dart';
import '../../../app-settings/UiTexts.dart';
import '../../../app-settings/api_endpoints.dart';
import '../../../app-settings/app_router.dart';
import '../../../cubit/server-request/ServerRequest_cubit.dart';
import '../../../framework/models/ActionDef.dart';
import '../../../framework/shared_preference_manager.dart';
import '../../../framework/widgets/dialogs.dart';
import '../../../framework/widgets/widget-factory.dart';
import '../../../pages/entity_action_form.dart';
import '../../../pages/entity_list_form.dart';
import '../profile/my_profile_tabview.dart';

import '../../../app-settings/app-json-ui.dart';
import 'clan_overview.dart';
import 'event_list.dart';
import 'feed_screen.dart';
import 'notification.dart';

class EventCreateForm extends StatefulWidget {
  const EventCreateForm({Key? key}) : super(key: key);
  @override
  EventCreateFormState createState() => EventCreateFormState();
}

class EventCreateFormState extends State<EventCreateForm> {
  final GlobalKey<FormState> _key = GlobalKey();
  late ServerRequestCubit cubit;

  Map<String, dynamic> formData = <String, dynamic>{} ;


  @override
  void initState() {
    cubit = ServerRequestCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (context) => cubit,
          child: BlocListener<ServerRequestCubit, ServerRequestState>(
            bloc: cubit,
            listener: (context, state) {
              if (state is LoadingRequest) {
                // Dialogs.showLoadingIndicator(context, AlertType.info, "");
              }
              if (state is RequestSuccess) {
                SharedPreferenceManager.setValue("session", state.apiResponse);
                AppRouter.navigate(context, AppScreen.events, true);
              }
              else if (state is RequestFailed) {
                Dialogs.dismiss(context);
                Dialogs.showCloseableDialog(context, AlertType.error, "Creation Failed", state.message);
              }
            },
            child:
            BlocBuilder<ServerRequestCubit, ServerRequestState>(builder: (context, state) {
              return Form(key: _key, child: getUiSafeArea());
            }),
          )),
    );
  }

  Widget getUiSafeArea() {
    return  Scaffold(
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
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(0, 10, 0, 75),
          scrollDirection: Axis.vertical,
          children: [
            Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.eventCreate, formData, context)),
            Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.eventCreate1, formData, context)),
            Column(children: WidgetFactory.getFormFromFieldDefs(AppJsonUi.eventCreate2, formData, context)),
            const SizedBox( height: 40.0, ),
            Container( padding: WidgetFactory.buttonEdgeInserts, child: WidgetFactory.getCircularButton(UiTexts.add, onCreateTap)),
          ],
        ),
      ),
    );
  }


  void onCreateTap(String text) {
    cubit.loadRequest( APIEndPoints.eventcreate, "", formData,  authRequired : true);
    AppRouter.navigate(context, AppScreen.events, true);
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
