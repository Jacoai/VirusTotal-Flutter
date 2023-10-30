part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class HomePageOpened extends HomePageEvent {}

class UrlSubmit extends HomePageEvent {
  final String urlPath;

  UrlSubmit({required this.urlPath});
}

class FileSubmit extends HomePageEvent {
  final String filePath;

  FileSubmit({required this.filePath});
}
