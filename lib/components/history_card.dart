import 'package:flutter/material.dart';
import 'package:ui_clen_api_vt/pages/history_page/history_page_bloc.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard(
      {super.key, required this.virusTotalData, required this.historyPageBloc});

  final VirusTotalData virusTotalData;
  final HistoryPageBloc historyPageBloc;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(virusTotalData.source),
      subtitle: Text(
        '${DateTime.fromMillisecondsSinceEpoch(virusTotalData.time * 1000)}',
      ),
      children: [
        ListTile(
          title: Text('Harmless:${virusTotalData.harmless} '
              '\nMalicious:${virusTotalData.malicious} \nSuspicious:${virusTotalData.suspicious}'
              '\nUndetected:${virusTotalData.undetected}\nTimeout:${virusTotalData.timeout}\n'),
        ),
        ElevatedButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Delete'),
                  content: Text('Are you sure, that you want to delete'
                      'the record with sourсe: ${virusTotalData.source}'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        historyPageBloc
                            .add(DeleteRecord(path: virusTotalData.source));
                        Navigator.of(context).pop();
                      },
                      child: const Text('Yes, delete'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('No, don\'t delete'),
                    )
                  ],
                );
              },
            );
          },
          child: const Icon(Icons.delete_rounded),
        )
      ],
    );
  }
}
