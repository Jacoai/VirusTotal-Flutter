import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_clen_api_vt/pages/history_page/history_page_view.dart';
import 'package:ui_clen_api_vt/pages/home_page/home_page_view.dart';
import 'package:ui_clen_api_vt/utilities/injectable.dart';
import 'package:ui_clen_api_vt/utilities/repositories/database_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  final DatabaseRepository databaseRepository =
      GetIt.I.get<DatabaseRepository>();
  await databaseRepository.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Virus Total Api',
      theme: ThemeData(useMaterial3: true),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/history': (context) => const HistoryPage(),
      },
    );
  }
}
