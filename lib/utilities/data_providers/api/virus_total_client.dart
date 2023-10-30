import 'package:dio/dio.dart';
import 'package:ui_clen_api_vt/utilities/data_providers/api/src/virul_total_data_file.dart';
import 'package:ui_clen_api_vt/utilities/data_providers/api/src/virus_total_data_url.dart';

class DioClient {
  DioClient(
      {this.apikey =
          'b2a12410feba4baf4507b69b29bea00edc9278af5a1f5a3b6ba4be6b95e80747'});

  final Dio _dio = Dio();

  final String apikey;

  final _urlAnalysId = 'https://www.virustotal.com/api/v3/urls';
  final _urlAnalusReport = 'https://www.virustotal.com/api/v3/analyses/';

  final _fileAnalysId = 'https://www.virustotal.com/api/v3/files';
  final _fileAnalysReport = 'https://www.virustotal.com/vtapi/v2/file/report';

  void checkUrl(String urlForCheck) async {
    String? idUrl = await getUrlAnalysisId(urlForCheck);

    if (idUrl == null) {
      print('Exeption: idUrl is null');
      return;
    }

    UrlData? urlData = await getUrlAnalysisReport(idUrl);

    if (urlData == null) {
      print('Exeption: urlData is null');
      return;
    }
    //обработка при очереди
    while (urlData?.data.attributes.status == 'queued') {
      print('url $urlForCheck is in a queue\n');
      await Future.delayed(Duration(seconds: 15));
      urlData = await getUrlAnalysisReport(idUrl);
    }
    //Вывод результата
    if (urlData != null) {
      print('\nInfo of url:$urlForCheck');
      printUrlResult(urlData);
    } else {
      print('Exeption: urlData is null');
    }
  }

  Future<String?> getUrlAnalysisId(String url) async {
    String? id;

    try {
      Response response = await _dio.post(_urlAnalysId,
          data: {"url": url},
          options: Options(headers: {
            'x-apikey': apikey,
            "content-type": "application/x-www-form-urlencoded"
          }));

      Map<String, dynamic> json = response.data;
      id = json['data']['id'];
    } catch (e) {
      print("error getting Id of url: $e");
    }
    return id;
  }

  Future<UrlData?> getUrlAnalysisReport(String urlId) async {
    UrlData? result;

    try {
      Response response = await _dio.get('$_urlAnalusReport$urlId',
          options: Options(headers: {
            'x-apikey': apikey,
            "accept": "application/json",
          }));

      result = UrlData.fromJson(response.data);
    } catch (e) {
      print('Error get Analysis report: $e');
    }

    return result;
  }

//TODO for devug - remove
  void printUrlResult(UrlData urlData) {
    print('Harmless:${urlData.data.attributes.stats.harmless}');
    print('Malicious:${urlData.data.attributes.stats.malicious}');
    print('Suspicious:${urlData.data.attributes.stats.suspicious}');
    print('Undetected:${urlData.data.attributes.stats.undetected}');
    print('Timeout:${urlData.data.attributes.stats.timeout}\n');
  }

  void checkFile(String filePath) async {
    String? idFile = await getFileAnalysisId(filePath);

    if (idFile == null) {
      print('Exeption: File ID in null');
      return;
    }

    FileData? fileData = await getFileAnalysisReport(idFile);

    if (fileData == null) {
      print('fileData in null');
      return;
    }

    printFileResult(fileData, filePath);
  }

  Future<String?> getFileAnalysisId(String path) async {
    String? id;

    try {
      final FormData formData =
          FormData.fromMap({'file': await MultipartFile.fromFile(path)});

      Response response = await _dio.post(_fileAnalysId,
          data: formData,
          options: Options(headers: {
            'x-apikey': apikey,
            "content-type": 'application/octet-stream'
          }));

      Map<String, dynamic> json = response.data;
      id = json['data']['id'].toString();
    } catch (e) {
      print("Error getttin file ID: $e");
    }

    return id;
  }

  Future<FileData?> getFileAnalysisReport(String fileId) async {
    FileData? fileData;
    try {
      Response response = await _dio.get(
        'https://www.virustotal.com/vtapi/v2/file/report',
        queryParameters: {
          'apikey': apikey,
          'resource': fileId,
        },
      );

      // 'https://www.virustotal.com/api/v3/files/$fileId',
      // options: Options(
      //   headers: {
      //     'accept': 'application/json',
      //     'x-apikey': apikey,
      //   },
      // ),
      // );

      fileData = FileData.fromJson(response.data);
    } catch (e) {
      print('Error get Analysis report of file: $e');
    }

    return fileData;
  }

//TODO for devug - remove
  void printFileResult(FileData fileData, String filePath) {
    print('\nFile: $filePath');
    print('Total scans = ${fileData.total}');
    print('Positives = ${fileData.positives}');
    if (fileData.positives == 0) {
      print('This file is clean');
    } else {
      print('Found viruses:');
      fileData.scans.values.forEach((element) {
        if (element.result != null) {
          print('${element.result}');
        }
      });
    }
  }
}
