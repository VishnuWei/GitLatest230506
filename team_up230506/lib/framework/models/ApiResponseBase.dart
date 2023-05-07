import 'package:json_annotation/json_annotation.dart';


part 'ApiResponseBase.g.dart';

@JsonSerializable()
class ApiResponseBase {
  String apiStatus = "NOT OK";
  Map<String, dynamic> item = <String, dynamic>{} ;
  String message = "Something went wrong";

  bool isOK() {
    return  apiStatus == "OK";
  }
  ApiResponseBase();
  factory ApiResponseBase.fromJson(Map<String, dynamic> json) => _$ApiResponseBaseFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseBaseToJson(this);
}
