import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

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
        title: const Text('Vuris Total checker'),
        centerTitle: true,
        backgroundColor: Colors.green[300],
      ),
      body: BlocProvider<HomePageBloc>(
        create: (context) => _bloc
          ..add(
            HomePageOpened(),
          ),
        child: Container(
          color: Colors.green[200],
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 30, 10, 0),
                child: TextField(
                  controller: fieldText,
                  expands: false,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    icon: Icon(Icons.login),
                    hintText: 'Введте ссылку',
                    helperText: 'Ссылку, которую нужно проверить',
                  ),
                  onSubmitted: (text) => {
                    _bloc.add(
                      AddToCheckQueue(path: text),
                    ),
                    fieldText.clear(),
                  },
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
                  child: const Icon(Icons.file_open_outlined),
                ),
              ),
              //TODO: block button after press
              TextButton(
                onPressed: () {
                  _bloc.add(SubmitOnCheck());
                },
                style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 226, 125, 95),
                  ),
                ),
                child: const Text(
                  "Отправить на проверку",
                  style: TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
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
                            ? Expanded(
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: state.pathsToScan.length,
                                  padding: const EdgeInsets.all(10),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                          color: const Color.fromARGB(
                                              255, 255, 165, 0),
                                          width: 4,
                                        ),
                                      ),
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        state.pathsToScan[index],
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    );
                                  },
                                ),
                              )
                            : Container(),
                        state.virusTotalData.isNotEmpty
                            ? Expanded(
                                flex: 3,
                                child: ListView.builder(
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: state.virusTotalData.length,
                                  padding: const EdgeInsets.all(10),
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      //TODO: add undetached for file
                                      child: Text(
                                          'Source: ${state.virusTotalData[index].source} \nHarmless:${state.virusTotalData[index].harmless}\n'
                                          'Total ${state.virusTotalData[index].harmless + state.virusTotalData[index].malicious + state.virusTotalData[index].suspicious + state.virusTotalData[index].timeout + state.virusTotalData[index].undetected}\n'
                                          'Date ${DateTime.fromMillisecondsSinceEpoch(state.virusTotalData[index].time * 1000)}\n'
                                          ''),
                                    );
                                  },
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
