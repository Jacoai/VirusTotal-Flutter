part of 'history_page_bloc.dart';

final class HistoryPageState {
  final List<VirusTotalData> virusTotalData;

  HistoryPageState({
    this.virusTotalData = const [],
  });

  HistoryPageState copyWith(List<VirusTotalData>? virusTotalData) {
    return HistoryPageState(
        virusTotalData: virusTotalData ?? this.virusTotalData);
  }
}
