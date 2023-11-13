import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:ui_clen_api_vt/utilities/usecases/check_virus_usecase.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageState()) {
    on<HomePageOpened>(homePageOpened);
    on<AddToCheckQueue>(addToCheckQueue);
    on<SubmitOnCheck>(submitOnCheck);
  }

  late final VirusTotalCheckUsecase _virusTotalCheckUsecase;

  void homePageOpened(HomePageOpened event, Emitter<HomePageState> emit) async {
    _virusTotalCheckUsecase = GetIt.I.get<VirusTotalCheckUsecase>();
    _virusTotalCheckUsecase.databaseRepository.init();
  }

  Future<void> addToCheckQueue(
    AddToCheckQueue event,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(path: event.path));
  }

  Future<void> submitOnCheck(
    SubmitOnCheck event,
    Emitter<HomePageState> emit,
  ) async {
    emit(state.copyWith(isSending: true));
    VirusTotalData? data;
    int pathCount = state.pathsToScan.length;

    for (int i = 0; i < pathCount; i++) {
      try {
        data = await _virusTotalCheckUsecase.check(state.pathsToScan[0]);

        emit(state.copyWith(isSending: true, data: data));
      } catch (e, st) {
        print("$e, $st");
      }
    }
    emit(state.copyWith(isSending: false));
  }
}
