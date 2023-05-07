import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../framework/api_helper.dart';
import '../../framework/models/ApiResponseDataAndConfig.dart';
part  'DataAndConfigRequestState.dart';



class ServerRequestCubit<T extends ApiResponseDataAndConfig> extends Cubit<DataAndConfigRequestState> {

  ServerRequestCubit(): super(DataAndConfigRequestInitial<T>());

  Future<void> loadRequest(String endPoint, String context, dynamic reqParams, {bool authRequired=true}) async {
    emit(LoadingDataAndConfigRequest());

    endPoint = endPoint + ( context.isNotEmpty? ("/" + context):"");
    T apiResponse = await ApiHelper.callApi(endPoint,reqParams, authRequired:authRequired);

  //  ApiResponseBase apiResponseBase = ApiResponse.fromJson(response);

    if (apiResponse.isOK()) {
      emit(DataAndConfigRequestSuccess(apiResponse));
    } else {
      emit(DataAndConfigRequestFailed(apiResponse));

    }
  }
}
