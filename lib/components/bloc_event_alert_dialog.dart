import 'package:flutter/material.dart';
import 'package:ui_clen_api_vt/pages/history_page/history_page_bloc.dart';

class BlocEventAlerDialog extends StatelessWidget {
  const BlocEventAlerDialog(
      {super.key,
      required this.historyPageBloc,
      required this.historyPageEvent,
      required this.title,
      required this.content});

  final HistoryPageBloc historyPageBloc;
  final HistoryPageEvent historyPageEvent;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            historyPageBloc.add(historyPageEvent);
            Navigator.of(context).pop();
          },
          child: const Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('No'),
        )
      ],
    );
  }
}
