import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_rust_bridge_tutorials/bridge_generated_api.dart';

const base = "rust";
final path = Platform.isWindows ? "$base.dll" : "lib$base.so";
late final dylib = Platform.isIOS
    ? DynamicLibrary.process()
    : Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open(path);
late final api = RustImpl(dylib);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<int> counter;
  late Stream<int> ticks;

  @override
  void initState() {
    counter = api.getCounter();
    ticks = api.tick();
  }

  void _incrementCounter() {
    setState(() {
      counter = api.increment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Ticker has been running for: ',
            ),
            StreamBuilder(
                stream: ticks,
                builder: (context, snap) {
                  final data = snap.data;
                  if (data != null) return Text("$data second(s)");
                  return const CircularProgressIndicator();
                })
          ],
        ),
      ),
    );
  }
}


// Remember to run: 
// flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated_api.dart