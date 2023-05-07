import 'package:enum_to_string/enum_to_string.dart';


class EntityType {
  static String  Post = "Post";
  static String  Profile= "Profile";
  static String  Team= "Team";
  static String   Event= "Event";
  static String   Membership= "Membership";
  static String   Feed= "Feed";
}
enum ActionType {create,delete,update,findItems, viewDetails}


enum EntityRequest{ getCreateConfigAndData, getDeleteConfigAndData, getUpdateConfigAndData,
  getItemDetailsAndDetailsViewConfig, getItemListAndViewConfig,
  create, update, delete}


class APIEndPoints {
  static const String baseUrl =  "http://localhost:9000/";
  //static String baseUrl =  "http://dev.team-up.live/" ;

  static const String authBase = baseUrl +  "auth";
  static const String signup =  authBase + "/signup";
  static const String signin = authBase +  "/signin";
  static const String forgotPassword = authBase +  "/forgot-password/request";
  static const String forgotPasswordVerify = authBase +  "/forgot-password/verify";
  static const String changePassword = authBase +  "/changePassword";
  static const String eventcreate = "event" +  "/create";

  /*
  static const String profileBase = baseUrl +  "/typed-entity/profile";
  static const String profileCreate = profileBase +  "/create";
  static const String profileUpdate = profileBase +  "/update";
  static const String profileGetCreateDataAndConfig = profileBase +  "/getUpdateDataAndConfig";
  static const String profileGetUpdateDataAndConfig = profileBase +  "/getCreateDataAndConfig";
  static const String profileFindItem = profileBase +  "/findItem";
  static const String profileFindItems = profileBase +  "/findItems";
*/
  static   String getActionConfigAndDataEndPoint(  String entityType,
      ActionType actionType, String actionContext) {
    String mainEntityType = getMainType(entityType);

    return baseUrl
        +  mainEntityType
        + "/getDataAndConfig"
        + "/" +  EnumToString.convertToString(actionType)
        + "/" + entityType
        + "/" + actionContext;
  }


  static List<String> genericEntities = ["Post","Profile","Team","Event", "Feed"];





  static String getFindItemsEndPoint( String entityType, String actionContext) {
    String mainEntityType = getMainType(entityType);

    return baseUrl
        + mainEntityType
        + "/findItems"
        + "/" + entityType
        + "/" + actionContext;
  }

  static String getActionEndPoint( String entityType,
      ActionType actionType, String actionContext)
  {
    String mainEntityType = getMainType(entityType);
    return baseUrl
        +  mainEntityType
        + "/" +  EnumToString.convertToString(actionType)
        + "/" + entityType
        + "/" + actionContext ;
  }


  static   String getMainType( String entityType) {
    if (genericEntities.contains(entityType)) {
      return "TypedEntity";
    }
    return EnumToString.convertToString(entityType);
  }

  static String getActionTitle( String entityType, ActionType actionType) {
    return EnumToString.convertToString(actionType)
        + " " +  entityType;

  }

}
//add location -> google location