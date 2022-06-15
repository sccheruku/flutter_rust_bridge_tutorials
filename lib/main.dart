import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_rust_bridge_tutorials/bridge_generated_api.dart';
import 'package:flutter_rust_bridge_tutorials/bridge_generated_counter.dart';
import 'package:flutter_rust_bridge_tutorials/bridge_generated_repo_info.dart';
import 'package:flutter_rust_bridge_tutorials/bridge_generated_ticker.dart';

const base = "rust";
final path = Platform.isWindows ? "$base.dll" : "lib$base.so";
late final dylib = Platform.isIOS
    ? DynamicLibrary.process()
    : Platform.isMacOS
        ? DynamicLibrary.executable()
        : DynamicLibrary.open(path);
late final counterApi = CounterApiImpl(dylib);
late final tickerApi = TickerApiImpl(dylib);
late final repoInfoApi = RepoInfoApiImpl(dylib);
late final api = ApiImpl(dylib);

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
  late int random;

  String repoName = "fzyzcjy/flutter_rust_bridge";
  @override
  void initState() {
    info = repoInfoApi.getRepoInfo(repoName: repoName);
    random = api.syncReturnRandomNumber().first;
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
                  Text("Random: $random")
                ]);
              },
              future: info,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    random = api.syncReturnRandomNumber().first;
                  });
                },
                child: const Text("New Random Number"))
          ],
        ),
      ),
    );
  }
}


// Remember to run: 
// flutter_rust_bridge_codegen --rust-input rust/src/api.rs --dart-output lib/bridge_generated_api.dart