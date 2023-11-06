import 'package:injectable/injectable.dart';

import 'package:virus_total_cli/virus_total_cli.dart';

@singleton
class ReportCheckRepository {
  VirusTotalClient virusTotalClient = VirusTotalClient(
      apikey:
          'b2a12410feba4baf4507b69b29bea00edc9278af5a1f5a3b6ba4be6b95e80747');

  Future<AnalysisData> getAnalisisReport(String path) async {
    AnalysisData result;
    try {
      result = await virusTotalClient.check(path);
    } catch (e) {
      rethrow;
    }
    return result;
  }
}
