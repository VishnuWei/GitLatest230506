// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseFilter _$BaseFilterFromJson(Map<String, dynamic> json) {
  return BaseFilter()
    ..key = json['key'] as String
    ..operation = json['operation'] as int;
}

Map<String, dynamic> _$BaseFilterToJson(BaseFilter instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operation': instance.operation,
    };

PageableSearchRequest _$PageableSearchRequestFromJson(
    Map<String, dynamic> json) {
  return PageableSearchRequest()
    ..startFrom = json['startFrom'] as int
    ..pageSize = json['pageSize'] as int
    ..criteria =
        SearchCriteria.fromJson(json['criteria'] as Map<String, dynamic>);
}

Map<String, dynamic> _$PageableSearchRequestToJson(
        PageableSearchRequest instance) =>
    <String, dynamic>{
      'startFrom': instance.startFrom,
      'pageSize': instance.pageSize,
      'criteria': instance.criteria,
    };

SearchCriteria _$SearchCriteriaFromJson(Map<String, dynamic> json) {
  return SearchCriteria()
    ..textFilters = (json['textFilters'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, TextFilter.fromJson(e as Map<String, dynamic>)),
    )
    ..locationFilters = (json['locationFilters'] as Map<String, dynamic>).map(
      (k, e) => MapEntry(k, LocationFilter.fromJson(e as Map<String, dynamic>)),
    )
    ..dateRangeFilters = (json['dateRangeFilters'] as Map<String, dynamic>).map(
      (k, e) =>
          MapEntry(k, DateRangeFilter.fromJson(e as Map<String, dynamic>)),
    )
    ..numRangeFilters = (json['numRangeFilters'] as Map<String, dynamic>).map(
      (k, e) =>
          MapEntry(k, NumericRangeFilter.fromJson(e as Map<String, dynamic>)),
    )
    ..sortCriteria = (json['sortCriteria'] as List<dynamic>)
        .map((e) => SortCriteria.fromJson(e as Map<String, dynamic>))
        .toList();
}

Map<String, dynamic> _$SearchCriteriaToJson(SearchCriteria instance) =>
    <String, dynamic>{
      'textFilters': instance.textFilters,
      'locationFilters': instance.locationFilters,
      'dateRangeFilters': instance.dateRangeFilters,
      'numRangeFilters': instance.numRangeFilters,
      'sortCriteria': instance.sortCriteria,
    };

TextFilter _$TextFilterFromJson(Map<String, dynamic> json) {
  return TextFilter()
    ..key = json['key'] as String
    ..operation = json['operation'] as int
    ..value = json['value'] as String;
}

Map<String, dynamic> _$TextFilterToJson(TextFilter instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operation': instance.operation,
      'value': instance.value,
    };

LocationFilter _$LocationFilterFromJson(Map<String, dynamic> json) {
  return LocationFilter()
    ..key = json['key'] as String
    ..operation = json['operation'] as int
    ..point = json['point'] == null
        ? null
        : GeoPoint.fromJson(json['point'] as Map<String, dynamic>)
    ..distance = json['distance'] as int
    ..unit = _$enumDecodeNullable(_$UnitEnumMap, json['unit']);
}

Map<String, dynamic> _$LocationFilterToJson(LocationFilter instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operation': instance.operation,
      'point': instance.point,
      'distance': instance.distance,
      'unit': _$UnitEnumMap[instance.unit],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$UnitEnumMap = {
  Unit.kilometers: 'kilometers',
  Unit.miles: 'miles',
};

GeoPoint _$GeoPointFromJson(Map<String, dynamic> json) {
  return GeoPoint()
    ..latitude = (json['latitude'] as num?)?.toDouble()
    ..longitude = (json['longitude'] as num?)?.toDouble()
    ..country = json['country'] as String?
    ..state = json['state'] as String?
    ..city = json['city'] as String?
    ..place = json['place'] as String?;
}

Map<String, dynamic> _$GeoPointToJson(GeoPoint instance) => <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'country': instance.country,
      'state': instance.state,
      'city': instance.city,
      'place': instance.place,
    };

DateRangeFilter _$DateRangeFilterFromJson(Map<String, dynamic> json) {
  return DateRangeFilter()
    ..key = json['key'] as String
    ..operation = json['operation'] as int
    ..from = json['from'] as String?
    ..to = json['to'] as String?;
}

Map<String, dynamic> _$DateRangeFilterToJson(DateRangeFilter instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operation': instance.operation,
      'from': instance.from,
      'to': instance.to,
    };

NumericRangeFilter _$NumericRangeFilterFromJson(Map<String, dynamic> json) {
  return NumericRangeFilter()
    ..key = json['key'] as String
    ..operation = json['operation'] as int
    ..from = json['from'] as int?
    ..to = json['to'] as int?;
}

Map<String, dynamic> _$NumericRangeFilterToJson(NumericRangeFilter instance) =>
    <String, dynamic>{
      'key': instance.key,
      'operation': instance.operation,
      'from': instance.from,
      'to': instance.to,
    };

SortCriteria _$SortCriteriaFromJson(Map<String, dynamic> json) {
  return SortCriteria()
    ..fieldName = json['fieldName'] as String
    ..ascending = json['ascending'] as bool;
}

Map<String, dynamic> _$SortCriteriaToJson(SortCriteria instance) =>
    <String, dynamic>{
      'fieldName': instance.fieldName,
      'ascending': instance.ascending,
    };
