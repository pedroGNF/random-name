import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'Name Generator';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      showSemanticsDebugger: false,
      showPerformanceOverlay: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(title: const Text(title)),
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
  var contador = "nome";

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

    void randomVogal() {
      setState(() {
        contador = vogais[0];
      });
    }

    void randomConsoante() {
      setState(() {
        contador = consoantes[0];
      });
    }

    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            contador,
            style: Theme.of(context).textTheme.headline4,
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: style,
            onPressed: () => {randomVogal()},
            child: const Text('Vogal'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            style: style,
            onPressed: () => {randomConsoante()},
            child: const Text('Consoante'),
          ),
        ],
      ),
    );
  }
}
