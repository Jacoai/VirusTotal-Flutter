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
                    _bloc.add(AddToCheckQueue(path: text)),
                    fieldText.clear(),
                  },
                ),
              ),
              TextButton(
                onPressed: () {
                  _bloc.add(
                    SubmitOnCheck(),
                  );
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
              BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
                  //final List<String> pathsToScan = state.pathsToScan;
                  //TODO: Create Widget for queue
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: state.pathsToScan.length,
                    padding: const EdgeInsets.all(10),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Text(state.pathsToScan[index],
                            style: const TextStyle(fontSize: 22)),
                      );
                    },
                  );

                  // return Column(
                  //   children: [
                  //     Expanded(
                  //       child: ListView.builder(
                  //         scrollDirection: Axis.vertical,
                  //         shrinkWrap: true,
                  //         itemCount: 10,
                  //         padding: const EdgeInsets.all(10),
                  //         itemBuilder: (BuildContext context, int index) {
                  //           return const Text(' fgfg',
                  //               style: TextStyle(fontSize: 22));
                  //         },
                  //       ),
                  //     ),
                  //     // Row
                  //     //   children: [
                  //     //     if (state.pathsToScan.isNotEmpty)
                  //     //       ...state.pathsToScan
                  //     //           .map((e) => Text("${e.toString()}  ")),
                  //     //   ],
                  //     // ),
                  //     Column(
                  //       children: [
                  //         if (state.virusTotalData.isNotEmpty)
                  //           ...state.virusTotalData.map((data) => Text(
                  //               'Source: ${data.source} \nHarmless:${data.harmless} '
                  //               '\nMalicious:${data.malicious} \nSuspicious:${data.suspicious}'
                  //               '\nUndetected:${data.undetected}\nTimeout:${data.timeout}\n'
                  //               'Date ${DateTime.fromMillisecondsSinceEpoch(data.time * 1000)}\n')),
                  //       ],
                  //     )
                  //   ],
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// BlocBuilder<HomePageBloc, HomePageState>(
              //   builder: (context, state) {
              // return Padding(
              //   padding: const EdgeInsets.fromLTRB(15, 30, 10, 10),
              //   child: TextField(
              //     expands: false,
              //     decoration: const InputDecoration(
              //       border: OutlineInputBorder(),
              //       icon: Icon(Icons.login),
              //       hintText: 'Введте ссылку',
              //       helperText: 'Ссылку, которую нужно проверить',
              //     ),
              //     onSubmitted: (text) => {
              //       _bloc.add(AddToCheckQueue(path: text)),
              //     },
              //   ),
              // );
              //   },
              // )