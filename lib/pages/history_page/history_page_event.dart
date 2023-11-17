part of 'history_page_bloc.dart';

@immutable
sealed class HistoryPageEvent {}

class HistoryPageOpened extends HistoryPageEvent {}

class UpdateValues extends HistoryPageEvent {}

class DeleteRecord extends HistoryPageEvent {
  final String path;
  DeleteRecord({required this.path});
}

class CleanHistory extends HistoryPageEvent {}

class FileDeleteAllHistory extends HistoryPageEvent {}

class LinkDeleteAllHistory extends HistoryPageEvent {}

class RescanRecord extends HistoryPageEvent {
  final String path;
  RescanRecord({required this.path});
}
