import 'package:injectable/injectable.dart';
import 'package:ui_clen_api_vt/utilities/repositories/check_virus_repository.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

@singleton
class VirusTotalCheckUsecase {
  VirusTotalCheckUsecase(
    @injectable this._reportCheckRepository,
  );

  final ReportCheckRepository _reportCheckRepository;

  Future<AnalysisData?> check(String path) async {
    AnalysisData? data = await _reportCheckRepository.getAnalisisReport(path);

    if (data == null) {
      return data;
    }
//TODO for devug - remove
    print('Harmless:${data.attributes.stats.harmless}');
    print('Malicious:${data.attributes.stats.malicious}');
    print('Suspicious:${data.attributes.stats.suspicious}');
    print('Undetected:${data.attributes.stats.undetected}');
    print('Timeout:${data.attributes.stats.timeout}\n');

    return data;
  }
}
