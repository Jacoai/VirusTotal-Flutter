import 'package:flutter/material.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key, required this.virusTotalData}) : super(key: key);

  final VirusTotalData virusTotalData;
  @override
  // ignore: library_private_types_in_public_api
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.virusTotalData.source),
      subtitle: Text(
        '${DateTime.fromMillisecondsSinceEpoch(widget.virusTotalData.time * 1000)}',
      ),
      children: [
        ListTile(
          title: Text('Harmless:${widget.virusTotalData.harmless} '
              '\nMalicious:${widget.virusTotalData.malicious} \nSuspicious:${widget.virusTotalData.suspicious}'
              '\nUndetected:${widget.virusTotalData.undetected}\nTimeout:${widget.virusTotalData.timeout}\n'),
        ),
      ],
    );
  }
}
