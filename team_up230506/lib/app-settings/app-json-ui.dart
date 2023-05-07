
import '../framework/models/MasterUiConfig.dart';

class AppJsonUi {

  static   List<UiFieldDef> signin =
  [
    UiFieldDef.fromJson({
      "fieldName":"phoneNumber",
      "hint":"Phone Number",
      "displayLabel" :"Phone Number",
      "dataType":"String",
      "validationRegEx" :"phoneNumber",
      "optionsList": [],
      "widgetType" :"NumBox"}),
    UiFieldDef.fromJson( {
      "fieldName":"password",
      "hint" :"Password",
      "displayLabel" :"Password",

      "dataType" :"String",
      "validationRegEx" :"password",
      "optionsList": [],
      "widgetType" :"Password"}),
  ];

  static   List<UiFieldDef> signup =
  [
    UiFieldDef.fromJson({
      "fieldName":"First Name",
      "hint":"First Name",
      "displayLabel" :"First Name",

      "dataType" :"String",
      "validationRegEx" :"FirstName",
      "widgetType" :"TextBox",
      "optionsList": [],
    }
    ),
    UiFieldDef.fromJson({
      "fieldName":"Last Name",
      "hint":"Last Name",
      "displayLabel" :"Last Name",

      "dataType" :"String",
      "validationRegEx" :"LastName",
      "widgetType" :"TextBox",
      "optionsList": [],
    }
    ),
    UiFieldDef.fromJson(  {
      "fieldName":"phoneNumber",
      "hint" :"Phone Number",
      "displayLabel" :"Phone Number",

      "dataType" :"String",
      "validationRegEx" :"phoneNumber",
      "widgetType" :"NumBox",
      "optionsList": [],
    }  ),
    UiFieldDef.fromJson( {
      "fieldName":"password",
      "hint" :"Password",
      "displayLabel" :"Password",

      "dataType" :"String",
      "validationRegEx" :"password",
      "widgetType" :"Password",
      "optionsList": []
    }  ),
    UiFieldDef.fromJson( {
      "fieldName":"confirmPassword",
      "hint" :"Confirm Password",
      "displayLabel" :"Confirm Password",

      "dataType" :"String",
      "validationRegEx" :"password",
      "widgetType" :"Password",
      "optionsList": []
    }  ),


  ];

  static const   List<Map<String,dynamic>> forgotPassword =
  [
    {
      "fieldName":"phoneNumber",
      "hint" :"Phone Number",
      "displayLabel" :"Phone Number",

      "dataType" :"String",
      "validationRegEx" :"phoneNumber",
      "widgetType" :"TextBox",
      "optionsList": []
    }
  ];



  static List<UiFieldDef> interests =
  [
    UiFieldDef.fromJson({
      "fieldName":"Interest",
      "hint" :"Interest",
      "displayLabel" :"Interest",

      "dataType" :"String",
      "validationRegEx" :"password",
      "widgetType" :"Checkbox",
      "optionsList": ["Football",
        "Basketball",
        "Hockey",
        "Cricket",
        "Volleyball",
        "E-Sports"]
    }  ),
  ];



  static List<UiFieldDef> eventCreate =
  [
    UiFieldDef.fromJson({
      "fieldName":"Media",
      "hint":"Upload Media",
      "displayLabel" :"Upload Media",

      "dataType" :"Media",
      "validationRegEx" :"UploadMedia",
      "widgetType" :"UploadMedia",
      "optionsList": [],
    }
    ),
    UiFieldDef.fromJson({
      "fieldName":"Title",
      "hint":"Title",
      "displayLabel" :"Title",

      "dataType" :"String",
      "validationRegEx" :"Title",
      "widgetType" :"TextBox",
      "optionsList": [],
    }
    ),
    UiFieldDef.fromJson({
      "fieldName":"Description",
      "hint":"Description",
      "displayLabel" :"Description",

      "dataType" :"String",
      "validationRegEx" :"Description",
      "widgetType" :"Description",
      "optionsList": [],
    }
    ),
  ];

  static List<UiFieldDef> eventCreate1 =
  [
    UiFieldDef.fromJson({
      "fieldName":"Participants",
      "hint":"Participants",
      "displayLabel" :"Participants",

      "dataType" :"String",
      "validationRegEx" :"Participants",
      "widgetType" :"NumberSelect",
      "optionsList": [],
    }
    ),
    UiFieldDef.fromJson({
      "fieldName":"DateTime",
      "hint":"DateTimePicker",
      "displayLabel" :"Date",

      "dataType" :"String",
      "validationRegEx" :"Date",
      "widgetType" :"DateTimePicker",
      "optionsList": [],
    }
    ),
  ];


  static List<UiFieldDef> eventCreate2 =
  [

    UiFieldDef.fromJson({
      "fieldName":"Location",
      "hint":"Location",
      "displayLabel" :"Location",

      "dataType" :"String",
      "validationRegEx" :"Location",
      "widgetType" :"TextBox",
      "optionsList": [],
    }
    ),
    UiFieldDef.fromJson({
      "fieldName":"PrizeMoney",
      "hint":"Prize Money",
      "displayLabel" :"Money",

      "dataType" :"Number",
      "validationRegEx" :"Money",
      "widgetType" :"NumBox",
      "optionsList": [],
    }
    ),

    UiFieldDef.fromJson({
      "fieldName":"EntryFee",
      "hint":"Entry Fee",
      "displayLabel" :"EntryFee",

      "dataType" :"Number",
      "validationRegEx" :"EntryFee",
      "widgetType" :"NumBox",
      "optionsList": [],
    }
    ),

    UiFieldDef.fromJson({
      "fieldName":"Participate Yourself",
      "hint":"Participate Yourself",
      "displayLabel" :"Participate Yourself",

      "dataType" :"String",
      "validationRegEx" :"Participate Yourself",
      "widgetType" :"Participate",
      "optionsList": [],
    }
    ),
  ];

  static List<UiFieldDef> feeds =
  [
    UiFieldDef.fromJson({
      "fieldName":"Username",
      "hint":"Username",
      "displayLabel" :"Username",

      "dataType" :"String",
      "validationRegEx" :"Username",
      "widgetType" :"Username",
      "optionsList": [],
    }
    ),
    UiFieldDef.fromJson({
      "fieldName":"Preview",
      "hint":"Preview",
      "displayLabel" :"Preview",

      "dataType" :"Media",
      "validationRegEx" :"Preview",
      "widgetType" :"Display",
      "optionsList": [],
    }
    ),
    UiFieldDef.fromJson({
      "fieldName":"ShowMore",
      "hint":"ShowMore",
      "displayLabel" :"ShowMore",

      "dataType" :"String",
      "validationRegEx" :"ShowMore",
      "widgetType" :"ShowMore",
      "optionsList": [],
    }
    ),
  ];

  static List<UiFieldDef> events =
  [
    UiFieldDef.fromJson({
      "fieldName":"Events",
      "hint":"Events",
      "displayLabel" :"Events",

      "dataType" :"String",
      "validationRegEx" :"Events",
      "widgetType" :"TextBox",
      "optionsList": [],
    }
    ),
  ];

  static List<UiFieldDef> eventDetails =
  [
    UiFieldDef.fromJson({
      "fieldName":"Events",
      "hint":"Events",
      "displayLabel" :"Events",

      "dataType" :"String",
      "validationRegEx" :"Events",
      "widgetType" :"TextBox",
      "optionsList": [],
    }
    ),
  ];

  static List<UiFieldDef> notifications =
  [
    UiFieldDef.fromJson({
      "fieldName":"Notification",
      "hint":"Notification",
      "displayLabel" :"Notification",

      "dataType" :"String",
      "validationRegEx" :"Notification",
      "widgetType" :"TextBox",
      "optionsList": [],
    }
    ),
  ];

  static List<UiFieldDef> clanpart1 =
  [
    UiFieldDef.fromJson({
      "fieldName":"Create a Clan",
      "hint":"Create a Clan",
      "displayLabel" :"Create a Clan",

      "dataType" :"Create Button",
      "validationRegEx" :"CreateClan",
      "widgetType" :"Button",
      "optionsList": [],
    }
    ),

    UiFieldDef.fromJson({
      "fieldName":"My Clan",
      "hint":"My Clan",
      "displayLabel" :"My Clan",

      "dataType" :"Group Button",
      "validationRegEx" :"MyClan",
      "widgetType" :"Button",
      "optionsList": [],
    }
    ),

  ];

  static List<UiFieldDef> clanpart2 =
  [
    UiFieldDef.fromJson({
      "fieldName":"Clan Rankings",
      "hint":"Clan Rankings",
      "displayLabel" :"Clan Rankings",

      "dataType" :"String",
      "validationRegEx" :"Clan Rankings",
      "widgetType" :"Ranking",
      "optionsList": [],
    }
    ),

  ];

  static const   List<Map<String,dynamic>> createTeam =
  [
    {
      "fieldName":"Title",
      "hint" :"Title",
      "displayLabel" :"Title",
      "dataType" :"String",
      "validationRegEx" :"Title",
      "widgetType" :"TextBox",
      "optionsList": []
    },
    {
      "fieldName":"phoneNumber",
      "hint" :"Phone Number",
      "displayLabel" :"Phone Number",
      "dataType" :"String",
      "validationRegEx" :"phoneNumber",
      "widgetType" :"TextBox",
      "optionsList": []
    },
    {
      "fieldName":"phoneNumber",
      "hint" :"Phone Number",
      "displayLabel" :"Phone Number",
      "dataType" :"String",
      "validationRegEx" :"phoneNumber",
      "widgetType" :"TextBox",
      "optionsList": []
    },
    {
      "fieldName":"phoneNumber",
      "hint" :"Phone Number",
      "displayLabel" :"Phone Number",
      "dataType" :"String",
      "validationRegEx" :"phoneNumber",
      "widgetType" :"TextBox",
      "optionsList": []
    }
  ];
}
