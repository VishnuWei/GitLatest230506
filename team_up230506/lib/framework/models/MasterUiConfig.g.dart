// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MasterUiConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasterUiConfig _$MasterUiConfigFromJson(Map<String, dynamic> json) {
  return MasterUiConfig()
    ..uid = json['uid'] as String
    ..uiDef = UiDef.fromJson(json['uiDef'] as Map<String, dynamic>);
}

Map<String, dynamic> _$MasterUiConfigToJson(MasterUiConfig instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'uiDef': instance.uiDef,
    };

UiDef _$UiDefFromJson(Map<String, dynamic> json) {
  return UiDef()
    ..heading = json['heading'] as String
    ..uiFieldDefs = (json['uiFieldDefs'] as List<dynamic>)
        .map((e) => UiFieldDef.fromJson(e as Map<String, dynamic>))
        .toList()
    ..uiActionDefs = (json['uiActionDefs'] as List<dynamic>)
        .map((e) => UiActionDef.fromJson(e as Map<String, dynamic>))
        .toList()
    ..uiActionLinkDefs = (json['uiActionLinkDefs'] as List<dynamic>)
        .map((e) => UiActionDef.fromJson(e as Map<String, dynamic>))
        .toList()
    ..childListDefs = (json['childListDefs'] as List<dynamic>)
        .map((e) => UiDef.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$UiDefToJson(UiDef instance) => <String, dynamic>{
      'heading': instance.heading,
      'uiFieldDefs': instance.uiFieldDefs,
      'uiActionDefs': instance.uiActionDefs,
      'uiActionLinkDefs': instance.uiActionLinkDefs,
      'childListDefs': instance.childListDefs,
    };

UiFieldDef _$UiFieldDefFromJson(Map<String, dynamic> json) {
  return UiFieldDef()
    ..fieldName = json['fieldName'] as String?
    ..hint = json['hint'] as String?
    ..displayLabel = json['displayLabel'] as String?
    ..value = json['value']
    ..dataType = json['dataType'] as String?
    ..validationRegEx = json['validationRegEx'] as String?
    ..widgetType = json['widgetType'] as String?
    ..optionsList =
        (json['optionsList'] as List<dynamic>).map((e) => e as String).toList();
}

Map<String, dynamic> _$UiFieldDefToJson(UiFieldDef instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'hint': instance.hint,
      'displayLabel': instance.displayLabel,
      'value': instance.value,
      'dataType': instance.dataType,
      'validationRegEx': instance.validationRegEx,
      'widgetType': instance.widgetType,
      'optionsList': instance.optionsList,
    };

UiActionDef _$UiActionDefFromJson(Map<String, dynamic> json) {
  return UiActionDef()
    ..hint = json['hint'] as String?
    ..displayLabel = json['displayLabel'] as String?
    ..action = json['action'] as String?;
}

Map<String, dynamic> _$UiActionDefToJson(UiActionDef instance) =>
    <String, dynamic>{
      'hint': instance.hint,
      'displayLabel': instance.displayLabel,
      'action': instance.action,
    };
