import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Colors.blue[100],
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'MyHomePage',
                style: TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CounterA(counter: counter, increment: increment),
            SizedBox(
              height: 20.0,
            ),
            Middle(counter: counter),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class CounterA extends StatelessWidget {
  final int counter;
  final void Function() increment;

  const CounterA({Key? key, required this.counter, required this.increment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(
            '$counter',
            style: TextStyle(fontSize: 48.0),
          ),
          ElevatedButton(
            // inversion of control
            onPressed: increment,
            child: Text(
              'Increment',
              style: TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
    );
  }
}

class Middle extends StatelessWidget {
  final int counter;

  const Middle({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        // Row의 사이는 children이 필요한 사이즈만 가지도록 설정
        mainAxisSize: MainAxisSize.min,
        children: [
          CounterB(counter: counter),
          SizedBox(
            width: 20.0,
          ),
          Sibling(),
        ],
      ),
    );
  }
}

class CounterB extends StatelessWidget {
  final int counter;

  const CounterB({Key? key, required this.counter}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow[100],
      padding: const EdgeInsets.all(10.0),
      child: Text(
        '$counter',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}

class Sibling extends StatelessWidget {
  const Sibling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange[100],
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Sibling',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
