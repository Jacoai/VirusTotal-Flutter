import 'package:flutter/material.dart';
import 'package:ui_clen_api_vt/components/color_palettes/color_palette.dart';
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
      backgroundColor: ultraViolet,
      title: Align(
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(color: mintGreen),
        ),
      ),
      content: Text(
        content,
        style: const TextStyle(color: mintGreen),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            historyPageBloc.add(historyPageEvent);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ultraViolet,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: malachite,
              ),
            ),
          ),
          child: const Text(
            'Yes',
            style: TextStyle(
              color: malachite,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: ultraViolet,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: bringPink,
              ),
            ),
          ),
          child: const Text(
            'No',
            style: TextStyle(color: bringPink),
          ),
        ),
      ],
    );
  }
}
