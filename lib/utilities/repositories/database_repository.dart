import 'package:injectable/injectable.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

@singleton
class DatabaseRepository {
  final DatabaseClient _databaseClient = DatabaseClient();

  Future<void> init() async {
    await _databaseClient.init();
  }

  Future<void> put(String key, AnalysisData data) async {
    await _databaseClient.put(key, data);
  }

  Future<void> close() async {
    await _databaseClient.close();
  }

  Future<VirusTotalData?> get(String key) {
    return _databaseClient.get(key);
  }

  Future<bool> containsKey(String key) async {
    return await _databaseClient.containsKey(key);
  }

  Future<void> delete(String key) async {
    await _databaseClient.delete(key);
  }

  void printConsole() {
    _databaseClient.show();
  }
}
