// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiResponseSearchResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseSearchResult _$ApiResponseSearchResultFromJson(
    Map<String, dynamic> json) {
  return ApiResponseSearchResult()
    ..apiStatus = json['apiStatus'] as String
    ..message = json['message'] as String
    ..itemStart = json['itemStart'] as int?
    ..itemEnd = json['itemEnd'] as int?
    ..totalFound = json['totalFound'] as int?
    ..items = (json['items'] as List<dynamic>)
        .map((e) => e as Map<String, dynamic>)
        .toList()
    ..searchConfig =
        MasterUiConfig.fromJson(json['searchConfig'] as Map<String, dynamic>)
    ..listViewConfig =
        MasterUiConfig.fromJson(json['listViewConfig'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ApiResponseSearchResultToJson(
        ApiResponseSearchResult instance) =>
    <String, dynamic>{
      'apiStatus': instance.apiStatus,
      'message': instance.message,
      'itemStart': instance.itemStart,
      'itemEnd': instance.itemEnd,
      'totalFound': instance.totalFound,
      'items': instance.items,
      'searchConfig': instance.searchConfig,
      'listViewConfig': instance.listViewConfig,
    };
