import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:ui_clen_api_vt/components/color_palettes/color_palette.dart';

import 'package:ui_clen_api_vt/pages/home_page/home_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = HomePageBloc();
  final fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Vuris Total checker',
          style: TextStyle(
            color: VtColorPalette.mintGreen,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        backgroundColor: VtColorPalette.ultraViolet,
      ),
      body: BlocProvider<HomePageBloc>(
        create: (context) => _bloc
          ..add(
            HomePageOpened(),
          ),
        child: Container(
          color: VtColorPalette.trueBlue,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 10, 0),
                child: TextField(
                  style: TextStyle(color: VtColorPalette.mintGreen),
                  controller: fieldText,
                  expands: false,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(30),
                      ),
                      borderSide: BorderSide(
                        color: VtColorPalette.ultraViolet,
                        width: 5,
                      ),
                    ),
                    icon: const Icon(Icons.input),
                    hintText: 'Input link',
                    helperText: 'Press Enter to add the link to queue',
                    helperStyle: TextStyle(
                      color: VtColorPalette.mintGreen,
                      fontWeight: FontWeight.w300,
                    ),
                    hintStyle: TextStyle(
                      color: VtColorPalette.mintGreen,
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 1,
                    ),
                    iconColor: VtColorPalette.mintGreen,
                  ),
                  onSubmitted: (text) => {
                    _bloc.add(
                      AddToCheckQueue(path: text),
                    ),
                    fieldText.clear(),
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Pick file',
                      style: TextStyle(
                        color: VtColorPalette.mintGreen,
                        fontSize: 14,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles();
                        if (result == null) {
                          return;
                        }
                        final file = result.files.first;
                        _bloc.add(AddToCheckQueue(path: file.path!));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: VtColorPalette.mintGreen,
                      ),
                      child: const Icon(Icons.file_open_outlined),
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  if (_bloc.state.isSending == true ||
                      _bloc.state.pathsToScan.isEmpty) {
                  } else {
                    _bloc.add(SubmitOnCheck());
                  }
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    VtColorPalette.ultraViolet,
                  ),
                ),
                child: Text(
                  "Отправить на проверку",
                  style: TextStyle(
                    color: VtColorPalette.mintGreen,
                    fontSize: 16,
                  ),
                ),
              ),
              Expanded(
                child: BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        //Queque
                        state.pathsToScan.isNotEmpty
                            ? Container(
                                margin: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      color: VtColorPalette.ultraViolet,
                                      width: 5),
                                ),
                                child: Expanded(
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: state.pathsToScan.length,
                                    padding: const EdgeInsets.all(10),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                15, 3, 3, 3),
                                            child: Text(
                                              state.pathsToScan[index],
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: VtColorPalette.mintGreen,
                                              ),
                                            ),
                                          ),
                                          state.isSending
                                              ? Container(
                                                  height: 25,
                                                  width: 25,
                                                  margin:
                                                      const EdgeInsets.fromLTRB(
                                                          25, 5, 5, 5),
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: VtColorPalette
                                                        .mintGreen,
                                                    backgroundColor:
                                                        VtColorPalette
                                                            .ultraViolet,
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                        //Scan result
                        state.virusTotalData.isNotEmpty
                            ? Expanded(
                                flex: 2,
                                child: Container(
                                  margin: const EdgeInsets.all(8.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: VtColorPalette.amethyst,
                                      width: 5,
                                    ),
                                  ),
                                  child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    itemCount: state.virusTotalData.length,
                                    padding: const EdgeInsets.all(10),
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: VtColorPalette.amethyst,
                                            width: 5,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(30),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Source: ${state.virusTotalData[index].source}\n'
                                                'Total ${state.virusTotalData[index].harmless + state.virusTotalData[index].malicious + state.virusTotalData[index].suspicious + state.virusTotalData[index].timeout + state.virusTotalData[index].undetected}',
                                                style: TextStyle(
                                                  color:
                                                      VtColorPalette.mintGreen,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              state.virusTotalData[index].isFile
                                                  ? Text(
                                                      'Undetached:${state.virusTotalData[index].undetected}',
                                                      style: TextStyle(
                                                        color: VtColorPalette
                                                            .malachite,
                                                        fontSize: 15,
                                                      ),
                                                    )
                                                  : Text(
                                                      'Harmless:${state.virusTotalData[index].harmless}',
                                                      style: TextStyle(
                                                        color: VtColorPalette
                                                            .malachite,
                                                        fontSize: 15,
                                                      ),
                                                    )
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              )
                            : Container(),
                      ],
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/history');
                    //   Navigator.pushReplacementNamed(
                    //       context, '/history');
                  },
                  child: const Text('Посмотреть историю'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
