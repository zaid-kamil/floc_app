import 'package:floc_app/data/floc_repo_impl.dart';
import 'package:floc_app/features/presentations/pages/image_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:floc_app/features/presentations/blocs/image_bloc.dart';

void main() {
  runApp(const FlocApp());
}

class FlocApp extends StatelessWidget {
  const FlocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImageBloc(FlocRepoImpl())..add(LoadImages()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Floc App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        darkTheme: ThemeData.dark(),
        themeMode: ThemeMode.system,
        home: const ImageListPage(),
      ),
    );
  }


}
