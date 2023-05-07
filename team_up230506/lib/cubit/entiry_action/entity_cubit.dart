import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../framework/api_helper.dart';
import '../../framework/models/ApiResponseDataAndConfig.dart';
import '../../framework/models/ApiResponseSearchResult.dart';
import '../../framework/models/MasterUiConfig.dart';
import '../../framework/models/search_request.dart';

part  'entity_state.dart';




class EntityCubit extends Cubit<EntityState> {
  EntityCubit( ): super(const EntityInitialState());
  Future<void> loadConfig(String endPoint, dynamic reqParams) async {

      emit(const ConfigRequested());
      var response  = await ApiHelper.callApi(endPoint,  reqParams,  authRequired:true);

      ApiResponseDataAndConfig apiResponse =  ApiResponseDataAndConfig.fromJson(response);

    if (apiResponse.isOK()) {
      emit(ConfigRequestSuccess( apiResponse.config, apiResponse.item));
    } else {
      emit(ConfigRequestFailed( apiResponse.message));
    }

  }



  Future<void> executeAction(String endPoint, dynamic reqParams) async {

    emit(const ActionRequested());
    var response  = await ApiHelper.callApi(endPoint, reqParams,  authRequired:true);
    ApiResponseDataAndConfig apiResponse =  ApiResponseDataAndConfig.fromJson(response);
    if (apiResponse.isOK()) {
      emit(ActionRequestSuccess( apiResponse.config, apiResponse.item));
    } else {
      emit(ActionRequestFailed( apiResponse.message));
    }
  }


  Future<void> executeSearchRequest(String endPoint, dynamic reqParams) async {

    emit(const SearchRequestLoading());
    ApiResponseSearchResult apiResponse = await getSearchResult(endPoint, reqParams);
    if (apiResponse.isOK()) {
      emit(SearchRequestSuccess(apiResponse));
    } else {
      emit(SearchRequestFailed(apiResponse.message));
    }
  }

  Future<ApiResponseSearchResult> getSearchResult(String endPoint, PageableSearchRequest sr,  {bool authRequired=true}) async {

    var response  = await ApiHelper.callApi(endPoint, sr,  authRequired:authRequired);
    ApiResponseSearchResult apiResponse =  ApiResponseSearchResult.fromJson(response);
    return apiResponse;
  }


  Future<ApiResponseDataAndConfig> getConfigAndData(String endPoint, reqParams,  {bool authRequired=true}) async {
    var response = await ApiHelper.callApi(endPoint,reqParams,  authRequired:authRequired);
    return ApiResponseDataAndConfig.fromJson(response);
  }

}
