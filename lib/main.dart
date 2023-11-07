import 'package:flutter/material.dart';
import 'package:ui_clen_api_vt/pages/home_page/home_page_view.dart';
import 'package:ui_clen_api_vt/utilities/injectable.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Virus Total Api',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 125, 194, 173)),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
