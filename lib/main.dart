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
      title: 'flutter_rust_bridge Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'flutter_rust_bridge'),
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
  late Future<RepoInfo> info;
  String repoName = "fzyzcjy/flutter_rust_bridge";
  @override
  void initState() {
    info = api.getRepoInfo(repoName: repoName);
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
            FutureBuilder<RepoInfo>(
              builder: (context, snapshot) {
                // debugPrint("snapshot: $snapshot");

                if (!snapshot.hasData) {
                  return const Text("Loading...");
                }
                return Column(children: [
                  Text(
                    "Repo: $repoName",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("Language: ${snapshot.data?.language}"),
                  Text("Forks: ${snapshot.data?.forks}"),
                  Text("Network Count: ${snapshot.data?.networkCount}"),
                  Text("Open Issues: ${snapshot.data?.openIssues}"),
                  Text("Subscribers Count: ${snapshot.data?.subscribersCount}"),
                  Text("Stargazers Count: ${snapshot.data?.stargazersCount}"),
                ]);
              },
              future: info,
            )
          ],
        ),
      ),
    );
  }
}


// Remember to run: 
// flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated_api.dart