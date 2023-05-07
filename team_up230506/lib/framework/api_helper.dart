import 'dart:async';
import 'dart:io';

import '../framework/shared_preference_manager.dart';

import 'CustomException.dart';
import 'package:dio/dio.dart';

import 'models/ApiResponseSearchResult.dart';

class ApiHelper {


  static   Map<String, String> getHeaders(  bool isAuthRequired) {
    //'Content-Type':  "application/x-www-form-urlencoded",
    Map<String, String> headers = {
     'Content-Type': 'application/json; charset=utf-8',
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Headers": "*"
    };
     if (isAuthRequired) {
       var token = SharedPreferenceManager.getValue("sessionId");
       headers.addAll({'sessionId': '$token'});
     }
     return headers;
  }

/*
  static  Future<dynamic> callApi(String url, var body, bool authRequired) async
  {

    print (url);
    Map<String, String> headers = getHeaders(authRequired);

    Uri  uri = Uri.parse(url,);
    String jsonBody = json.encode(body);
    print (body);
    print (jsonBody);
    try {
      Response response = await http.post(uri,
          body: jsonBody,
          headers: headers,
          encoding: Encoding.getByName("utf-8"));

      if(response.statusCode >= 200 && response.statusCode <=300){
        print(response.body);
        print("-------------------------");
        return response.body;
      }
      throw  CustomException("Api Failure", response.statusCode,   "Something went wrong" );
    } on CustomException catch(e){
      rethrow;
    } on SocketException catch(e) {
      throw CustomException("Api Failure", 900, "No Internet connection");
    } on Exception catch(e){
      print(e);
      throw  CustomException("Api Failure", 950,  "Unknown error on processing request");
    }
  }
*/

  static ApiResponseSearchResult eventSearchResult =  ApiResponseSearchResult();

  static  Future<dynamic> callApi(String url, var data,{bool authRequired=true}) async
  {
    Dio dio =  Dio();
    Map<String, String> headers = getHeaders(authRequired);
    try {
      Response<dynamic> response = await dio.post(url,
          data: data,
          options: Options( headers: headers ));
      if(response.statusCode! >= 200 && response.statusCode! <=300){
        return response.data;
      }
      throw  CustomException("Api Failure", response.statusCode!,   "Something went wrong" );
    } on CustomException catch(e){
      rethrow;
    } on SocketException catch(e) {
      throw CustomException("Api Failure", 900, "No Internet connection");
    } on Exception catch(e){
      mockApi(url, data);
      throw  CustomException("Api Failure", 950,  "Unknown error on processing request");
    }
  }


  static  Future<ApiResponseSearchResult> getList(String url, var data,{bool authRequired=true}) async
  {
    Dio dio =  Dio();
    Map<String, String> headers = getHeaders(authRequired);
    try {
      Response<dynamic> response = await dio.post(url,
          data: data,
          options: Options( headers: headers ));
      if(response.statusCode! >= 200 && response.statusCode! <=300){
        return response.data;
      }
      throw  CustomException("Api Failure", response.statusCode!,   "Something went wrong" );
    } on CustomException catch(e){
      rethrow;
    } on SocketException catch(e) {
      throw CustomException("Api Failure", 900, "No Internet connection");
    } on Exception catch(e){
      return eventSearchResult;
      throw  CustomException("Api Failure", 950,  "Unknown error on processing request");
    }
  }
  static void  mockApi(String url, data) {
    if( url.contains("create") && url.contains("event") )
      {
        eventSearchResult.items.add(data);
      }

  }

}