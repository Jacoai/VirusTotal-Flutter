import 'package:flutter/material.dart';
import 'package:ui_clen_api_vt/components/bloc_event_alert_dialog.dart';
import 'package:ui_clen_api_vt/components/color_palettes/color_palette.dart';
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
      backgroundColor: ultraViolet,
      title: Text(
        virusTotalData.source,
        style: TextStyle(
          color: (virusTotalData.malicious > 0) ? bringPink : malachite,
          fontSize: 17,
        ),
      ),
      subtitle: Text(
        '${DateTime.fromMillisecondsSinceEpoch(virusTotalData.time * 1000)}',
        style: const TextStyle(
          color: mintGreen,
        ),
      ),
      children: [
        Row(
          children: [
            Expanded(
              child: ListTile(
                title: Text('Harmless:${virusTotalData.harmless}'
                    '\nUndetected:${virusTotalData.undetected}\n'
                    'Timeout:${virusTotalData.timeout}'),
                textColor: malachite,
              ),
            ),
            Expanded(
              flex: 5,
              child: ListTile(
                title: Text('Malicious:${virusTotalData.malicious}\n'
                    'Suspicious:${virusTotalData.suspicious}\n'),
                textColor: bringPink,
              ),
            ),
          ],
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
                child: const Icon(Icons.delete_rounded, color: bringPink),
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
