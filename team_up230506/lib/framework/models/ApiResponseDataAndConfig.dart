import 'package:json_annotation/json_annotation.dart';

import 'MasterUiConfig.dart';

part 'ApiResponseDataAndConfig.g.dart';

@JsonSerializable()
class ApiResponseDataAndConfig  {

  String apiStatus = "NOT OK";
  Map<String, dynamic> item = <String, dynamic>{} ;
  String message = "Something went wrong";

  bool isOK() {
    return  apiStatus == "OK";
  }
  MasterUiConfig config = MasterUiConfig() ;

  ApiResponseDataAndConfig();
  factory ApiResponseDataAndConfig.fromJson(Map<String, dynamic> json) => _$ApiResponseDataAndConfigFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseDataAndConfigToJson(this);
}
