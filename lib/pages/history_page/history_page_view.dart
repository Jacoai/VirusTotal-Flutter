import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_clen_api_vt/components/history_card.dart';
import 'package:ui_clen_api_vt/pages/history_page/history_page_bloc.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final _historyBlock = HistoryPageBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vuris Total checker'),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),
      body: BlocProvider<HistoryPageBloc>(
          create: (context) => _historyBlock..add(HistoryPageOpened()),
          child: BlocBuilder<HistoryPageBloc, HistoryPageState>(
            builder: (context, state) {
              return Container(
                color: Colors.green[200],
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.virusTotalData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HistoryCard(
                              virusTotalData: state.virusTotalData[index]);
                          // return Container(
                          //   child: Text(
                          //       'Source: ${state.virusTotalData[index].source} \nHarmless:${state.virusTotalData[index].harmless} '
                          //       '\nMalicious:${state.virusTotalData[index].malicious} \nSuspicious:${state.virusTotalData[index].suspicious}'
                          //       '\nUndetected:${state.virusTotalData[index].undetected}\nTimeout:${state.virusTotalData[index].timeout}\n'
                          //       'Date ${DateTime.fromMillisecondsSinceEpoch(state.virusTotalData[index].time * 1000)}\n'),
                          // );
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          )),
    );
  }
}
