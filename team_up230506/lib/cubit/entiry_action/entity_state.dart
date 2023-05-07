part of 'entity_cubit.dart';

@immutable
abstract class EntityState {
  const EntityState();
}

class EntityInitialState extends EntityState {
  const EntityInitialState():super();
}

class ConfigRequested extends EntityState {
 const ConfigRequested():super();
}

class ConfigRequestSuccess extends EntityState {
 final dynamic data;
 final MasterUiConfig uiConfig;
 const ConfigRequestSuccess(this.uiConfig, this.data):super();
}

class ConfigRequestFailed extends EntityState {
 final String errorMessage ;
 const ConfigRequestFailed(this.errorMessage):super();
}
class ActionRequested extends EntityState {
 const ActionRequested():super();
}

class ActionRequestSuccess extends EntityState {
 final dynamic data;
 final MasterUiConfig uiConfig;
 const ActionRequestSuccess(this.uiConfig, this.data):super();
}

class ActionRequestFailed extends EntityState {
 final String errorMessage ;
 const ActionRequestFailed(this.errorMessage):super();
}

class SearchRequestLoading extends EntityState {
 const SearchRequestLoading():super();
}

class SearchRequestSuccess extends EntityState {
 final ApiResponseSearchResult searchResult;
 const SearchRequestSuccess(this.searchResult):super();
}

class SearchRequestFailed extends EntityState {
 final String errorMessage ;
 const SearchRequestFailed(this.errorMessage):super();
}