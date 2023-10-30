import 'package:injectable/injectable.dart';
import 'package:ui_clen_api_vt/utilities/data_providers/api/src/virul_total_data_file.dart';
import 'package:ui_clen_api_vt/utilities/data_providers/api/src/virus_total_data_url.dart';
import 'package:ui_clen_api_vt/utilities/data_providers/api/virus_total_client.dart';

DioClient _virusTotalClient = DioClient();

@singleton
class UrlReportRepository {
  Future<UrlData?> getUrlReport(String urlPath) async {
    UrlData? urlData;
    String? id = await _virusTotalClient.getUrlAnalysisId(urlPath);
    if (id == null) {
      return urlData;
    }
    urlData = await _virusTotalClient.getUrlAnalysisReport(id);

    if (urlData == null) {
      print('Error null Urldata');
    }
    return urlData;
  }
}

@singleton
class FileReporRepository {
  Future<FileData?> getFileReport(String filePath) async {
    FileData? fileData;
    String? fileId = await _virusTotalClient.getFileAnalysisId(filePath);
    if (fileId == null) {
      print('Error file id null');
      return fileData;
    }

    fileData = await _virusTotalClient.getFileAnalysisReport(fileId);
    if (fileData == null) {
      print('Error null fileData');
    }
    return fileData;
  }
}
