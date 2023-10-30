// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'virul_total_data_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FileData _$FileDataFromJson(Map<String, dynamic> json) => FileData(
      scans: (json['scans'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(k, Scan.fromJson(e as Map<String, dynamic>)),
      ),
      scanId: json['scan_id'] as String,
      sha1: json['sha1'] as String,
      resource: json['resource'] as String,
      responseCode: json['response_code'] as int,
      scanDate: DateTime.parse(json['scan_date'] as String),
      permalink: json['permalink'] as String,
      verboseMsg: json['verbose_msg'] as String,
      total: json['total'] as int,
      positives: json['positives'] as int,
      sha256: json['sha256'] as String,
      md5: json['md5'] as String,
    );

Map<String, dynamic> _$FileDataToJson(FileData instance) => <String, dynamic>{
      'scans': instance.scans,
      'scan_id': instance.scanId,
      'sha1': instance.sha1,
      'resource': instance.resource,
      'response_code': instance.responseCode,
      'scan_date': instance.scanDate.toIso8601String(),
      'permalink': instance.permalink,
      'verbose_msg': instance.verboseMsg,
      'total': instance.total,
      'positives': instance.positives,
      'sha256': instance.sha256,
      'md5': instance.md5,
    };

Scan _$ScanFromJson(Map<String, dynamic> json) => Scan(
      detected: json['detected'] as bool,
      version: json['version'] as String,
      result: json['result'],
      update: json['update'] as String,
    );

Map<String, dynamic> _$ScanToJson(Scan instance) => <String, dynamic>{
      'detected': instance.detected,
      'version': instance.version,
      'result': instance.result,
      'update': instance.update,
    };
