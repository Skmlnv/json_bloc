import 'package:expanded_cell/api/get_post.dart';
import 'package:expanded_cell/blocs/post/bloc.dart';
import 'package:expanded_cell/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expanded Cell',
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => PostBloc(url: FetchPost()),
        child: HomePage(),
      ),
    );
  }
}
