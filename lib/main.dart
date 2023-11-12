import 'package:flutter/material.dart';

import 'package:ui_clen_api_vt/pages/history_page/history_page_view.dart';
import 'package:ui_clen_api_vt/pages/home_page/home_page_view.dart';
import 'package:ui_clen_api_vt/utilities/injectable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
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
