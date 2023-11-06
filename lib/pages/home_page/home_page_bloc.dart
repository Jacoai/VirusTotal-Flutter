import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:ui_clen_api_vt/utilities/usecases/check_virus_usecase.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(const HomePageState()) {
    on<HomePageOpened>(homePageOpened);
    on<SubmitOnCheck>(submitOnCheck);
  }

  late final VirusTotalCheckUsecase _virusTotalCheckUsecase;

  void homePageOpened(HomePageOpened event, Emitter<HomePageState> emit) {
    _virusTotalCheckUsecase = GetIt.I.get<VirusTotalCheckUsecase>();
  }

  Future<void> submitOnCheck(
      SubmitOnCheck event, Emitter<HomePageState> emit) async {
    await _virusTotalCheckUsecase.check(event.urlPath);
  }
}
