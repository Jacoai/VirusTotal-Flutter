import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:injectable/injectable.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

@singleton
class CheckHistoryRepository {
  final DatabaseClient _databaseClient = DatabaseClient();

  Future<ValueListenable<Box<VirusTotalData>>>
      getCheckHistoryValueListenable() async {
    return _databaseClient.dataBase.listenable();
  }

  List<VirusTotalData> getAll() {
    return List.from(_databaseClient.dataBase.values);
  }

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

  Future<void> clear() async {
    await _databaseClient.dataBase.clear();
  }

  void printConsole() {
    _databaseClient.show();
  }
}
