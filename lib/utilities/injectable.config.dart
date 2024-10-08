// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'repositories/check_virus_repository.dart' as _i4;
import 'repositories/check_history_repository.dart' as _i3;
import 'usecases/check_virus_usecase.dart' as _i5;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.CheckHistoryRepository>(_i3.CheckHistoryRepository());
    gh.singleton<_i4.ReportCheckRepository>(_i4.ReportCheckRepository());
    gh.singleton<_i5.VirusTotalCheckUsecase>(_i5.VirusTotalCheckUsecase(
      gh<_i4.ReportCheckRepository>(),
      gh<_i3.CheckHistoryRepository>(),
    ));
    return this;
  }
}
