import 'package:flutter/material.dart';
import 'package:ui_clen_api_vt/components/bloc_event_alert_dialog.dart';
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return BlocEventAlerDialog(
                        historyPageBloc: historyPageBloc,
                        historyPageEvent:
                            DeleteRecord(path: virusTotalData.source),
                        title: 'Delete the record',
                        content:
                            'Are you sure, that you want to delete the record with sourсe: ${virusTotalData.source}',
                      );
                    },
                  );
                },
                child: const Icon(Icons.delete_rounded),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return BlocEventAlerDialog(
                        historyPageBloc: historyPageBloc,
                        historyPageEvent: RescanRecord(
                          path: virusTotalData.source,
                          isFile: virusTotalData.isFile,
                          key: virusTotalData.isFile
                              ? virusTotalData.md5!
                              : virusTotalData.source,
                        ),
                        title: 'Rescan the record',
                        content:
                            'Are you sure, that you want to rescan the record with sourсe: ${virusTotalData.source}',
                      );
                    },
                  );
                },
                child: const Text('Rescan this record'),
              ),
            ],
          ),
        )
      ],
    );
  }
}
