// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Session _$SessionFromJson(Map<String, dynamic> json) {
  return Session()
    ..UiniqueCode = json['UiniqueCode'] as String?
    ..defaultFeedTypes = (json['defaultFeedTypes'] as List<dynamic>)
        .map((e) => e as String)
        .toList()
    ..allowedMenuActions = (json['allowedMenuActions'] as List<dynamic>)
        .map((e) => e as String)
        .toList()
    ..allowedPostTypes = (json['allowedPostTypes'] as List<dynamic>)
        .map((e) => e as String)
        .toList()
    ..allowedEventTypes = (json['allowedEventTypes'] as List<dynamic>)
        .map((e) => e as String)
        .toList()
    ..allowedTeamTypes = (json['allowedTeamTypes'] as List<dynamic>)
        .map((e) => e as String)
        .toList();
}

Map<String, dynamic> _$SessionToJson(Session instance) => <String, dynamic>{
      'UiniqueCode': instance.UiniqueCode,
      'defaultFeedTypes': instance.defaultFeedTypes,
      'allowedMenuActions': instance.allowedMenuActions,
      'allowedPostTypes': instance.allowedPostTypes,
      'allowedEventTypes': instance.allowedEventTypes,
      'allowedTeamTypes': instance.allowedTeamTypes,
    };
