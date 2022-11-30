import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Gerador de nomes aleatório';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const MyStatefulWidget(),
      ),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

extension Shuffle on String {
  String get shuffled => (split('')..shuffle()).join('');
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  var contador = 'banana';

  void aleatorio() {
    setState(() {
      contador;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> vogais = [
      "b",
      "c",
      "d",
      "f",
      "g",
      "h",
      "j",
      "k",
      "l",
      "m",
      "n",
      "p",
      "q",
      "v",
      "x",
      "w",
      "y",
      "z"
    ];
    vogais.shuffle();
    if (kDebugMode) {
      print(vogais);
    }

    List<String> consoantes = ["a", "e", "i", "o", "u"];
    consoantes.shuffle();
    if (kDebugMode) {
      print(consoantes);
    }

    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            'contador',
            style: Theme.of(context).textTheme.headline4,
          ),
          ElevatedButton(
            style: style,
            onPressed: () => {vogais[0]},
            child: const Text('Vogal'),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () => {aleatorio()},
            child: const Text('Consoante'),
          ),
        ],
      ),
    );
  }
}
