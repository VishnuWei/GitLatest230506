import 'package:flutter/material.dart';

import '../app-settings/api_endpoints.dart';
import '../cubit/entiry_action/entity_cubit.dart';
import '../framework/api_helper.dart';
import '../framework/models/ActionDef.dart';
import '../framework/models/ApiResponseDataAndConfig.dart';
import '../framework/widgets/dialogs.dart';
import '../framework/widgets/widget-factory.dart';

class EntityViewForm extends StatefulWidget {
  final  ActionDef actionDef;
  const EntityViewForm(this.actionDef ,{Key? key}) : super(key: key);

  @override
  EntityViewFormState createState() => EntityViewFormState();
}

class EntityViewFormState extends State<EntityViewForm> {

  late ActionDef actionDef;

  final GlobalKey<FormState> _key = GlobalKey();
  late EntityCubit cubit;
  late ApiResponseDataAndConfig response;
  late String endPoint ;

  @override
  void initState() {
    cubit = EntityCubit();
    actionDef = widget.actionDef;
    endPoint = APIEndPoints.getActionConfigAndDataEndPoint(actionDef.entityType, actionDef.actionType, actionDef.actionContext);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: FutureBuilder<dynamic>(
          future: ApiHelper.callApi(endPoint, actionDef.dataInitial),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              response = ApiResponseDataAndConfig.fromJson(snapshot.data!);
              return getUiSafeArea(response);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return Center(
              child: Dialogs.getLoadingIndicator(),
            );
          },
        )
    );
  }




    Widget getUiSafeArea(ApiResponseDataAndConfig response ) {
    String actionTitle =  actionDef.actionContext + "\n" + APIEndPoints.getActionTitle(actionDef.entityType, actionDef.actionType);
      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            WidgetFactory.getAppBar(context, actionTitle),
            Text( response.config.uid + "\n"+ response.config.uiDef.heading),
            Column(children: WidgetFactory.getFormFromFieldDefs(response.config.uiDef.uiFieldDefs, response.item, context) ),
            const SizedBox( height: 40.0, ),
            Row(children: WidgetFactory.getFormFromActionsDefs(response.config.uiDef.uiActionDefs, onActionTap) ),
            const SizedBox( height: 40.0, ),
            Row(children: WidgetFactory.getFormActionLinksFromUiConfig(response.config.uiDef.uiActionLinkDefs, onActionLinkTap) )
          ],
        ),
      );
    }

    void  onActionTap(String actionTapped) {
      cubit.executeAction(APIEndPoints.getActionEndPoint(actionDef.entityType, actionDef.actionType, actionDef.actionContext), response.item);
    }

    void  onActionLinkTap(String actionTapped) {
      Dialogs.showCloseableDialog(context, AlertType.info, "Action Link Clicked", actionTapped);
    }

  }
