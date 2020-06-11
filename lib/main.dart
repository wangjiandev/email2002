import 'package:emailapp2020/app.dart';
import 'package:flutter/material.dart';

import 'overseer.dart';
import 'provider.dart';
import 'ugly_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      data: Overseer(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: UglyProvider(
          child: App(),
        ),
      ),
    );
  }
}
