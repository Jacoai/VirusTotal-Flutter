part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class HomePageOpened extends HomePageEvent {}

class SubmitOnCheck extends HomePageEvent {
  final String urlPath;

  SubmitOnCheck({required this.urlPath});
}
