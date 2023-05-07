part of 'ServerRequest_cubit.dart';

@immutable
abstract class ServerRequestState<T extends ApiResponseBase> {}

class ServerRequestInitial<T extends ApiResponseBase> extends ServerRequestState {}
class LoadingRequest<T extends ApiResponseBase> extends ServerRequestState {}

class RequestSuccess<T extends ApiResponseBase> extends ServerRequestState {
 final T apiResponse;
 RequestSuccess(this.apiResponse);
}

class RequestFailed<T extends ApiResponseBase> extends ServerRequestState {
 final String message;
 RequestFailed(this.message);
}
