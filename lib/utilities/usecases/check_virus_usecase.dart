import 'package:injectable/injectable.dart';
import 'package:ui_clen_api_vt/utilities/repositories/check_virus_repository.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

@singleton
class VirusTotalCheckUsecase {
  VirusTotalCheckUsecase(
    @injectable this._reportCheckRepository,
  );

  final ReportCheckRepository _reportCheckRepository;

  Future<AnalysisData> check(String path, bool isFile) async {
    try {
      AnalysisData data =
          await _reportCheckRepository.getAnalisisReport(path, isFile);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
