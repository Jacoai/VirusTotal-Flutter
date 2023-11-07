part of 'home_page_bloc.dart';

class HomePageState {
  final List<String> pathsToScan;
  final List<VirusTotalData> virusTotalData;
  final bool isSending;

  HomePageState({
    this.pathsToScan = const [],
    this.virusTotalData = const [],
    this.isSending = false,
  });

  HomePageState copyWith({
    String? path,
    VirusTotalData? data,
    bool isSending = false,
  }) {
    List<String>? tmpStr = List.from(pathsToScan);
    List<VirusTotalData>? tmpData;

    if (path != null) {
      tmpStr.add(path);
    }
    if (data != null) {
      tmpData = List.from(virusTotalData);
      tmpData.add(data);
      tmpStr.remove(data.source);
    }

    return HomePageState(
      pathsToScan: tmpStr,
      virusTotalData: tmpData ?? virusTotalData,
      isSending: isSending,
    );
  }
}

class HomePageSendingState extends HomePageState {}

class HomePageSendState extends HomePageState {}
