import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_clen_api_vt/components/bloc_event_alert_dialog.dart';
import 'package:ui_clen_api_vt/components/color_palettes/vt_color_palette.dart';
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
        title: Text(
          'Vuris Total checker',
          style: TextStyle(
              color: VtColorPalette.mintGreen, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: VtColorPalette.ultraViolet,
      ),
      body: BlocProvider<HistoryPageBloc>(
          create: (context) => _historyBlock..add(HistoryPageOpened()),
          child: BlocBuilder<HistoryPageBloc, HistoryPageState>(
            builder: (context, state) {
              return Container(
                color: VtColorPalette.trueBlue,
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
                                    title: 'Clean history',
                                    content:
                                        'Are you sure, that you want to clean history?',
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: VtColorPalette.mintGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side:
                                    BorderSide(color: VtColorPalette.bringPink),
                              ),
                            ),
                            child: Text(
                              'Clean history',
                              style: TextStyle(
                                  color: VtColorPalette.bringPink,
                                  fontSize: 15),
                            ),
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: VtColorPalette.mintGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: BorderSide(
                                  color: VtColorPalette.bringPink,
                                ),
                              ),
                            ),
                            child: Text(
                              'Delete all file history ',
                              style: TextStyle(
                                  color: VtColorPalette.bringPink,
                                  fontSize: 15),
                            ),
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
                                        'Are you sure, that you want to delete all history of links ?',
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: VtColorPalette.mintGreen,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side:
                                    BorderSide(color: VtColorPalette.bringPink),
                              ),
                            ),
                            child: Text(
                              'Delete all link history',
                              style: TextStyle(
                                color: VtColorPalette.bringPink,
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.virusTotalData.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: VtColorPalette.ultraViolet,
                                width: 5,
                              ),
                            ),
                            child: HistoryCard(
                              virusTotalData: state.virusTotalData[index],
                              historyPageBloc: _historyBlock,
                            ),
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
