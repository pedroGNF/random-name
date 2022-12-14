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
        backgroundColor: const Color.fromARGB(255, 41, 167, 98),
        appBar: AppBar(
          title: const Text(title),
          backgroundColor: const Color.fromARGB(255, 95, 89, 89),
        ),
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
  var letra1 = "-";
  var letra2 = "-";
  var letra3 = "-";
  var letra4 = "-";
  var letra5 = "-";
  var letra6 = "-";

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
        letra1 = vogais[0];
        letra3 = vogais[1];
        letra5 = vogais[2];
      });
    }

    void randomConsoante() {
      setState(() {
        letra2 = consoantes[0];
        letra4 = consoantes[1];
        letra6 = consoantes[2];
      });
    }

    void clearText() {
      letra1 = "-";
      letra2 = "-";
      letra3 = "-";
      letra4 = "-";
      letra5 = "-";
      letra6 = "-";
    }

    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 20));

    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            letra1,
            style: const TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 77, 20, 26),
            ),
          ),
          Text(
            letra2,
            style: const TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 77, 20, 26),
            ),
          ),
          Text(
            letra3,
            style: const TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 77, 20, 26),
            ),
          ),
          Text(
            letra4,
            style: const TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 77, 20, 26),
            ),
          ),
          Text(
            letra5,
            style: const TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 77, 20, 26),
            ),
          ),
          Text(
            letra6,
            style: const TextStyle(
              fontSize: 40,
              color: Color.fromARGB(255, 77, 20, 26),
            ),
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
            onPressed: () => setState(randomConsoante),
            child: const Text('Consoante'),
          ),
          const SizedBox(height: 1),
          ElevatedButton(
            style: style,
            onPressed: () => setState(clearText),
            child: const Text('Limpar'),
          ),
        ],
      ),
    );
  }
}
