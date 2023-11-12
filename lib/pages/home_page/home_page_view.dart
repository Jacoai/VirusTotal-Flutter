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
                padding: const EdgeInsets.fromLTRB(15, 30, 10, 10),
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
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: state.pathsToScan.length,
                            padding: const EdgeInsets.all(10),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 255, 165, 0),
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
                        ),
                        Expanded(
                          flex: 3,
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: state.virusTotalData.length,
                            padding: const EdgeInsets.all(10),
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                child: Text(
                                    'Source: ${state.virusTotalData[index].source} \nHarmless:${state.virusTotalData[index].harmless} '
                                    '\nMalicious:${state.virusTotalData[index].malicious} \nSuspicious:${state.virusTotalData[index].suspicious}'
                                    '\nUndetected:${state.virusTotalData[index].undetected}\nTimeout:${state.virusTotalData[index].timeout}\n'
                                    'Date ${DateTime.fromMillisecondsSinceEpoch(state.virusTotalData[index].time * 1000)}\n'
                                    ''),
                              );
                            },
                          ),
                        ),
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
