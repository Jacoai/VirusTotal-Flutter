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
            historyPageBloc.add(DeleteRecord(path: virusTotalData.source));
          },
          child: const Icon(Icons.delete_rounded),
        )
      ],
    );
  }
}

// class HistoryCard extends StatefulWidget {
//   const HistoryCard(
//       {Key? key, required this.virusTotalData, required this.historyBlock})
//       : super(key: key);

//   final VirusTotalData virusTotalData;
//   final historyBlock;
//   @override
//   // ignore: library_private_types_in_public_api
//   _HistoryCardState createState() => _HistoryCardState();
// }

// class _HistoryCardState extends State<HistoryCard> {
//   @override
//   Widget build(BuildContext context) {
//     return ExpansionTile(
//       title: Text(data.source),
//       subtitle: Text(
//         '${DateTime.fromMillisecondsSinceEpoch(data.time * 1000)}',
//       ),
//       children: [
//         ListTile(
//           title: Text('Harmless:${data.harmless} '
//               '\nMalicious:${data.malicious} \nSuspicious:${data.suspicious}'
//               '\nUndetected:${data.undetected}\nTimeout:${data.timeout}\n'),
//         ),
//         ElevatedButton(
//           onPressed: () {
//             widget.historyBlock.add(DeleteRecord(data.source));
//           },
//           child: const Icon(Icons.delete_rounded),
//         )
//       ],
//     );
//   }
// }
