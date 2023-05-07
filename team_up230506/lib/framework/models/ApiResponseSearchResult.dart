import 'package:json_annotation/json_annotation.dart';

import 'MasterUiConfig.dart';

part 'ApiResponseSearchResult.g.dart';

@JsonSerializable()
class ApiResponseSearchResult {
  String apiStatus = "NOT OK";
  String message = "Something went wrong";


  int? itemStart;
  int? itemEnd;
  int? totalFound;
  List<Map<String, dynamic>> items = [];
  MasterUiConfig searchConfig = MasterUiConfig() ;
  MasterUiConfig listViewConfig = MasterUiConfig() ;

  bool isOK() {
    return  apiStatus == "OK";
  }
  ApiResponseSearchResult();

  factory ApiResponseSearchResult.fromJson(Map<String, dynamic> json) => _$ApiResponseSearchResultFromJson(json);

  Map<String, dynamic> toJson() => _$ApiResponseSearchResultToJson(this);
}

