import 'package:flutter/material.dart';

import '../app-settings/api_endpoints.dart';
import '../cubit/entiry_action/entity_cubit.dart';
import '../framework/models/ActionDef.dart';
import '../framework/models/ApiResponseDataAndConfig.dart';
import '../framework/widgets/dialogs.dart';
import '../framework/widgets/widget-factory.dart';

class EntityActionForm extends StatefulWidget {
  final  ActionDef actionDef;
  const EntityActionForm(this.actionDef ,{Key? key}) : super(key: key);

  @override
  EntityActionFormState createState() => EntityActionFormState();
}

class EntityActionFormState extends State<EntityActionForm> {

  late ActionDef actionDef;

  final GlobalKey<FormState> _key = GlobalKey();
  late EntityCubit cubit;
  late ApiResponseDataAndConfig response;
  late Map<String, dynamic> initialData = <String, dynamic>{} ;


  @override
  void initState() {
    cubit = EntityCubit();
    actionDef = widget.actionDef;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: FutureBuilder<ApiResponseDataAndConfig>(
          future: getInitialData(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              response = snapshot.data!;
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

  Future<ApiResponseDataAndConfig> getInitialData() {
    String endPoint = APIEndPoints.getActionConfigAndDataEndPoint(actionDef.entityType, actionDef.actionType,actionDef.actionContext);
    return cubit.getConfigAndData(endPoint, actionDef.dataInitial);
  }



    Widget getUiSafeArea(ApiResponseDataAndConfig response ) {

      return SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            WidgetFactory.getAppBar(context, APIEndPoints.getActionTitle(actionDef.entityType,actionDef.actionType)),
            Text( response.config.uiDef.heading),
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
