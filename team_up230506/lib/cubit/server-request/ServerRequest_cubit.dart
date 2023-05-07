import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../framework/api_helper.dart';
import '../../framework/models/ApiResponseBase.dart';

part  'ServerRequestState.dart';



class ServerRequestCubit<T extends ApiResponseBase> extends Cubit<ServerRequestState> {

  ServerRequestCubit(): super(ServerRequestInitial<T>());

  Future<void> loadRequest(String endPoint, String context, dynamic reqParams, {bool authRequired=true}) async {
    emit(LoadingRequest());

    endPoint = endPoint + ( context.isNotEmpty? ("/" + context):"");
    var response = await ApiHelper.callApi(endPoint,reqParams,  authRequired:authRequired);
    ApiResponseBase apiResponse = ApiResponseBase.fromJson(response);
    if (apiResponse.apiStatus == "OK") {
      emit(RequestSuccess(apiResponse));
    } else {
      emit(RequestFailed(apiResponse.message));
    }
  }
}
