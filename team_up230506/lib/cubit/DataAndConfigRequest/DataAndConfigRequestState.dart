

part of 'DataAndConfigRequestCubit.dart';

@immutable
abstract class DataAndConfigRequestState<T extends ApiResponseDataAndConfig> {}

class DataAndConfigRequestInitial<T extends ApiResponseDataAndConfig> extends DataAndConfigRequestState {}
class LoadingDataAndConfigRequest<T extends ApiResponseDataAndConfig> extends DataAndConfigRequestState {}

class DataAndConfigRequestSuccess<T extends ApiResponseDataAndConfig> extends DataAndConfigRequestState {
 late final T apiResponse;
 DataAndConfigRequestSuccess(this.apiResponse);
}

class DataAndConfigRequestFailed<T extends ApiResponseDataAndConfig> extends DataAndConfigRequestState {
 final T apiResponse;
 DataAndConfigRequestFailed(this.apiResponse);
}
