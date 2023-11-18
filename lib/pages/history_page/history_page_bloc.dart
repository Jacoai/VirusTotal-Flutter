import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:ui_clen_api_vt/utilities/usecases/check_virus_usecase.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

part 'history_page_event.dart';
part 'history_page_state.dart';

class HistoryPageBloc extends Bloc<HistoryPageEvent, HistoryPageState> {
  HistoryPageBloc() : super(HistoryPageState()) {
    on<HistoryPageOpened>(historyPageOpened);
    on<UpdateValues>(updateValues);
    on<DeleteRecord>(deleteRecord);
    on<CleanHistory>(cleanHistory);
    on<FileDeleteAllHistory>(fileDeleteAllHistory);
    on<LinkDeleteAllHistory>(linkDeleteAllHistory);
    on<RescanRecord>(rescanRecord);
  }
  late final VirusTotalCheckUsecase _virusTotalCheckUsecase;

  Future<void> historyPageOpened(
      HistoryPageOpened event, Emitter<HistoryPageState> emit) async {
    _virusTotalCheckUsecase = GetIt.I.get<VirusTotalCheckUsecase>();

    var valueListenableCheckHistory = await _virusTotalCheckUsecase
        .databaseRepository
        .getCheckHistoryValueListenable();

    valueListenableCheckHistory.addListener(() {
      add(UpdateValues());
    });

    add(UpdateValues());
  }

  Future<void> updateValues(
      UpdateValues event, Emitter<HistoryPageState> emit) async {
    List<VirusTotalData> virusTotalData;
    virusTotalData = _virusTotalCheckUsecase.databaseRepository.getAll();

    emit(state.copyWith(virusTotalData));
  }

  Future<void> deleteRecord(
      DeleteRecord event, Emitter<HistoryPageState> emit) async {
    await _virusTotalCheckUsecase.databaseRepository.deletePath(event.path);

    add(UpdateValues());
  }

  Future<void> cleanHistory(
      CleanHistory event, Emitter<HistoryPageState> emit) async {
    await _virusTotalCheckUsecase.databaseRepository.clear();
  }

  Future<void> fileDeleteAllHistory(
      FileDeleteAllHistory event, Emitter<HistoryPageState> emit) async {
    await _virusTotalCheckUsecase.databaseRepository.fileDeleteAllHistory();
  }

  Future<void> linkDeleteAllHistory(
      LinkDeleteAllHistory event, Emitter<HistoryPageState> emit) async {
    await _virusTotalCheckUsecase.databaseRepository.linkDeleteAllHistory();
  }

  Future<void> rescanRecord(
      RescanRecord event, Emitter<HistoryPageState> emit) async {
    await _virusTotalCheckUsecase.rescan(
      path: event.path,
      isFile: event.isFile,
      key: event.key,
    );
    add(UpdateValues());
  }
}
