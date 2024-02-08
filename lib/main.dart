import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  var _incrementCount = 0;
  var _dicrementCount = 0;
  bool _hasError = false;

  void _incrementCounter() {
    setState(() {
      _incrementCount++;
      _counter++;
    });
  }

  void _dicrementCounter() {
    setState(() {
      if (_counter > 0) {
        _dicrementCount++;
        _counter--;
      }
      if (_counter == 0) {
        const snackBar =
            SnackBar(content: Text('Больше вы не можете уменьшить счётчик!'));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Вы нажали на кнопку столько раз ->',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(
              height: 10,
            ),
            Text(_hasError
                ? 'Ошибка при вводе числа - число должно быть больше 0!'
                : ''),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Прибавляли $_incrementCount раз  ',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              FloatingActionButton(
                onPressed: _incrementCounter,
                child: const Icon(Icons.add),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Вычитали $_dicrementCount раз  ',
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              FloatingActionButton(
                onPressed: _dicrementCounter,
                child: const Icon(Icons.remove),
              )
            ],
          ),
        ],
      ),
    );
  }
}
