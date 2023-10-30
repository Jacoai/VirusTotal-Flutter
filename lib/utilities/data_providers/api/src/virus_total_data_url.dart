// To parse this JSON data, do
//
//     final urlData = urlDataFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'virus_total_data_url.g.dart';

UrlData urlDataFromJson(String str) => UrlData.fromJson(json.decode(str));

String urlDataToJson(UrlData data) => json.encode(data.toJson());

@JsonSerializable()
class UrlData {
  @JsonKey(name: "meta")
  final Meta meta;
  @JsonKey(name: "data")
  final Data data;

  UrlData({
    required this.meta,
    required this.data,
  });

  factory UrlData.fromJson(Map<String, dynamic> json) =>
      _$UrlDataFromJson(json);

  Map<String, dynamic> toJson() => _$UrlDataToJson(this);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "attributes")
  final Attributes attributes;
  @JsonKey(name: "type")
  final String type;
  @JsonKey(name: "id")
  final String id;
  @JsonKey(name: "links")
  final Links links;

  Data({
    required this.attributes,
    required this.type,
    required this.id,
    required this.links,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Attributes {
  @JsonKey(name: "date")
  final int date;
  @JsonKey(name: "status")
  final String status;
  @JsonKey(name: "stats")
  final Stats stats;
  @JsonKey(name: "results")
  final Map<String, ResultValue> results;

  Attributes({
    required this.date,
    required this.status,
    required this.stats,
    required this.results,
  });

  factory Attributes.fromJson(Map<String, dynamic> json) =>
      _$AttributesFromJson(json);

  Map<String, dynamic> toJson() => _$AttributesToJson(this);
}

@JsonSerializable()
class ResultValue {
  @JsonKey(name: "category")
  final Category category;
  @JsonKey(name: "result")
  final ResultEnum result;
  @JsonKey(name: "method")
  final Method method;
  @JsonKey(name: "engine_name")
  final String engineName;

  ResultValue({
    required this.category,
    required this.result,
    required this.method,
    required this.engineName,
  });

  factory ResultValue.fromJson(Map<String, dynamic> json) =>
      _$ResultValueFromJson(json);

  Map<String, dynamic> toJson() => _$ResultValueToJson(this);
}

enum Category {
  @JsonValue("harmless")
  HARMLESS,
  @JsonValue("malicious")
  MALICIOUS,
  @JsonValue("undetected")
  UNDETECTED
}

final categoryValues = EnumValues({
  "harmless": Category.HARMLESS,
  "malicious": Category.MALICIOUS,
  "undetected": Category.UNDETECTED
});

enum Method {
  @JsonValue("blacklist")
  BLACKLIST
}

final methodValues = EnumValues({"blacklist": Method.BLACKLIST});

enum ResultEnum {
  @JsonValue("clean")
  CLEAN,
  @JsonValue("malicious")
  MALICIOUS,
  @JsonValue("unrated")
  UNRATED
}

final resultEnumValues = EnumValues({
  "clean": ResultEnum.CLEAN,
  "malicious": ResultEnum.MALICIOUS,
  "unrated": ResultEnum.UNRATED
});

@JsonSerializable()
class Stats {
  @JsonKey(name: "harmless")
  final int harmless;
  @JsonKey(name: "malicious")
  final int malicious;
  @JsonKey(name: "suspicious")
  final int suspicious;
  @JsonKey(name: "undetected")
  final int undetected;
  @JsonKey(name: "timeout")
  final int timeout;

  Stats({
    required this.harmless,
    required this.malicious,
    required this.suspicious,
    required this.undetected,
    required this.timeout,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}

@JsonSerializable()
class Links {
  @JsonKey(name: "item")
  final String item;
  @JsonKey(name: "self")
  final String self;

  Links({
    required this.item,
    required this.self,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "url_info")
  final UrlInfo urlInfo;

  Meta({
    required this.urlInfo,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class UrlInfo {
  @JsonKey(name: "url")
  final String url;
  @JsonKey(name: "id")
  final String id;

  UrlInfo({
    required this.url,
    required this.id,
  });

  factory UrlInfo.fromJson(Map<String, dynamic> json) =>
      _$UrlInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UrlInfoToJson(this);
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
