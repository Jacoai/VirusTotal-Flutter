import 'package:flutter/material.dart';
import 'package:virus_total_cli/virus_total_cli.dart';

class HistoryCard extends StatefulWidget {
  const HistoryCard({Key? key, required this.virusTotalData}) : super(key: key);

  final VirusTotalData virusTotalData;
  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 255, 0, 0),
          width: 15,
        ),
      ),
      child: ExpansionPanelList(
        children: [
          ExpansionPanel(
            headerBuilder: (context, isOpen) {
              return Text(widget.virusTotalData.source);
            },
            body: Text(
                '\nMalicious:${widget.virusTotalData.malicious} \nSuspicious:${widget.virusTotalData.suspicious}'
                '\nUndetected:${widget.virusTotalData.undetected}\nTimeout:${widget.virusTotalData.timeout}\n'
                'Date ${DateTime.fromMillisecondsSinceEpoch(widget.virusTotalData.time * 1000)}\n'),
          )
        ],
      ),
    );
    // child: Text(
    //     'Source: ${widget.virusTotalData.source} \nHarmless:${widget.virusTotalData.harmless} '
    //     '\nMalicious:${widget.virusTotalData.malicious} \nSuspicious:${widget.virusTotalData.suspicious}'
    //     '\nUndetected:${widget.virusTotalData.undetected}\nTimeout:${widget.virusTotalData.timeout}\n'
    //     'Date ${DateTime.fromMillisecondsSinceEpoch(widget.virusTotalData.time * 1000)}\n'),
  }
}
