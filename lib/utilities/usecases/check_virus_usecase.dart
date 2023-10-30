import 'package:injectable/injectable.dart';
import 'package:ui_clen_api_vt/utilities/data_providers/api/src/virul_total_data_file.dart';
import 'package:ui_clen_api_vt/utilities/data_providers/api/src/virus_total_data_url.dart';
import 'package:ui_clen_api_vt/utilities/repositories/check_virus_repository.dart';

@singleton
class VirusTotalCheckUsecase {
  VirusTotalCheckUsecase(
    @injectable this._fileReporRepository,
    @injectable this._urlReportRepository,
  );

  late final UrlReportRepository _urlReportRepository;
  late final FileReporRepository _fileReporRepository;

  Future<UrlData?> checkUrl(String urlPath) async {
    UrlData? urlData = await _urlReportRepository.getUrlReport(urlPath);

    if (urlData == null) {
      return urlData;
    }
//TODO for devug - remove
    print('Harmless:${urlData.data.attributes.stats.harmless}');
    print('Malicious:${urlData.data.attributes.stats.malicious}');
    print('Suspicious:${urlData.data.attributes.stats.suspicious}');
    print('Undetected:${urlData.data.attributes.stats.undetected}');
    print('Timeout:${urlData.data.attributes.stats.timeout}\n');

    return urlData;
  }

  Future<FileData?> checkFile(String filePath) async {
    return await _fileReporRepository.getFileReport(filePath);
  }
}
