// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virus_total_data_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UrlData _$UrlDataFromJson(Map<String, dynamic> json) => UrlData(
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UrlDataToJson(UrlData instance) => <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      attributes:
          Attributes.fromJson(json['attributes'] as Map<String, dynamic>),
      type: json['type'] as String,
      id: json['id'] as String,
      links: Links.fromJson(json['links'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'attributes': instance.attributes,
      'type': instance.type,
      'id': instance.id,
      'links': instance.links,
    };

Attributes _$AttributesFromJson(Map<String, dynamic> json) => Attributes(
      date: json['date'] as int,
      status: json['status'] as String,
      stats: Stats.fromJson(json['stats'] as Map<String, dynamic>),
      results: (json['results'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, ResultValue.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$AttributesToJson(Attributes instance) =>
    <String, dynamic>{
      'date': instance.date,
      'status': instance.status,
      'stats': instance.stats,
      'results': instance.results,
    };

ResultValue _$ResultValueFromJson(Map<String, dynamic> json) => ResultValue(
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      result: $enumDecode(_$ResultEnumEnumMap, json['result']),
      method: $enumDecode(_$MethodEnumMap, json['method']),
      engineName: json['engine_name'] as String,
    );

Map<String, dynamic> _$ResultValueToJson(ResultValue instance) =>
    <String, dynamic>{
      'category': _$CategoryEnumMap[instance.category]!,
      'result': _$ResultEnumEnumMap[instance.result]!,
      'method': _$MethodEnumMap[instance.method]!,
      'engine_name': instance.engineName,
    };

const _$CategoryEnumMap = {
  Category.HARMLESS: 'harmless',
  Category.MALICIOUS: 'malicious',
  Category.UNDETECTED: 'undetected',
};

const _$ResultEnumEnumMap = {
  ResultEnum.CLEAN: 'clean',
  ResultEnum.MALICIOUS: 'malicious',
  ResultEnum.UNRATED: 'unrated',
};

const _$MethodEnumMap = {
  Method.BLACKLIST: 'blacklist',
};

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      harmless: json['harmless'] as int,
      malicious: json['malicious'] as int,
      suspicious: json['suspicious'] as int,
      undetected: json['undetected'] as int,
      timeout: json['timeout'] as int,
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'harmless': instance.harmless,
      'malicious': instance.malicious,
      'suspicious': instance.suspicious,
      'undetected': instance.undetected,
      'timeout': instance.timeout,
    };

Links _$LinksFromJson(Map<String, dynamic> json) => Links(
      item: json['item'] as String,
      self: json['self'] as String,
    );

Map<String, dynamic> _$LinksToJson(Links instance) => <String, dynamic>{
      'item': instance.item,
      'self': instance.self,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
      urlInfo: UrlInfo.fromJson(json['url_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'url_info': instance.urlInfo,
    };

UrlInfo _$UrlInfoFromJson(Map<String, dynamic> json) => UrlInfo(
      url: json['url'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$UrlInfoToJson(UrlInfo instance) => <String, dynamic>{
      'url': instance.url,
      'id': instance.id,
    };
