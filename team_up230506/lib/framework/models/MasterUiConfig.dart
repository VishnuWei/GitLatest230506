import 'package:json_annotation/json_annotation.dart';
part 'MasterUiConfig.g.dart';

@JsonSerializable()
class MasterUiConfig{

  String uid = "";
  UiDef uiDef = UiDef();
  MasterUiConfig();
  factory MasterUiConfig.fromJson(Map<String, dynamic> json) => _$MasterUiConfigFromJson(json);
  Map<String, dynamic> toJson() => _$MasterUiConfigToJson(this);

}


@JsonSerializable()
class UiDef{
  String heading="";
  List<UiFieldDef> uiFieldDefs = <UiFieldDef>[] ;
  List<UiActionDef> uiActionDefs = <UiActionDef>[] ;
  List<UiActionDef> uiActionLinkDefs = <UiActionDef>[] ;

  List<UiDef> childListDefs = <UiDef>[] ;

  UiDef();
  factory UiDef.fromJson(Map<String, dynamic> json) => _$UiDefFromJson(json);
  Map<String, dynamic> toJson() => _$UiDefToJson(this);
}



@JsonSerializable()
class UiFieldDef{

  String? fieldName;
  String? hint;
  String? displayLabel;
  dynamic value;
  String? dataType;
  String? validationRegEx;
  String? widgetType;
  List<String>  optionsList = <String>[];
  UiFieldDef();

  factory UiFieldDef.fromJson(Map<String, dynamic> json) => _$UiFieldDefFromJson(json);
  Map<String, dynamic> toJson() => _$UiFieldDefToJson(this);
}

@JsonSerializable()
class UiActionDef{
  String? hint;
  String? displayLabel;
  String? action;
  UiActionDef();
  factory UiActionDef.fromJson(Map<String, dynamic> json) => _$UiActionDefFromJson(json);
  Map<String, dynamic> toJson() => _$UiActionDefToJson(this);
}
