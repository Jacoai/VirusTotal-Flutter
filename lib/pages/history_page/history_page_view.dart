import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vuris Total checker'),
        centerTitle: true,
      ),
      body: Column(children: [
        const Text('Посмотреть историю'),
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.pushReplacementNamed(context, '/');
        //   },
        //   child: const Text('Вернуться на главный экран'),
        // ),
      ]),
    );
  }
}
