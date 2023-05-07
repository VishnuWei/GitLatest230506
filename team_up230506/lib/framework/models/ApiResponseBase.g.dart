// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiResponseBase.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseBase _$ApiResponseBaseFromJson(Map<String, dynamic> json) {
  return ApiResponseBase()
    ..apiStatus = json['apiStatus'] as String
    ..item = json['item'] as Map<String, dynamic>
    ..message = json['message'] as String;
}

Map<String, dynamic> _$ApiResponseBaseToJson(ApiResponseBase instance) =>
    <String, dynamic>{
      'apiStatus': instance.apiStatus,
      'item': instance.item,
      'message': instance.message,
    };
