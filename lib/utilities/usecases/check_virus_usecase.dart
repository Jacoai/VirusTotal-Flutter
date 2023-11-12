import 'package:injectable/injectable.dart';
import 'package:ui_clen_api_vt/utilities/repositories/check_virus_repository.dart';
import 'package:ui_clen_api_vt/utilities/repositories/database_repository.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

@singleton
class VirusTotalCheckUsecase {
  VirusTotalCheckUsecase(
    @injectable this._reportCheckRepository,
    @injectable this._databaseRepository,
  );

  final ReportCheckRepository _reportCheckRepository;
  final DatabaseRepository _databaseRepository;

  Future<VirusTotalData> check(String path) async {
    try {
      bool isFile = _isFile(path);
      VirusTotalData data;

      if (await _databaseRepository.containsKey(path)) {
        VirusTotalData? tmpData = await _databaseRepository.get(path);
        data = tmpData!;
      } else {
        AnalysisData analysisData =
            await _reportCheckRepository.getAnalisisReport(path, isFile);
        data = convertAnalysisDataToVirusTotalData(analysisData, path, isFile);
        await _databaseRepository.put(path, analysisData);
      }
      return data;
    } catch (e) {
      rethrow;
    }
  }

  void show() {
    _databaseRepository.printConsole();
  }

  bool _isFile(String path) {
    RegExp urlRegex = RegExp(
        r"((https?:www\.)|(https?:\/\/)|(www\.))[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9]{1,6}(\/[-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?");

    if (path.contains(urlRegex)) {
      return false;
    }
    return true;
  }
}
