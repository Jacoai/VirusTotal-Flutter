import 'package:injectable/injectable.dart';
import 'package:ui_clen_api_vt/utilities/repositories/check_virus_repository.dart';
import 'package:ui_clen_api_vt/utilities/repositories/check_history_repository.dart';
import 'package:virus_total_cli/virus_total_cli.dart';
import 'package:ui_clen_api_vt/utilities/functions/is_file_.dart';

@singleton
class VirusTotalCheckUsecase {
  VirusTotalCheckUsecase(
    @injectable this._reportCheckRepository,
    @injectable this.databaseRepository,
  );

  final ReportCheckRepository _reportCheckRepository;
  final CheckHistoryRepository databaseRepository;

  Future<VirusTotalData> check(String path) async {
    try {
      bool isFile1 = isFile(path);
      VirusTotalData data;

      if (await databaseRepository.containsKey(path)) {
        VirusTotalData? tmpData = await databaseRepository.get(path);
        data = tmpData!;
      } else {
        AnalysisData analysisData =
            await _reportCheckRepository.getAnalisisReport(path, isFile1);
        data = convertAnalysisDataToVirusTotalData(analysisData, path, isFile1);
        await databaseRepository.put(path, analysisData);
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  void show() {
    databaseRepository.printConsole();
  }
}
