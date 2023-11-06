part of 'home_page_bloc.dart';

@immutable
sealed class HomePageEvent {}

class HomePageOpened extends HomePageEvent {}

class AddToCheckQueue extends HomePageEvent {
  final String path;
  AddToCheckQueue({required this.path});
}

class SubmitOnCheck extends HomePageEvent {}
