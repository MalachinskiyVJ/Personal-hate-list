import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:personal_hate_list/app_theme.dart';
import 'package:personal_hate_list/bloc/bloc.dart';
import 'package:personal_hate_list/bloc/events.dart';
import 'package:personal_hate_list/ui/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppThemes.appThemeData[AppTheme.darkTheme],
      home: const MyHomePage(title: '👹 - 👼'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocProvider(
        create: (context) => UsersBloc()..add(LoadUsersEvent()),
        child: const MainScreen(),
      ),
    );
  }
}
