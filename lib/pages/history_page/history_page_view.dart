import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_clen_api_vt/components/bloc_event_alert_dialog.dart';
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
                                    historyPageBloc: _historyBlock,
                                    historyPageEvent: CleanHistory(),
                                    title: 'Deleting all history',
                                    content:
                                        'Are you sure, that you want to delete all history?',
                                  );
                                },
                              );
                            },
                            child: const Text('delete all history'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return BlocEventAlerDialog(
                                    historyPageBloc: _historyBlock,
                                    historyPageEvent: FileDeleteAllHistory(),
                                    title: 'Deleting all history of files',
                                    content:
                                        'Are you sure, that you want to delete all history of files?',
                                  );
                                },
                              );
                            },
                            child:
                                const Text('Delete all file history of links'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return BlocEventAlerDialog(
                                    historyPageBloc: _historyBlock,
                                    historyPageEvent: LinkDeleteAllHistory(),
                                    title: 'Deleting all history',
                                    content:
                                        'Are you sure, that you want to delete all history of links \?',
                                  );
                                },
                              );
                            },
                            child: const Text('Delete all link history'),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.virusTotalData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return HistoryCard(
                            virusTotalData: state.virusTotalData[index],
                            historyPageBloc: _historyBlock,
                          );
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
