import 'package:flutter/material.dart';
import 'utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tictactoe',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'TicTacToe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Player {
  static const none = '';
  static const X = 'X';
  static const O = 'O';
}

class _MyHomePageState extends State<MyHomePage> {
  static final countMatrix = 3;
  static final double size = 96;

 late List<List<String>> matrix;
  @override
  void initState() {
    super.initState();

    setEmptyFields();
  }

  void setEmptyFields() => setState(
        () => matrix = List.generate(
          countMatrix,
          (_) => List.generate(countMatrix, (_) => Player.none),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffd4f6cc),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: Utils.modelBuilder(matrix, (x, value) => buildRow(x)),
      ),
    );
  }

  Widget buildRow(int x) {
    final values = matrix[x];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Utils.modelBuilder(
        values,
        (y, value) => buildField(x, y),
      ),
    );
  }

  Widget buildField(int x, int y) {
    final value = matrix[x][y];

    return Container(
      margin: EdgeInsets.all(5),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(size, size),
          primary: Colors.indigo
        ),
        onPressed: () {},
        child: Text(
          value,
          style: TextStyle(fontSize: 32),
        ),
      ),
    );
  }
}
