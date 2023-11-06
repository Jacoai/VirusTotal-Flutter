import 'package:flutter/material.dart';
import 'package:ui_clen_api_vt/pages/home_page/home_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: BlocProvider<HomePageBloc>(
        create: (context) => HomePageBloc()..add(HomePageOpened()),
        child: Container(
          color: Colors.green[100],
          child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                    return TextField(
                      expands: false,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        icon: Icon(Icons.login),
                        hintText: 'Введте ссылку',
                        helperText: 'Ссылку, которую нужно проверить',
                      ),
                      onSubmitted: (text) => {
                        context
                            .read<HomePageBloc>()
                            .add(SubmitOnCheck(urlPath: text))
                      },
                    );
                  })
                ],
              )),
        ),
      ),
    );
  }
}
