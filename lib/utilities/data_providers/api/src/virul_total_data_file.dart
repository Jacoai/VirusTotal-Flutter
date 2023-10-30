// To parse this JSON data, do
//
//     final fileData = fileDataFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'virul_total_data_file.g.dart';

FileData fileDataFromJson(String str) => FileData.fromJson(json.decode(str));

String fileDataToJson(FileData data) => json.encode(data.toJson());

@JsonSerializable()
class FileData {
  @JsonKey(name: "scans")
  final Map<String, Scan> scans;
  @JsonKey(name: "scan_id")
  final String scanId;
  @JsonKey(name: "sha1")
  final String sha1;
  @JsonKey(name: "resource")
  final String resource;
  @JsonKey(name: "response_code")
  final int responseCode;
  @JsonKey(name: "scan_date")
  final DateTime scanDate;
  @JsonKey(name: "permalink")
  final String permalink;
  @JsonKey(name: "verbose_msg")
  final String verboseMsg;
  @JsonKey(name: "total")
  final int total;
  @JsonKey(name: "positives")
  final int positives;
  @JsonKey(name: "sha256")
  final String sha256;
  @JsonKey(name: "md5")
  final String md5;

  FileData({
    required this.scans,
    required this.scanId,
    required this.sha1,
    required this.resource,
    required this.responseCode,
    required this.scanDate,
    required this.permalink,
    required this.verboseMsg,
    required this.total,
    required this.positives,
    required this.sha256,
    required this.md5,
  });

  factory FileData.fromJson(Map<String, dynamic> json) =>
      _$FileDataFromJson(json);

  Map<String, dynamic> toJson() => _$FileDataToJson(this);
}

@JsonSerializable()
class Scan {
  @JsonKey(name: "detected")
  final bool detected;
  @JsonKey(name: "version")
  final String version;
  @JsonKey(name: "result")
  final dynamic result;
  @JsonKey(name: "update")
  final String update;

  Scan({
    required this.detected,
    required this.version,
    required this.result,
    required this.update,
  });

  factory Scan.fromJson(Map<String, dynamic> json) => _$ScanFromJson(json);

  Map<String, dynamic> toJson() => _$ScanToJson(this);
}
