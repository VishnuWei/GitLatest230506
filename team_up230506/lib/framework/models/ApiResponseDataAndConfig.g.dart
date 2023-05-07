// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ApiResponseDataAndConfig.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponseDataAndConfig _$ApiResponseDataAndConfigFromJson(
    Map<String, dynamic> json) {
  return ApiResponseDataAndConfig()
    ..apiStatus = json['apiStatus'] as String
    ..item = json['item'] as Map<String, dynamic>
    ..message = json['message'] as String
    ..config = MasterUiConfig.fromJson(json['config'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ApiResponseDataAndConfigToJson(
        ApiResponseDataAndConfig instance) =>
    <String, dynamic>{
      'apiStatus': instance.apiStatus,
      'item': instance.item,
      'message': instance.message,
      'config': instance.config,
    };
