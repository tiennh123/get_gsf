import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:get_gsf/get_gsf.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _gsf = 'Unknown';

  @override
  void initState() {
    super.initState();
    initGsf();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initGsf() async {
    String gsf;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      gsf = await GetGsf.gsfId;
    } on PlatformException {
      gsf = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _gsf = gsf;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_gsf\n'),
        ),
      ),
    );
  }
}
