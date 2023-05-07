import 'package:json_annotation/json_annotation.dart';

part 'search_request.g.dart';


class SearchOperation {
  static const int GREATER_THAN = 0;
  static const int  LESS_THAN  = 1;
  static const int  GREATER_THAN_EQUAL = 2;
  static const int  LESS_THAN_EQUAL = 3;
  static const int  NOT_EQUAL = 4;
  static const int  EQUAL = 5;
  static const int   MATCH = 6;
  static const int  MATCH_END= 7;
}



@JsonSerializable()
 class BaseFilter {
   String key = "";
   int operation = SearchOperation.EQUAL;

   BaseFilter();

   factory BaseFilter.fromJson(Map<String, dynamic> json) => _$BaseFilterFromJson(json);
   Map<String, dynamic> toJson() => _$BaseFilterToJson(this);
}

@JsonSerializable()
 class PageableSearchRequest  {
  static  int maxPageSize = 25;
    int startFrom = 0;
    int pageSize = 10;
   SearchCriteria criteria =  SearchCriteria();


  PageableSearchRequest();

  factory PageableSearchRequest.fromJson(Map<String, dynamic> json) => _$PageableSearchRequestFromJson(json);
  Map<String, dynamic> toJson() => _$PageableSearchRequestToJson(this);
}

@JsonSerializable()
class SearchCriteria{
   Map<String, TextFilter> textFilters = <String, TextFilter>{};
    Map<String, LocationFilter> locationFilters = <String, LocationFilter> {};
    Map<String, DateRangeFilter> dateRangeFilters = <String, DateRangeFilter>{};
    Map<String, NumericRangeFilter> numRangeFilters =  <String, NumericRangeFilter>{};
    List< SortCriteria> sortCriteria = < SortCriteria>[];

   SearchCriteria();

   factory SearchCriteria.fromJson(Map<String, dynamic> json) => _$SearchCriteriaFromJson(json);
   Map<String, dynamic> toJson() => _$SearchCriteriaToJson(this);
}

@JsonSerializable()
 class TextFilter extends  BaseFilter {
   String value="";


   TextFilter();

   factory TextFilter.fromJson(Map<String, dynamic> json) => _$TextFilterFromJson(json);
   Map<String, dynamic> toJson() => _$TextFilterToJson(this);
}

@JsonSerializable()
class LocationFilter extends BaseFilter{
   GeoPoint? point;
   int distance = 50;
   Unit? unit = Unit.kilometers;


   LocationFilter();

   factory LocationFilter.fromJson(Map<String, dynamic> json) => _$LocationFilterFromJson(json);
   Map<String, dynamic> toJson() => _$LocationFilterToJson(this);
}
enum Unit { kilometers, miles }

@JsonSerializable()
class GeoPoint {
   double?  latitude;
   double? longitude;
   String? country;
   String? state;
   String ? city;
   String ? place;

   GeoPoint();

   factory GeoPoint.fromJson(Map<String, dynamic> json) => _$GeoPointFromJson(json);
   Map<String, dynamic> toJson() => _$GeoPointToJson(this);
}

@JsonSerializable()
class DateRangeFilter extends BaseFilter {
   String? from;
   String? to;

   DateRangeFilter();

   factory DateRangeFilter.fromJson(Map<String, dynamic> json) => _$DateRangeFilterFromJson(json);
   Map<String, dynamic> toJson() => _$DateRangeFilterToJson(this);
}

@JsonSerializable()
class NumericRangeFilter extends BaseFilter {
   int? from ;
   int? to;

   NumericRangeFilter();

   factory NumericRangeFilter.fromJson(Map<String, dynamic> json) => _$NumericRangeFilterFromJson(json);
   Map<String, dynamic> toJson() => _$NumericRangeFilterToJson(this);
}

@JsonSerializable()
class SortCriteria {
  String fieldName = "";
  bool ascending = true;

  SortCriteria();

  factory SortCriteria.fromJson(Map<String, dynamic> json) => _$SortCriteriaFromJson(json);
  Map<String, dynamic> toJson() => _$SortCriteriaToJson(this);
}
