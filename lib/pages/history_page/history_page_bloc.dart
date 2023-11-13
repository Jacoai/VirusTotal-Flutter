import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:ui_clen_api_vt/utilities/repositories/check_history_repository.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

part 'history_page_event.dart';
part 'history_page_state.dart';

class HistoryPageBloc extends Bloc<HistoryPageEvent, HistoryPageState> {
  HistoryPageBloc() : super(HistoryPageState()) {
    on<HistoryPageOpened>(historyPageOpened);
    on<UpdateValues>(updateValues);
    on<DeleteRecord>(deleteRecord);
  }
  late final CheckHistoryRepository _checkHistoryRepository;

  Future<void> historyPageOpened(
      HistoryPageOpened event, Emitter<HistoryPageState> emit) async {
    _checkHistoryRepository = GetIt.I.get<CheckHistoryRepository>();

    var valueListenableCheckHistory =
        await _checkHistoryRepository.getCheckHistoryValueListenable();

    valueListenableCheckHistory.addListener(() {
      add(UpdateValues());
    });

    add(UpdateValues());
  }

  Future<void> updateValues(
      UpdateValues event, Emitter<HistoryPageState> emit) async {
    List<VirusTotalData> virusTotalData;
    virusTotalData = _checkHistoryRepository.getAll();

    emit(state.copyWith(virusTotalData));
  }

  Future<void> deleteRecord(
      DeleteRecord event, Emitter<HistoryPageState> emit) async {
    await _checkHistoryRepository.delete(event.path);

    add(UpdateValues());
  }
}
