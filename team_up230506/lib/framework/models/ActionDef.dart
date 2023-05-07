

import '../../app-settings/api_endpoints.dart';

class ActionDef
{
  String entityType;
  ActionType actionType;
  String actionContext;

  Map<String,dynamic> dataInitial;

  ActionDef(  this.entityType,
      this.actionType,
      this.actionContext, this.dataInitial );



}



