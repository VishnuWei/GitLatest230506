import 'package:flutter/material.dart';

import '../app-settings/api_endpoints.dart';
import '../app-settings/app_router.dart';
import '../cubit/entiry_action/entity_cubit.dart';
import '../framework/api_helper.dart';
import '../framework/models/ActionDef.dart';
import '../framework/models/ApiResponseSearchResult.dart';
import '../framework/models/search_request.dart';
import '../framework/widgets/dialogs.dart';
import '../framework/widgets/widget-factory.dart';
import 'entity_view_form.dart';



class EntityListForm extends StatefulWidget {

  final ActionDef actionDef;


  const EntityListForm(this.actionDef  ,{Key? key}) : super(key: key);

  @override
  EntityListFormState createState() => EntityListFormState();
}

class EntityListFormState extends State<EntityListForm> {
  final GlobalKey<FormState> _key = GlobalKey();
  late EntityCubit cubit;

  late ActionDef actionDef;


  late ApiResponseSearchResult response;
  late PageableSearchRequest searchRequest = PageableSearchRequest();
  late String apiEndPoint;
  @override
  void initState() {
    cubit = EntityCubit();
    actionDef = widget.actionDef;
    apiEndPoint = APIEndPoints.getFindItemsEndPoint(actionDef.entityType,  actionDef.actionContext);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<dynamic>(
          future:  ApiHelper.callApi(apiEndPoint, searchRequest),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
                response = ApiResponseSearchResult.fromJson(snapshot.data!);
                return WidgetFactory.getItemListView(response, onItemTap, onMoreTap);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return Center(
              child: Dialogs.getLoadingIndicator(),
            );
          },
        ));
  }

  void  onItemTap(Map<String, dynamic> item) {
    String newContext = actionDef.actionContext + "->View Details";
    ActionDef viewDetailsActionDef = ActionDef(item["type"], ActionType.viewDetails, newContext,item);
    AppRouter.navigateToWidget(context, EntityViewForm(viewDetailsActionDef), false);
  }
  void  onMoreTap() {
  }
}